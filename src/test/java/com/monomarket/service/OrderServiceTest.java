package com.monomarket.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.monomarket.dto.OrderDto;
import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Order;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;
import com.monomarket.exception.OutOfStockException;
import com.monomarket.repository.CartRepository;
import com.monomarket.repository.InventoryItemRepository;
import com.monomarket.repository.OrderRepository;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

  @Mock
  private OrderRepository orderRepository;

  @Mock
  private CartRepository cartRepository;

  @Mock
  private InventoryItemRepository inventoryItemRepository;

  @InjectMocks
  private OrderService orderService;

  private User mockUser;
  private Cart mockCart;
  private InventoryItem mockInventoryItem;

  @BeforeEach
  void setUp() {
    mockUser = new User();
    mockUser.setId(10L);
    mockUser.setEmail("user@example.com");

    Product product = new Product();
    product.setId(1L);
    product.setTitleEn("Naruto Vol 1");

    mockInventoryItem = new InventoryItem();
    mockInventoryItem.setId(100L);
    mockInventoryItem.setProduct(product);
    mockInventoryItem.setPrice(new BigDecimal("1000.00"));
    mockInventoryItem.setStatus("AVAILABLE");

    mockCart = new Cart();
    mockCart.setId(5L);
    mockCart.setUser(mockUser);

    CartItem cartItem = new CartItem();
    cartItem.setCart(mockCart);
    cartItem.setInventoryItem(mockInventoryItem);
    cartItem.setQuantity(1);

    mockCart.getItems().add(cartItem);
  }

  @Test
  @DisplayName("Kiểm tra checkout thành công - Chuyển cart sang order, lock status AVAILABLE -> RESERVED và xóa cart")
  void shouldCheckoutSuccessfully() {
    // GIVEN: Giả lập repository trả về giỏ hàng hợp lệ và lock thành công sản phẩm
    when(cartRepository.findByUserIdWithItems(mockUser.getId())).thenReturn(Optional.of(mockCart));
    when(inventoryItemRepository.findAllByIdForUpdate(List.of(100L))).thenReturn(List.of(mockInventoryItem));
    when(orderRepository.save(any(Order.class))).thenAnswer(invocation -> {
      Order o = invocation.getArgument(0);
      o.setId(99L);
      return o;
    });

    // WHEN: Thực hiện checkout
    Order order = orderService.checkout(mockUser, "123 Street, Ha Noi");

    // THEN: Kiểm tra đơn hàng được tạo đúng thông tin
    assertThat(order).isNotNull();
    assertThat(order.getId()).isEqualTo(99L);
    assertThat(order.getTotalPrice()).isEqualByComparingTo(new BigDecimal("1000.00"));

    // Thao tác lock inventory item phải chuyển status thành RESERVED
    assertThat(mockInventoryItem.getStatus()).isEqualTo("RESERVED");

    // Phải gọi cartRepository.delete(cart) để xóa giỏ hàng
    verify(cartRepository).delete(mockCart);
  }

  @Test
  @DisplayName("Kiểm tra checkout thất bại - Ném OutOfStockException khi sản phẩm trong giỏ đã bị chuyển sang PENDING/RESERVED/SOLD")
  void shouldThrowOutOfStockExceptionWhenItemIsNotAvailable() {
    // GIVEN: Sản phẩm đã bị người khác mua mất (status = SOLD)
    mockInventoryItem.setStatus("SOLD");
    when(cartRepository.findByUserIdWithItems(mockUser.getId())).thenReturn(Optional.of(mockCart));
    when(inventoryItemRepository.findAllByIdForUpdate(anyList())).thenReturn(List.of(mockInventoryItem));

    // WHEN & THEN: Gọi checkout phải ném OutOfStockException chứa tên sản phẩm bị hết
    assertThatThrownBy(() -> orderService.checkout(mockUser, "123 Street"))
        .isInstanceOf(OutOfStockException.class)
        .hasMessageContaining("Naruto Vol 1");
  }

  @Test
  @DisplayName("Kiểm tra getOrderDetail - Trả về OrderDto khi đúng user sở hữu đơn hàng")
  void shouldGetOrderDetailWhenUserIsOwner() {
    // GIVEN: Giả lập đơn hàng của mockUser
    Order order = new Order();
    order.setId(88L);
    order.setUser(mockUser);
    order.setTotalPrice(new BigDecimal("1000.00"));
    order.setShippingAddress("Ha Noi");

    when(orderRepository.findByIdWithDetails(88L)).thenReturn(Optional.of(order));

    // WHEN: Lấy chi tiết đơn hàng
    OrderDto result = orderService.getOrderDetail(88L, mockUser);

    // THEN: Trả về OrderDto chính xác
    assertThat(result).isNotNull();
    assertThat(result.getOrderId()).isEqualTo(88L);
  }

  @Test
  @DisplayName("Kiểm tra getOrderDetail - Ném IllegalArgumentException (Access Denied) khi user khác cố tình xem đơn hàng")
  void shouldThrowExceptionWhenUserIsNotOwner() {
    // GIVEN: Đơn hàng thuộc về user khác (ID 999)
    User otherUser = new User();
    otherUser.setId(999L);

    Order order = new Order();
    order.setId(88L);
    order.setUser(otherUser);

    when(orderRepository.findByIdWithDetails(88L)).thenReturn(Optional.of(order));

    // WHEN & THEN: mockUser truy cập đơn của otherUser phải bị ném ngoại lệ Access denied
    assertThatThrownBy(() -> orderService.getOrderDetail(88L, mockUser))
        .isInstanceOf(IllegalArgumentException.class)
        .hasMessageContaining("Access denied");
  }
}
