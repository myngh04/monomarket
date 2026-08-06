package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.math.BigDecimal;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import com.monomarket.dto.BuybackProductLookupDto;
import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.User;
import com.monomarket.service.UserBuybackService;
import com.monomarket.service.UserService;

@WebMvcTest(value = BuybackController.class, properties = "spring.thymeleaf.enabled=false")
@Import(BuybackControllerTest.TestViewConfiguration.class)
class BuybackControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private UserBuybackService buybackService;

  @MockitoBean
  private UserService userService;

  private User mockUser;

  @BeforeEach
  void setUp() {
    mockUser = new User();
    mockUser.setId(1L);
    mockUser.setEmail("user@example.com");

    when(userService.findByEmail("user@example.com")).thenReturn(Optional.of(mockUser));
  }

  @Test
  @DisplayName("GET /buyback - Chưa đăng nhập thì bị từ chối")
  void shouldRequireAuthenticationForBuybackForm() throws Exception {
    mockMvc.perform(get("/buyback"))
        .andExpect(status().isUnauthorized());
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback - User đăng nhập thì render form")
  void shouldShowBuybackFormWhenAuthenticated() throws Exception {
    mockMvc.perform(get("/buyback"))
        .andExpect(status().isOk())
        .andExpect(view().name("buyback-form"))
        .andExpect(model().attributeExists("buybackForm"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback/products/lookup - ISBN/JAN hợp lệ trả JSON product")
  void shouldLookupProduct() throws Exception {
    when(buybackService.lookupProduct("9780000000001"))
        .thenReturn(new BuybackProductLookupDto(
            10L, "9780000000001", "Test Product", new BigDecimal("1250")));

    mockMvc.perform(get("/buyback/products/lookup")
        .param("submittedIsbnOrJan", "9780000000001"))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$.productId").value(10))
        .andExpect(jsonPath("$.isbnOrJan").value("9780000000001"))
        .andExpect(jsonPath("$.title").value("Test Product"))
        .andExpect(jsonPath("$.estimatedBuybackPrice").value(1250));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback/products/lookup - ISBN/JAN không tồn tại trả lỗi 400")
  void shouldRejectUnknownProductLookup() throws Exception {
    when(buybackService.lookupProduct("unknown"))
        .thenThrow(new IllegalArgumentException("Product not found"));

    mockMvc.perform(get("/buyback/products/lookup")
        .param("submittedIsbnOrJan", "unknown"))
        .andExpect(status().isBadRequest())
        .andExpect(jsonPath("$.error").value("Product not found"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /buyback - Form hợp lệ tạo request và redirect history")
  void shouldCreateBuybackRequest() throws Exception {
    BuybackRequest request = new BuybackRequest();
    request.setId(20L);
    when(buybackService.createRequest(eq(mockUser), any())).thenReturn(request);

    mockMvc.perform(post("/buyback")
        .param("submittedIsbnOrJan", "9780000000001")
        .param("userConditionRank", "A")
        .param("description", "Some notes")
        .param("handoverAddress", "123 Test Street")
        .param("preferredHandoverDate", "2026-08-10")
        .with(csrf()))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile#buyback-requests"))
        .andExpect(flash().attributeExists("successMessage"));

    verify(buybackService).createRequest(eq(mockUser), any());
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("POST /buyback - Thiếu field bắt buộc thì trả lại form")
  void shouldRejectInvalidBuybackForm() throws Exception {
    mockMvc.perform(post("/buyback")
        .param("submittedIsbnOrJan", "9780000000001")
        .param("preferredHandoverDate", "2026-08-10")
        .with(csrf()))
        .andExpect(status().isOk())
        .andExpect(view().name("buyback-form"))
        .andExpect(model().attributeHasFieldErrors(
            "buybackForm", "userConditionRank", "handoverAddress"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback/history - Render history của user hiện tại")
  void shouldShowBuybackHistory() throws Exception {
    mockMvc.perform(get("/buyback/history"))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile#buyback-requests"));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback/{id} - Render detail khi request thuộc user")
  void shouldShowBuybackDetail() throws Exception {
    BuybackRequest request = new BuybackRequest();
    request.setId(20L);
    when(buybackService.getRequestForUser(20L, mockUser)).thenReturn(request);

    mockMvc.perform(get("/buyback/20"))
        .andExpect(status().isOk())
        .andExpect(view().name("buyback-detail"))
        .andExpect(model().attribute("buybackRequest", request));
  }

  @Test
  @WithMockUser(username = "user@example.com")
  @DisplayName("GET /buyback/{id} - Request không thuộc user thì redirect history")
  void shouldRedirectWhenBuybackDetailIsNotOwned() throws Exception {
    when(buybackService.getRequestForUser(20L, mockUser))
        .thenThrow(new IllegalArgumentException("Buyback request not found"));

    mockMvc.perform(get("/buyback/20"))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/profile#buyback-requests"));
  }

  // ViewResolver test không render Thymeleaf thật, giúp controller test độc lập
  // với các template Buyback sẽ được thêm ở bước UI.
  @TestConfiguration
  static class TestViewConfiguration {

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    ViewResolver testViewResolver() {
      return (viewName, locale) -> (View) (model, request, response) -> {
        // Chỉ cần trả view thành công để MockMvc kiểm tra view name và model.
      };
    }
  }
}
