package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.cookie;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collections;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.service.CartService;
import com.monomarket.service.UserService;

import jakarta.servlet.http.Cookie;

/*
 * TEST TẦNG CONTROLLER (Web MVC Test)
 * - Sử dụng @WebMvcTest(CartController.class) để chỉ bật bộ khung Web MVC (Request mapping, View, Cookies)
 * - Sử dụng MockMvc gửi các HTTP Request giả lập (GET, POST) và kiểm tra HTTP Response trả về
 * - Sử dụng @MockitoBean để mock các Service mà Controller phụ thuộc
 */
@WebMvcTest(CartController.class)
@AutoConfigureMockMvc(addFilters = false) // Tắt các Filter Security để tập trung test logic Controller
class CartControllerTest {

  @Autowired
  private MockMvc mockMvc; // Công cụ giả lập gửi HTTP Request (GET, POST...)

  @MockitoBean
  private CartService cartService; // Mock tầng CartService

  @MockitoBean
  private UserService userService; // Mock tầng UserService

  @Test
  @DisplayName("1. GET /cart nên trả về HTTP 200 OK, tên view 'cart', biến model 'cartItems' và tạo Cookie guest mới")
  void shouldReturnCartView() throws Exception {
    // GIVEN: Giả lập cartService trả về danh sách rỗng
    when(cartService.getCartDtoList(any(), any())).thenReturn(Collections.emptyList());

    // WHEN & THEN: Gửi request GET /cart và kiểm tra phản hồi
    mockMvc.perform(get("/cart"))
        .andExpect(status().isOk()) // HTTP status phải là 200
        .andExpect(view().name("cart")) // View rendered ra phải là cart.html
        .andExpect(model().attributeExists("cartItems")) // Biến cartItems tồn tại trong model
        .andExpect(cookie().exists(CartController.GUEST_COOKIE_NAME)); // Cookie guest được tự động tạo
  }

  @Test
  @DisplayName("2. POST /cart/add nên thực hiện redirect về /cart và gọi đúng cartService.addToCart")
  void shouldRedirectAfterAddToCart() throws Exception {
    // WHEN & THEN: Gửi request POST /cart/add với form data inventoryItemId=100
    mockMvc.perform(post("/cart/add")
        .param("inventoryItemId", "100"))
        .andExpect(status().is3xxRedirection()) // Phải trả về mã 302 Redirect
        .andExpect(redirectedUrl("/cart")); // Chuyển hướng tới /cart

    // Xác nhận controller đã chuyển tiếp tham số id=100 xuống cartService.addToCart
    verify(cartService).addToCart(eq(100L), any(), any());
  }

  @Test
  @DisplayName("3. POST /cart/update nên thực hiện redirect về /cart và gọi đúng cartService.updateQuantity")
  void shouldRedirectAfterUpdateQuantity() throws Exception {
    // WHEN & THEN: Gửi request POST /cart/update với quantity hợp lệ bằng 1
    mockMvc.perform(post("/cart/update")
        .param("inventoryItemId", "100")
        .param("quantity", "1"))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/cart"));

    // Xác nhận controller đã chuyển quantity = 1 xuống service
    verify(cartService).updateQuantity(eq(100L), eq(1), any(), any());
  }

  @Test
  @DisplayName("4. Cookie guest cũ nếu đã có sẵn thì phải được giữ nguyên qua các request")
  void shouldPreserveExistingGuestCookie() throws Exception {
    // GIVEN: Trình duyệt gửi kèm cookie guest đã có sẵn token
    Cookie existingCookie = new Cookie(CartController.GUEST_COOKIE_NAME, "existing-uuid-token");

    // WHEN: Gửi request kèm Cookie này
    mockMvc.perform(get("/cart").cookie(existingCookie))
        .andExpect(status().isOk())
        .andExpect(view().name("cart"));

    // THEN: Xác nhận cartService nhận đúng token từ cookie cũ đó
    verify(cartService).getCartDtoList(any(), eq("existing-uuid-token"));
  }
}
