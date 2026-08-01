package com.monomarket.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.dto.OrderDto;
import com.monomarket.dto.OrderItemDto;
import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Order;
import com.monomarket.entity.OrderItem;
import com.monomarket.entity.User;
import com.monomarket.exception.OutOfStockException;
import com.monomarket.repository.CartRepository;
import com.monomarket.repository.InventoryItemRepository;
import com.monomarket.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderService {

  private final OrderRepository orderRepository;
  private final CartRepository cartRepository;
  private final InventoryItemRepository inventoryItemRepository;

  // 1. Checkout: Chuyển Cart → Order, lock inventory, xóa cart
  public Order checkout(User user, String shippingAddress) {
    // Lấy giỏ hàng hiện tại của user đã đăng nhập (kèm items và thông tin product)
    Cart cart = cartRepository.findByUserIdWithItems(user.getId())
        .orElseThrow(() -> new IllegalStateException("Cart not found"));

    // Validate: giỏ hàng không được rỗng
    if (cart.getItems().isEmpty()) {
      throw new IllegalStateException("Cannot checkout with an empty cart");
    }

    // Bước 1: Lấy danh sách ID các InventoryItem trong giỏ hàng
    List<Long> inventoryIds = cart.getItems().stream()
        .map(CartItem::getInventoryItem)
        .map(InventoryItem::getId)
        .toList();

    // Bước 2: Lock toàn bộ InventoryItem bằng SELECT ... FOR UPDATE (Pessimistic
    // Write Lock)
    // → Ngăn race condition: request khác sẽ bị block cho đến khi transaction này
    // commit
    List<InventoryItem> lockedItems = inventoryItemRepository.findAllByIdForUpdate(inventoryIds);

    // Bước 3: Validate từng sản phẩm — phải còn AVAILABLE
    // Nếu có món nào không AVAILABLE, thu thập tên sản phẩm để thông báo cho user
    List<String> unavailableItems = new ArrayList<>();
    for (InventoryItem inv : lockedItems) {
      if (!"AVAILABLE".equals(inv.getStatus())) {
        String title = inv.getProduct().getTitleEn() != null
            ? inv.getProduct().getTitleEn()
            : inv.getProduct().getTitleJa();
        unavailableItems.add(title);
      }
    }

    // Nếu có bất kỳ món nào không còn hàng → ném exception, rollback toàn bộ
    // transaction
    if (!unavailableItems.isEmpty()) {
      throw new OutOfStockException(unavailableItems);
    }

    // Bước 4: Tạo Order mới
    Order order = new Order();
    order.setUser(user);
    order.setShippingAddress(shippingAddress);
    order.setStatus("PENDING");

    // Bước 5: Tính tổng tiền + tạo từng OrderItem + chuyển status inventory
    BigDecimal total = BigDecimal.ZERO;
    for (InventoryItem inv : lockedItems) {
      // Snapshot giá tại thời điểm đặt hàng — không bị ảnh hưởng nếu giá thay đổi sau
      OrderItem orderItem = new OrderItem();
      orderItem.setOrder(order);
      orderItem.setInventoryItem(inv);
      orderItem.setPrice(inv.getPrice());
      order.getItems().add(orderItem);

      total = total.add(inv.getPrice());

      // Lock inventory: AVAILABLE → RESERVED
      // Không cần gọi .save() — Hibernate Dirty Checking sẽ tự UPDATE khi commit
      inv.setStatus("RESERVED");
    }

    order.setTotalPrice(total);

    // Bước 6: Lưu Order vào DB
    Order savedOrder = orderRepository.save(order);

    // Bước 7: Xóa Cart sau khi đặt hàng thành công
    // Cart entity có cascade = ALL, orphanRemoval = true → CartItems tự xóa theo
    cartRepository.delete(cart);

    return savedOrder;
  }

  // 2. Lấy danh sách đơn hàng của user — dùng JOIN FETCH tránh N+1 query
  @Transactional(readOnly = true)
  public List<OrderDto> getOrdersByUser(User user) {
    List<Order> orders = orderRepository.findByUserIdWithDetails(user.getId());
    return orders.stream().map(this::toOrderDto).toList();
  }

  // 3. Lấy chi tiết 1 đơn hàng — kiểm tra quyền sở hữu
  @Transactional(readOnly = true)
  public OrderDto getOrderDetail(Long orderId, User user) {
    // JOIN FETCH để tránh LazyInitializationException khi render Thymeleaf template
    Order order = orderRepository.findByIdWithDetails(orderId)
        .orElseThrow(() -> new IllegalArgumentException("Order not found: " + orderId));

    // Bảo vệ: user chỉ được xem đơn của chính mình
    if (!order.getUser().getId().equals(user.getId())) {
      throw new IllegalArgumentException("Access denied");
    }

    return toOrderDto(order);
  }

  // 4. Hủy đơn hàng: chỉ cho phép khi status = PENDING, đồng thời chuyển inventory RESERVED -> AVAILABLE
  public void cancelOrder(Long orderId, User user) {
    Order order = orderRepository.findByIdWithDetails(orderId)
        .orElseThrow(() -> new IllegalArgumentException("Order not found: " + orderId));

    // Bảo vệ: user chỉ được hủy đơn của chính mình
    if (!order.getUser().getId().equals(user.getId())) {
      throw new IllegalArgumentException("Access denied");
    }

    // Chỉ cho phép hủy đơn khi trạng thái là PENDING
    if (!"PENDING".equals(order.getStatus())) {
      throw new IllegalStateException("Only orders in PENDING status can be cancelled");
    }

    // Chuyển trạng thái đơn hàng -> CANCELLED
    order.setStatus("CANCELLED");

    // Chuyển toàn bộ InventoryItem về trạng thái AVAILABLE cho người khác mua
    for (OrderItem item : order.getItems()) {
      InventoryItem inv = item.getInventoryItem();
      if ("RESERVED".equals(inv.getStatus())) {
        inv.setStatus("AVAILABLE");
      }
    }
  }

  // 5. Private helper: Convert Order Entity → OrderDto để truyền sang View
  private OrderDto toOrderDto(Order order) {
    List<OrderItemDto> itemDtos = order.getItems().stream()
        .map(item -> new OrderItemDto(
            item.getInventoryItem().getProduct().getTitleEn() != null
                ? item.getInventoryItem().getProduct().getTitleEn()
                : item.getInventoryItem().getProduct().getTitleJa(),
            item.getInventoryItem().getConditionRank(),
            item.getInventoryItem().getInstoreCode(),
            item.getPrice()))
        .toList();

    return new OrderDto(
        order.getId(),
        order.getCreatedAt(),
        order.getStatus(),
        order.getTotalPrice(),
        order.getShippingAddress(),
        itemDtos);
  }
}