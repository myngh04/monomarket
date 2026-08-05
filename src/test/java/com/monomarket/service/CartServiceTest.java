package com.monomarket.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;
import com.monomarket.repository.CartRepository;
import com.monomarket.repository.InventoryItemRepository;

/*
 * TEST TẦNG SERVICE (Mockito Unit Test)
 * - Sử dụng @ExtendWith(MockitoExtension.class) để test logic thuần túy không cần bật Spring Context
 * - Sử dụng @Mock để giả lập Repositories và @InjectMocks để inject vào CartService
 * - Thời gian chạy cực nhanh (< 0.2s)
 */
@ExtendWith(MockitoExtension.class)
class CartServiceTest {

  @Mock
  private CartRepository cartRepository; // Mock đối tượng Repository tương tác giỏ hàng

  @Mock
  private InventoryItemRepository inventoryItemRepository; // Mock đối tượng Repository sản phẩm trong kho

  @InjectMocks
  private CartService cartService; // Service được tiêm các Mock ở trên vào để test

  private User mockUser;
  private InventoryItem mockInventoryItem;
  private Cart mockCart;

  @BeforeEach
  void setUp() {
    // Khởi tạo các đối tượng mẫu trước mỗi TestCase
    mockUser = new User();
    mockUser.setId(1L);
    mockUser.setEmail("test@example.com");

    Product product = new Product();
    product.setId(10L);
    product.setTitleJa("テスト本");
    product.setIsbnOrJan("12345678");

    mockInventoryItem = new InventoryItem();
    mockInventoryItem.setId(100L);
    mockInventoryItem.setProduct(product);
    mockInventoryItem.setPrice(new BigDecimal("1000"));
    mockInventoryItem.setConditionRank("A");
    mockInventoryItem.setStatus("AVAILABLE");

    mockCart = new Cart();
    mockCart.setId(50L);
    mockCart.setUser(mockUser);
  }

  @Test
  @DisplayName("1. Thêm serialized item mới vào giỏ hàng trống")
  void shouldAddToCart_WhenItemIsNew() {
    // GIVEN: Giả lập hành vi của Repositories khi được gọi
    when(inventoryItemRepository.findById(100L)).thenReturn(Optional.of(mockInventoryItem));
    when(cartRepository.findByUserIdWithItems(1L)).thenReturn(Optional.of(mockCart));
    when(cartRepository.save(any(Cart.class))).thenReturn(mockCart);

    // WHEN: Thực thi phương thức addToCart của service
    boolean result = cartService.addToCart(100L, mockUser, null);

    // THEN: Kiểm tra kết quả đúng như mong đợi
    assertThat(result).isTrue();
    assertThat(mockCart.getItems()).hasSize(1);
    verify(cartRepository).save(mockCart); // Xắc nhận hàm save() đã được gọi 1 lần
  }

  @Test
  @DisplayName("2. Thêm serialized item đã có sẵn không tạo dòng trùng")
  void shouldNotDuplicateItem_WhenItemAlreadyInCart() {
    // GIVEN: Giỏ hàng đã có sẵn món vật lý này
    CartItem existingItem = new CartItem(mockCart, mockInventoryItem);
    mockCart.addCartItem(existingItem);

    when(inventoryItemRepository.findById(100L)).thenReturn(Optional.of(mockInventoryItem));
    when(cartRepository.findByUserIdWithItems(1L)).thenReturn(Optional.of(mockCart));

    // WHEN: Thêm tiếp món đó vào giỏ
    boolean result = cartService.addToCart(100L, mockUser, null);

    // THEN: Serialized inventory không được tạo thêm cart item khi add lại
    assertThat(result).isTrue();
    assertThat(mockCart.getItems()).hasSize(1);
  }

  @Test
  @DisplayName("3. Gộp giỏ Guest vào giỏ User theo từng serialized item")
  void shouldMergeGuestCartToUserCart() {
    // GIVEN: Chuẩn bị giỏ hàng Guest đang có 3 sản phẩm
    String guestToken = "guest-token-abc";
    Cart guestCart = new Cart();
    guestCart.setSessionToken(guestToken);
    CartItem guestItem = new CartItem(guestCart, mockInventoryItem);
    guestCart.addCartItem(guestItem);

    when(cartRepository.findBySessionTokenWithItems(guestToken)).thenReturn(Optional.of(guestCart));
    when(cartRepository.findByUserIdWithItems(1L)).thenReturn(Optional.of(mockCart));

    // WHEN: Người dùng đăng nhập và hệ thống gọi gộp giỏ
    cartService.mergeGuestCartToUserCart(mockUser, guestToken);

    // THEN: Giỏ User nhận một serialized item, giỏ Guest rỗng và bị xóa khỏi DB
    assertThat(mockCart.getItems()).hasSize(1);
    assertThat(guestCart.getItems()).isEmpty(); // Kiểm tra items giỏ guest đã clear
    verify(cartRepository).delete(guestCart);   // Xác nhận giỏ guest đã bị delete
  }
}
