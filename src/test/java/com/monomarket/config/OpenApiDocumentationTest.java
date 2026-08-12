package com.monomarket.config;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
class OpenApiDocumentationTest {

        @Autowired
        private MockMvc mockMvc;

        @Test
        void shouldExposeOnlyRestApiGroupWithoutAuthentication() throws Exception {
                mockMvc.perform(get("/v3/api-docs/monomarket-api"))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.info.title").value("MonoMarket REST API"))
                                .andExpect(jsonPath("$.paths['/api/v1/products']").exists())
                                .andExpect(jsonPath("$.paths['/api/v1/cart']").exists())
                                .andExpect(jsonPath("$.paths['/api/v1/account/profile']").exists())
                                .andExpect(jsonPath("$.paths['/api/v1/account/orders']").exists())
                                .andExpect(jsonPath("$.components.securitySchemes.csrfToken.type").value("apiKey"))
                                .andExpect(jsonPath("$.components.securitySchemes.csrfToken.in").value("header"))
                                .andExpect(jsonPath("$.components.securitySchemes.csrfToken.name")
                                                .value("X-CSRF-TOKEN"))
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].post.security[0].csrfToken").exists())
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].delete.security[0].csrfToken").exists())
                                .andExpect(jsonPath("$.paths['/api/v1/products'].get.responses['400'].description")
                                                .value("Pagination parameters are invalid"))
                                .andExpect(jsonPath(
                                                "$.paths['/api/v1/products/{productId}'].get.responses['404'].description")
                                                .value("Product does not exist"))
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].post.responses['403'].description")
                                                .value("CSRF token is missing or invalid"))
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].post.responses['409'].description")
                                                .value("Inventory item is unavailable"))
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].delete.responses['204'].description")
                                                .value("Cart cleared"))
                                .andExpect(jsonPath(
                                                "$.paths['/api/v1/account/profile'].get.responses['401'].description")
                                                .value("Authentication is required"))
                                .andExpect(jsonPath(
                                                "$.paths['/api/v1/account/orders/{orderId}'].get.responses['404'].description")
                                                .value("Order does not exist or is not owned by the current account"))
                                .andExpect(jsonPath("$.paths['/api/v1/products'].get.tags[0]").value("Products"))
                                .andExpect(jsonPath("$.paths['/api/v1/cart'].get.tags[0]").value("Cart"))
                                .andExpect(jsonPath("$.paths['/api/v1/csrf'].get.tags[0]").value("Security"))
                                .andExpect(jsonPath("$.paths['/api/v1/account/profile'].get.tags[0]").value("Account"))
                                .andExpect(jsonPath("$.paths['/']").doesNotExist());
        }

        @Test
        void shouldExposeSwaggerUiWithoutAuthentication() throws Exception {
                mockMvc.perform(get("/swagger-ui/index.html"))
                                .andExpect(status().isOk());
        }
}
