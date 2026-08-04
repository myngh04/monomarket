package com.monomarket.controller;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
import com.monomarket.service.UserService;

@SpringBootTest
@AutoConfigureMockMvc
class BuybackTemplateRenderTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private UserService userService;

  @BeforeEach
  void setUp() {
    User user = new User();
    user.setId(1L);
    user.setEmail("user@example.com");
    when(userService.findByEmail("user@example.com")).thenReturn(Optional.of(user));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  void shouldRenderBuybackFormTemplate() throws Exception {
    mockMvc.perform(get("/buyback"))
        .andExpect(status().isOk())
        .andExpect(content().string(org.hamcrest.Matchers.containsString("Create a Buyback Request")))
        .andExpect(
            content().string(org.hamcrest.Matchers.containsString("data-lookup-url=\"/buyback/products/lookup\"")));
  }
}
