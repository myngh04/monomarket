package com.monomarket.controller.api;

import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.dto.OrderDto;
import com.monomarket.dto.OrderItemDto;
import com.monomarket.entity.User;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

@WebMvcTest(AccountApiController.class)
@AutoConfigureMockMvc
class AccountApiControllerTest {

    private static final String USER_EMAIL = "member@example.com";

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private UserService userService;

    @MockitoBean
    private OrderService orderService;

    @Test
    void shouldReturnCurrentProfile() throws Exception {
        when(userService.findByEmail(USER_EMAIL)).thenReturn(Optional.of(currentUser()));

        mockMvc.perform(get("/api/v1/account/profile")
                .with(user(USER_EMAIL))
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.email").value(USER_EMAIL))
                .andExpect(jsonPath("$.fullName").value("Mono User"))
                .andExpect(jsonPath("$.phone").value("0900000000"));
    }

    @Test
    void shouldReturnOrdersForCurrentUser() throws Exception {
        User user = currentUser();
        when(userService.findByEmail(USER_EMAIL)).thenReturn(Optional.of(user));
        when(orderService.getOrdersByUser(user)).thenReturn(List.of(orderDto()));

        mockMvc.perform(get("/api/v1/account/orders")
                .with(user(USER_EMAIL))
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].orderId").value(10))
                .andExpect(jsonPath("$[0].status").value("PENDING"))
                .andExpect(jsonPath("$[0].orderItems[0].instoreCode").value("INV-10"));
    }

    @Test
    void shouldReturnCurrentUsersOrderDetail() throws Exception {
        User user = currentUser();
        when(userService.findByEmail(USER_EMAIL)).thenReturn(Optional.of(user));
        when(orderService.getOrderDetail(10L, user)).thenReturn(orderDto());

        mockMvc.perform(get("/api/v1/account/orders/10")
                .with(user(USER_EMAIL))
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.orderId").value(10))
                .andExpect(jsonPath("$.shippingAddress").value("Tokyo"));
    }

    @Test
    void shouldReturnNotFoundWhenOrderIsMissingOrNotOwned() throws Exception {
        User user = currentUser();
        when(userService.findByEmail(USER_EMAIL)).thenReturn(Optional.of(user));
        when(orderService.getOrderDetail(99L, user))
                .thenThrow(new IllegalArgumentException("Order not found: 99"));

        mockMvc.perform(get("/api/v1/account/orders/99")
                .with(user(USER_EMAIL))
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.status").value(404))
                .andExpect(jsonPath("$.message").value("Order not found"));
    }

    // Tạo user fixture tối thiểu đại diện cho account đã đăng nhập trong API test.
    private User currentUser() {
        User user = new User();
        user.setId(1L);
        user.setEmail(USER_EMAIL);
        user.setFullName("Mono User");
        user.setPhone("0900000000");
        return user;
    }

    // Tạo order DTO đã qua service mapping để controller test đúng contract REST
    // thực tế.
    private OrderDto orderDto() {
        return new OrderDto(
                10L,
                LocalDateTime.of(2026, 8, 13, 0, 0),
                "PENDING",
                new BigDecimal("19.99"),
                "Tokyo",
                List.of(new OrderItemDto("Test Product", "A", "INV-10", new BigDecimal("19.99"))));
    }
}
