package com.monomarket.controller;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.Product;
import com.monomarket.service.AdminBuybackService;
import com.monomarket.service.UserService;

@SpringBootTest
@AutoConfigureMockMvc
class AdminBuybackTemplateRenderTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private AdminBuybackService adminBuybackService;

    @MockitoBean
    private UserService userService;

    @BeforeEach
    void setUp() {
        com.monomarket.entity.User admin = new com.monomarket.entity.User();
        admin.setId(10L);
        admin.setEmail("admin@example.com");
        admin.setRole("ADMIN");
        when(userService.findByEmail("admin@example.com")).thenReturn(Optional.of(admin));

        for (BuybackRequestStatus status : BuybackRequestStatus.values()) {
            when(adminBuybackService.countByStatus(status)).thenReturn(0L);
        }
        when(adminBuybackService.getAllowedNextStatuses(BuybackRequestStatus.PENDING))
                .thenReturn(List.of(BuybackRequestStatus.RECEIVED, BuybackRequestStatus.REJECTED));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderAdminDashboardTemplate() throws Exception {
        BuybackRequest request = request();
        when(adminBuybackService.getRequests(BuybackRequestStatus.PENDING, PageRequest.of(0, 20)))
                .thenReturn(new PageImpl<>(List.of(request)));

        mockMvc.perform(get("/admin/buyback"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Buyback Dashboard")))
                .andExpect(content().string(containsString("PENDING requests")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderStockedDashboardTemplate() throws Exception {
        BuybackRequest stockedRequest = request();
        stockedRequest.setStatus(BuybackRequestStatus.STOCKED);
        stockedRequest.getItems().get(0).setId(1L);
        stockedRequest.getItems().get(0).setFinalBuyPrice(new BigDecimal("850"));
        when(adminBuybackService.getRequests(BuybackRequestStatus.STOCKED, PageRequest.of(0, 20)))
                .thenReturn(new PageImpl<>(List.of(stockedRequest)));
        when(adminBuybackService.getStorePrices(any())).thenReturn(Map.of(1L, new BigDecimal("1200")));

        mockMvc.perform(get("/admin/buyback").param("status", "STOCKED"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("STOCKED requests")))
                .andExpect(content().string(containsString("Store price")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderAdminDetailTemplate() throws Exception {
        BuybackRequest request = request();
        when(adminBuybackService.getRequestDetails(1L)).thenReturn(request);
        when(adminBuybackService.getStatusHistory(1L)).thenReturn(List.of());

        mockMvc.perform(get("/admin/buyback/1"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Request #1")))
                .andExpect(content().string(containsString("Review actions")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderStorePriceAndProfitOnStockedRequestDetail() throws Exception {
        BuybackRequest request = request();
        request.setStatus(BuybackRequestStatus.STOCKED);
        request.getItems().get(0).setId(3L);
        request.getItems().get(0).setFinalBuyPrice(new BigDecimal("850"));
        when(adminBuybackService.getRequestDetails(1L)).thenReturn(request);
        when(adminBuybackService.getStatusHistory(1L)).thenReturn(List.of());
        when(adminBuybackService.getStorePrices(any())).thenReturn(Map.of(1L, new BigDecimal("1200")));

        mockMvc.perform(get("/admin/buyback/1"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Store price")))
                .andExpect(content().string(containsString("Profit")))
                .andExpect(content().string(containsString("¥1,200")))
                .andExpect(content().string(containsString("¥350")));
    }

    private BuybackRequest request() {
        BuybackRequest request = new BuybackRequest();
        request.setId(1L);
        request.setStatus(BuybackRequestStatus.PENDING);
        request.setCreatedAt(LocalDateTime.of(2026, 8, 7, 9, 30));
        request.setTotalEstimatedPrice(new BigDecimal("1250"));

        Product product = new Product();
        product.setTitleEn("Test Product");
        product.setTitleJa("テスト商品");
        BuybackRequestItem item = new BuybackRequestItem();
        item.setProduct(product);
        item.setSubmittedIsbnOrJan("9780000000001");
        item.setUserConditionRank("A");
        request.addItem(item);
        return request;
    }
}
