package com.monomarket.controller;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.service.AdminOperationsService;

@SpringBootTest
@AutoConfigureMockMvc
class AdminOperationsTemplateRenderTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private AdminOperationsService adminOperationsService;

    @BeforeEach
    void setUp() {
        when(adminOperationsService.getInventory(any(Pageable.class))).thenReturn(new PageImpl<>(List.of()));
        when(adminOperationsService.getOrders(any(Pageable.class))).thenReturn(new PageImpl<>(List.of()));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderInventoryAndOrdersNavigation() throws Exception {
        mockMvc.perform(get("/admin/inventory"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Inventory")))
                .andExpect(content().string(containsString("/admin/orders")));

        mockMvc.perform(get("/admin/orders"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Orders")))
                .andExpect(content().string(containsString("/admin/inventory")));
    }

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldRenderInventoryPaginationWindowForManyPages() throws Exception {
        when(adminOperationsService.getInventory(any(Pageable.class)))
                .thenReturn(new PageImpl<>(List.of(), PageRequest.of(64, 25), 3225));

        mockMvc.perform(get("/admin/inventory").param("page", "64"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Page 65 of 129")))
                .andExpect(content().string(containsString("data-total-pages=\"129\"")))
                .andExpect(content().string(containsString("/admin/inventory?page=128")))
                .andExpect(content().string(containsString("goToInventoryPage(this)")));
    }
}
