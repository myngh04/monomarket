package com.monomarket.controller;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.entity.User;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserBuybackService;
import com.monomarket.service.UserService;

@SpringBootTest
@AutoConfigureMockMvc
class ProfileTemplateRenderTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private UserService userService;

  @MockitoBean
  private OrderService orderService;

  @MockitoBean
  private UserBuybackService buybackService;

  private User user;

  @BeforeEach
  void setUp() {
    user = new User();
    user.setId(1L);
    user.setEmail("account@example.com");
    user.setFullName("Test Account");
    when(userService.findByEmail("account@example.com")).thenReturn(Optional.of(user));
    when(orderService.getOrdersByUser(user)).thenReturn(List.of());
    when(buybackService.getRequestsByUser(user)).thenReturn(List.of());
  }

  @Test
  @WithMockUser(username = "account@example.com", roles = "ADMIN")
  void shouldShowAdminDashboardLinkForAdmin() throws Exception {
    mockMvc.perform(get("/profile"))
        .andExpect(status().isOk())
        .andExpect(content().string(containsString("Dashboard")))
        .andExpect(content().string(containsString("/admin/buyback")));
  }

  @Test
  @WithMockUser(username = "account@example.com", roles = "USER")
  void shouldHideAdminDashboardLinkForRegularUser() throws Exception {
    mockMvc.perform(get("/profile"))
        .andExpect(status().isOk())
        .andExpect(content().string(not(containsString("Dashboard"))));
  }
}
