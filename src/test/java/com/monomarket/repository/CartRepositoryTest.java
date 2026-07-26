package com.monomarket.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;
import java.util.Optional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.Category;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Product;

/*
 * TEST TẦNG REPOSITORY (Data JPA Test)
 * - Sử dụng @DataJpaTest để chỉ load tầng JPA và Database H2 in-memory
 * - Kiểm tra các câu truy vấn JPQL custom (như JOIN FETCH) có hoạt động đúng không
 */
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CartRepositoryTest {

  @Autowired
  private TestEntityManager entityManager; // Công cụ lưu dữ liệu giả lập vào DB test

  @Autowired
  private CartRepository cartRepository; // Repository cần test

  @Test
  @DisplayName("1. Nên tìm thấy giỏ hàng theo sessionToken kèm theo full danh sách items")
  void shouldFindCartBySessionTokenWithItems() {
    // 1. GIVEN: Chuẩn bị dữ liệu mẫu và lưu tạm vào DB test
    Category category = new Category();
    category.setNameEn("Games");
    category.setNameJa("ゲーム");
    category.setSlug("games-test");
    entityManager.persist(category);

    Product product = new Product();
    product.setIsbnOrJan("999888777");
    product.setTitleJa("テストゲーム");
    product.setCategory(category);
    entityManager.persist(product);

    InventoryItem inventoryItem = new InventoryItem();
    inventoryItem.setProduct(product);
    inventoryItem.setInstoreCode("999888777-U01");
    inventoryItem.setPrice(new BigDecimal("5000"));
    inventoryItem.setConditionRank("A");
    inventoryItem.setStatus("AVAILABLE");
    entityManager.persist(inventoryItem);

    Cart cart = new Cart();
    cart.setSessionToken("test-session-token-123");

    CartItem cartItem = new CartItem(cart, inventoryItem, 2);
    cart.addCartItem(cartItem);

    entityManager.persist(cart);
    entityManager.flush();
    entityManager.clear(); // Xóa L1 cache để ép Hibernate phải chạy câu lệnh SQL SELECT thực tế

    // 2. WHEN: Gọi hàm repository cần kiểm tra
    Optional<Cart> result = cartRepository.findBySessionTokenWithItems("test-session-token-123");

    // 3. THEN: Kiểm tra kết quả trả về bằng AssertJ
    assertThat(result).isPresent(); // Phải tìm thấy giỏ hàng
    assertThat(result.get().getSessionToken()).isEqualTo("test-session-token-123"); // Đúng token
    assertThat(result.get().getItems()).hasSize(1); // Phải chứa đúng 1 item
    assertThat(result.get().getItems().get(0).getInventoryItem().getPrice())
        .isEqualByComparingTo(new BigDecimal("5000")); // Đúng giá của sản phẩm
  }
}