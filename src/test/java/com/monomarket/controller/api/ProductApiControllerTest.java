package com.monomarket.controller.api;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.entity.Category;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Product;
import com.monomarket.service.ProductService;

@WebMvcTest(ProductApiController.class)
@AutoConfigureMockMvc(addFilters = false)
class ProductApiControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private ProductService productService;

    @Test
    void shouldReturnPagedProductResponses() throws Exception {
        when(productService.getAllProducts(any()))
                .thenReturn(new PageImpl<>(List.of(productWithAvailableInventory())));

        mockMvc.perform(get("/api/v1/products").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content[0].id").value(10))
                .andExpect(jsonPath("$.content[0].displayTitle").value("Test Product"))
                .andExpect(jsonPath("$.content[0].category.slug").value("books"))
                .andExpect(jsonPath("$.content[0].availableInventoryItems[0].id").value(20))
                .andExpect(jsonPath("$.content[0].availableInventoryItems.length()").value(1))
                .andExpect(jsonPath("$.page").value(0));
    }

    @Test
    void shouldReturnNotFoundJsonWhenProductDoesNotExist() throws Exception {
        when(productService.getProductById(99L)).thenReturn(Optional.empty());

        mockMvc.perform(get("/api/v1/products/99").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.status").value(404))
                .andExpect(jsonPath("$.message").value("Product not found"))
                .andExpect(jsonPath("$.path").value("/api/v1/products/99"));
    }

    @Test
    void shouldRejectInvalidPageSizeWithJsonError() throws Exception {
        mockMvc.perform(get("/api/v1/products").param("size", "51").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.status").value(400))
                .andExpect(jsonPath("$.message").value("size must be between 1 and 50"));
    }

    // Tạo product fixture có cả AVAILABLE và RESERVED inventory để xác minh API không lộ hàng đã giữ chỗ.
    private Product productWithAvailableInventory() {
        Category category = new Category();
        category.setId(1);
        category.setNameEn("Books");
        category.setNameJa("Books");
        category.setSlug("books");

        InventoryItem available = inventoryItem(20L, "AVAILABLE");
        InventoryItem reserved = inventoryItem(21L, "RESERVED");

        Product product = new Product();
        product.setId(10L);
        product.setIsbnOrJan("9780000000001");
        product.setTitleJa("Test Product");
        product.setTitleEn("Test Product");
        product.setCategory(category);
        product.setInventoryItems(List.of(available, reserved));
        return product;
    }

    // Tạo inventory fixture tối thiểu để kiểm tra DTO chỉ serializes item AVAILABLE.
    private InventoryItem inventoryItem(Long id, String status) {
        InventoryItem inventoryItem = new InventoryItem();
        inventoryItem.setId(id);
        inventoryItem.setInstoreCode("INV-" + id);
        inventoryItem.setPrice(new BigDecimal("19.99"));
        inventoryItem.setConditionRank("A");
        inventoryItem.setItemType("USED");
        inventoryItem.setStatus(status);
        return inventoryItem;
    }
}
