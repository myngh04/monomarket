package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.List;
import java.util.Optional;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.entity.User;
import com.monomarket.entity.BuybackRequest;
import com.monomarket.dto.OrderDto;
import com.monomarket.service.BuybackService;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

@WebMvcTest(ProfileController.class)
class ProfileControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private UserService userService;

  @MockitoBean
  private OrderService orderService;

  @MockitoBean
  private BuybackService buybackService;

  private User mockUser;

  @BeforeEach
  void setUp() {
    mockUser = new User();
    mockUser.setId(1L);
    mockUser.setEmail("user@example.com");
    mockUser.setFullName("Nguyen Van A");
    mockUser.setPhone("0901234567");

    when(userService.findByEmail("user@example.com")).thenReturn(Optional.of(mockUser));
    when(buybackService.getRequestsByUser(mockUser)).thenReturn(List.of());
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /profile - User đã đăng nhập -> Render profile view kèm thông tin tài khoản và đơn hàng gần đây")
  void shouldShowProfilePageWhenAuthenticated() throws Exception {
    when(orderService.getOrdersByUser(any(User.class))).thenReturn(List.of());

    mockMvc.perform(get("/profile"))
        .andExpect(status().isOk())
        .andExpect(view().name("profile"))
        .andExpect(model().attributeExists("profile"))
        .andExpect(model().attributeExists("recentOrders"))
        .andExpect(model().attributeExists("buybackRequests"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /profile - Trả toàn bộ order để UI có thể mở rộng từng 5 dòng")
  void shouldExposeAllOrdersForProgressiveDisplay() throws Exception {
    List<OrderDto> orders = java.util.stream.LongStream.rangeClosed(1, 6)
        .mapToObj(id -> new OrderDto(
            id, LocalDateTime.now(), "PENDING", BigDecimal.TEN, "Address", List.of()))
        .toList();
    when(orderService.getOrdersByUser(any(User.class))).thenReturn(orders);

    mockMvc.perform(get("/profile"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("recentOrders", org.hamcrest.Matchers.hasSize(6)));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /profile - Trả lịch sử Buyback của user để render trên Profile")
  void shouldExposeBuybackRequestsForProfileHistory() throws Exception {
    when(orderService.getOrdersByUser(any(User.class))).thenReturn(List.of());
    when(buybackService.getRequestsByUser(mockUser)).thenReturn(List.of(new BuybackRequest()));

    mockMvc.perform(get("/profile"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("buybackRequests", org.hamcrest.Matchers.hasSize(1)));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /profile/update - Cập nhật thông tin hợp lệ -> Redirect /profile kèm flash successMessage")
  void shouldUpdateProfileSuccessfully() throws Exception {
    mockMvc.perform(post("/profile/update")
        .param("fullName", "Nguyen Van B")
        .param("phone", "0987654321")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile"))
        .andExpect(flash().attributeExists("successMessage"));

    verify(userService).updateProfile(any(User.class), eq("Nguyen Van B"), eq("0987654321"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /profile/update - Tên rỗng -> Redirect /profile kèm flash errorMessage")
  void shouldRejectEmptyFullName() throws Exception {
    mockMvc.perform(post("/profile/update")
        .param("fullName", "   ")
        .param("phone", "0987654321")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile"))
        .andExpect(flash().attributeExists("errorMessage"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /orders/{id}/cancel - Hủy đơn thành công -> Redirect /orders/{id} kèm successMessage")
  void shouldCancelOrderSuccessfully() throws Exception {
    doNothing().when(orderService).cancelOrder(eq(100L), any(User.class));

    mockMvc.perform(post("/orders/100/cancel")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/orders/100"))
        .andExpect(flash().attributeExists("successMessage"));

    verify(orderService).cancelOrder(eq(100L), any(User.class));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /orders/{id}/cancel - Lỗi khi hủy đơn -> Redirect /orders/{id} kèm errorMessage")
  void shouldHandleCancelOrderError() throws Exception {
    doThrow(new IllegalStateException("Only orders in PENDING status can be cancelled"))
        .when(orderService).cancelOrder(eq(100L), any(User.class));

    mockMvc.perform(post("/orders/100/cancel")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/orders/100"))
        .andExpect(flash().attributeExists("errorMessage"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /profile/orders/{id}/cancel - Hủy từ Recent Orders -> Reload profile")
  void shouldReloadProfileAfterCancelFromProfile() throws Exception {
    doNothing().when(orderService).cancelOrder(eq(100L), any(User.class));

    mockMvc.perform(post("/profile/orders/100/cancel")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile"))
        .andExpect(flash().attributeExists("successMessage"));

    verify(orderService).cancelOrder(eq(100L), any(User.class));
  }
}
