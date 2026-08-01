package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.dto.CartItemDto;
import com.monomarket.dto.OrderDto;
import com.monomarket.entity.Order;
import com.monomarket.entity.User;
import com.monomarket.exception.OutOfStockException;
import com.monomarket.service.CartService;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

@WebMvcTest(CheckoutController.class)
class CheckoutControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private OrderService orderService;

  @MockitoBean
  private CartService cartService;

  @MockitoBean
  private UserService userService;

  private User mockUser;

  @BeforeEach
  void setUp() {
    mockUser = new User();
    mockUser.setId(1L);
    mockUser.setEmail("testuser@example.com");

    when(userService.findByEmail("testuser@example.com")).thenReturn(Optional.of(mockUser));
  }

  @Test
  @WithMockUser(username = "testuser@example.com")
  @DisplayName("GET /checkout - User đã đăng nhập và giỏ hàng có đồ -> Render checkout view")
  void shouldShowCheckoutPageWhenAuthenticated() throws Exception {
    // GIVEN: Giỏ hàng có 1 sản phẩm
    CartItemDto itemDto = new CartItemDto(100L, 1L, "One Piece 100", "9784088707013", "A", new BigDecimal("500.00"), 1);
    when(cartService.getCartDtoList(any(User.class), eq(null))).thenReturn(List.of(itemDto));

    // WHEN & THEN: Gọi GET /checkout phải trả về HTTP 200 và view "checkout"
    mockMvc.perform(get("/checkout"))
        .andExpect(status().isOk())
        .andExpect(view().name("checkout"))
        .andExpect(model().attributeExists("cartItems"))
        .andExpect(model().attributeExists("total"));
  }

  @Test
  @WithMockUser(username = "testuser@example.com")
  @DisplayName("POST /checkout/confirm - Checkout thành công -> Redirect sang trang confirmation")
  void shouldConfirmCheckoutSuccessfully() throws Exception {
    // GIVEN: Giả lập orderService.checkout tạo được Order với ID 50
    Order mockOrder = new Order();
    mockOrder.setId(50L);
    when(orderService.checkout(any(User.class), eq("123 Tokyo"))).thenReturn(mockOrder);

    // WHEN & THEN: Submit form POST /checkout/confirm
    mockMvc.perform(post("/checkout/confirm")
        .param("shippingAddress", "123 Tokyo")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/orders/50/confirmation"));
  }

  @Test
  @WithMockUser(username = "testuser@example.com")
  @DisplayName("POST /checkout/confirm - Bị OutOfStockException -> Redirect về /cart kèm flash error message")
  void shouldRedirectToCartWithFlashErrorWhenOutOfStock() throws Exception {
    // GIVEN: Giả lập ném OutOfStockException khi checkout
    when(orderService.checkout(any(User.class), eq("123 Tokyo")))
        .thenThrow(new OutOfStockException(List.of("One Piece 100")));

    // WHEN & THEN: Đặt hàng phải bị redirect về /cart và đính kèm errorMessage trong flash attribute
    mockMvc.perform(post("/checkout/confirm")
        .param("shippingAddress", "123 Tokyo")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/cart"))
        .andExpect(flash().attributeExists("errorMessage"));
  }

  @Test
  @WithMockUser(username = "testuser@example.com")
  @DisplayName("GET /orders/{id}/confirmation - Render trang xác nhận thành công")
  void shouldShowConfirmationPage() throws Exception {
    // GIVEN: Giả lập trả về OrderDto cho đơn hàng ID 50
    OrderDto orderDto = new OrderDto(50L, null, "PENDING", new BigDecimal("500.00"), "123 Tokyo", List.of());
    when(orderService.getOrderDetail(eq(50L), any(User.class))).thenReturn(orderDto);

    // WHEN & THEN: Gọi GET /orders/50/confirmation
    mockMvc.perform(get("/orders/50/confirmation"))
        .andExpect(status().isOk())
        .andExpect(view().name("order-confirmation"))
        .andExpect(model().attributeExists("order"));
  }

}
