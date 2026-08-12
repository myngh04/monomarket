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
                .andExpect(jsonPath("$.paths['/']").doesNotExist());
    }

    @Test
    void shouldExposeSwaggerUiWithoutAuthentication() throws Exception {
        mockMvc.perform(get("/swagger-ui/index.html"))
                .andExpect(status().isOk());
    }
}
