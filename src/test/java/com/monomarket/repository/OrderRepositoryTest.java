package com.monomarket.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.monomarket.entity.Category;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Order;
import com.monomarket.entity.OrderItem;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;

@DataJpaTest
class OrderRepositoryTest {

  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private CategoryRepository categoryRepository;

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private InventoryItemRepository inventoryItemRepository;

  private User mockUser;

  @BeforeEach
  void setUp() {
    // 1. Giả lập tạo User
    mockUser = new User();
    mockUser.setEmail("buyer@example.com");
    mockUser.setPassword("password123");
    mockUser.setFullName("Nguyen Van A");
    mockUser = userRepository.save(mockUser);

    // 2. Giả lập Category & Product
    Category category = new Category();
    category.setNameEn("Manga");
    category.setNameJa("マンガ");
    category.setSlug("manga-test");
    category = categoryRepository.save(category);

    Product product = new Product();
    product.setIsbnOrJan("9784088707013");
    product.setTitleJa("ONE PIECE 100");
    product.setTitleEn("One Piece Vol 100");
    product.setCategory(category);
    product = productRepository.save(product);

    // 3. Giả lập InventoryItem
    InventoryItem inventoryItem = new InventoryItem();
    inventoryItem.setProduct(product);
    inventoryItem.setInstoreCode("INV-OP100");
    inventoryItem.setPrice(new BigDecimal("500.00"));
    inventoryItem.setConditionRank("A");
    inventoryItem.setStatus("RESERVED");
    inventoryItem = inventoryItemRepository.save(inventoryItem);

    // 4. Giả lập Order & OrderItem
    Order order = new Order();
    order.setUser(mockUser);
    order.setShippingAddress("123 Tokyo, Japan");
    order.setTotalPrice(new BigDecimal("500.00"));
    order.setStatus("PENDING");

    OrderItem orderItem = new OrderItem();
    orderItem.setOrder(order);
    orderItem.setInventoryItem(inventoryItem);
    orderItem.setPrice(inventoryItem.getPrice());

    order.getItems().add(orderItem);
    orderRepository.save(order);
  }

  @Test
  @DisplayName("Kiểm tra findByUserIdWithDetails - Lấy danh sách đơn hàng kèm chi tiết items và product qua JOIN FETCH")
  void shouldFindOrdersByUserIdWithDetails() {
    // WHEN: Tìm danh sách đơn hàng của user vừa tạo
    List<Order> orders = orderRepository.findByUserIdWithDetails(mockUser.getId());

    // THEN: Đơn hàng phải tồn tại và chứa đủ thông tin liên kết
    assertThat(orders).hasSize(1);
    Order order = orders.get(0);
    assertThat(order.getShippingAddress()).isEqualTo("123 Tokyo, Japan");
    assertThat(order.getItems()).hasSize(1);
    assertThat(order.getItems().get(0).getInventoryItem().getProduct().getTitleEn()).isEqualTo("One Piece Vol 100");
  }

  @Test
  @DisplayName("Kiểm tra findByIdWithDetails - Lấy thông tin chi tiết 1 đơn hàng qua JOIN FETCH")
  void shouldFindOrderByIdWithDetails() {
    // GIVEN: Lấy ID đơn hàng
    List<Order> orders = orderRepository.findByUserIdWithDetails(mockUser.getId());
    Long orderId = orders.get(0).getId();

    // WHEN: Tìm đơn hàng theo ID
    Optional<Order> orderOpt = orderRepository.findByIdWithDetails(orderId);

    // THEN: Đơn hàng phải tồn tại
    assertThat(orderOpt).isPresent();
    assertThat(orderOpt.get().getTotalPrice()).isEqualByComparingTo(new BigDecimal("500.00"));
  }
}
