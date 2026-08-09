package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.service.AdminOperationsService;

@WebMvcTest(AdminOperationsController.class)
class AdminOperationsControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private AdminOperationsService adminOperationsService;

    @Test
    @WithMockUser(username = "admin@example.com", roles = "ADMIN")
    void shouldShowInventoryPage() throws Exception {
        when(adminOperationsService.getInventory(any(Pageable.class)))
                .thenReturn(new PageImpl<>(List.of()));

        mockMvc.perform(get("/admin/inventory"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/inventory"))
                .andExpect(model().attributeExists("inventoryPage"));
    }

    @Test
    @WithMockUser(username = "staff@example.com", roles = "STAFF")
    void shouldShowOrdersPage() throws Exception {
        when(adminOperationsService.getOrders(any(Pageable.class)))
                .thenReturn(new PageImpl<>(List.of()));

        mockMvc.perform(get("/admin/orders"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/orders"))
                .andExpect(model().attributeExists("orderPage"));
    }
}
