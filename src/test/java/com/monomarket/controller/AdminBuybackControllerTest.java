package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
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

import java.math.BigDecimal;
import java.util.EnumMap;
import java.util.Map;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.User;
import com.monomarket.service.AdminBuybackService;
import com.monomarket.service.UserService;

@WebMvcTest(value = AdminBuybackController.class, properties = "spring.thymeleaf.enabled=false")
class AdminBuybackControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private AdminBuybackService adminBuybackService;

    @MockitoBean
    private UserService userService;

    private User admin;

    @BeforeEach
    void setUp() {
        admin = new User();
        admin.setId(10L);
        admin.setEmail("admin@example.com");
        admin.setRole("ADMIN");
        when(userService.findByEmail("admin@example.com")).thenReturn(Optional.of(admin));
        for (BuybackRequestStatus status : BuybackRequestStatus.values()) {
            when(adminBuybackService.countByStatus(status)).thenReturn(0L);
        }
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("GET dashboard - Render danh sách và KPI Buyback")
    void shouldShowDashboard() throws Exception {
        when(adminBuybackService.getRequests(eq(BuybackRequestStatus.PENDING), any(PageRequest.class)))
                .thenReturn(new PageImpl<>(java.util.List.of(new BuybackRequest())));

        mockMvc.perform(get("/admin/buyback")
                .param("status", "PENDING"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/buyback-dashboard"))
                .andExpect(model().attributeExists("requests", "statuses", "statusCounts"));
    }

    @Test
    @WithMockUser(username = "user@example.com", roles = "USER")
    @DisplayName("GET dashboard - User thường bị chặn trước khi gọi service")
    void shouldRejectRegularUser() throws Exception {
        User regularUser = new User();
        regularUser.setId(20L);
        regularUser.setRole("USER");
        when(userService.findByEmail("user@example.com")).thenReturn(Optional.of(regularUser));

        mockMvc.perform(get("/admin/buyback"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/"));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("GET detail - Render request admin")
    void shouldShowRequestDetail() throws Exception {
        BuybackRequest request = new BuybackRequest();
        request.setId(5L);
        BuybackRequestItem item = new BuybackRequestItem();
        item.setFinalBuyPrice(new BigDecimal("850"));
        request.addItem(item);
        when(adminBuybackService.getRequestDetails(5L)).thenReturn(request);
        when(adminBuybackService.getStorePrices(any())).thenReturn(Map.of(5L, new BigDecimal("1200")));

        mockMvc.perform(get("/admin/buyback/5"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/buyback-detail"))
                .andExpect(model().attribute("buybackRequest", request))
                .andExpect(model().attribute("storePrice", new BigDecimal("1200")))
                .andExpect(model().attribute("storeProfit", new BigDecimal("350")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("POST status - Chuyển status và redirect detail")
    void shouldTransitionStatus() throws Exception {
        mockMvc.perform(post("/admin/buyback/5/status")
                .param("targetStatus", "RECEIVED")
                .param("note", "Received")
                .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/buyback/5"))
                .andExpect(flash().attributeExists("successMessage"));

        verify(adminBuybackService).transitionStatus(
                eq(5L), eq(admin), eq(BuybackRequestStatus.RECEIVED), eq("Received"));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("POST price - Lưu final review và redirect detail")
    void shouldReviewAndPrice() throws Exception {
        mockMvc.perform(post("/admin/buyback/5/price")
                .param("finalConditionRank", "A")
                .param("finalBuyPrice", "850")
                .param("inspectionNotes", "Good condition")
                .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/buyback/5"))
                .andExpect(flash().attributeExists("successMessage"));

        verify(adminBuybackService).reviewAndPrice(
                eq(5L), eq(admin), eq("A"), eq(new BigDecimal("850")), eq("Good condition"));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("POST stock - Luu selling price va tao inventory")
    void shouldStockRequestWithSellingPrice() throws Exception {
        mockMvc.perform(post("/admin/buyback/5/stock")
                .param("sellingPrice", "1200")
                .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/buyback/5"))
                .andExpect(flash().attributeExists("successMessage"));

        verify(adminBuybackService).stockRequest(
                eq(5L), eq(admin), eq(new BigDecimal("1200")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    @DisplayName("POST status - Service báo lỗi thì trả flash error")
    void shouldShowTransitionError() throws Exception {
        when(adminBuybackService.transitionStatus(
                eq(5L), eq(admin), eq(BuybackRequestStatus.PRICED), eq("Skip")))
                .thenThrow(new IllegalStateException("Invalid transition"));

        mockMvc.perform(post("/admin/buyback/5/status")
                .param("targetStatus", "PRICED")
                .param("note", "Skip")
                .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/buyback/5"))
                .andExpect(flash().attributeExists("errorMessage"));
    }
}
