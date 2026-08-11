package com.monomarket.controller.api;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.controller.support.CartRequestContext;
import com.monomarket.controller.support.CartRequestContextResolver;
import com.monomarket.dto.CartItemDto;
import com.monomarket.service.CartService;

@WebMvcTest(CartApiController.class)
@AutoConfigureMockMvc(addFilters = false)
class CartApiControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private CartService cartService;

    @MockitoBean
    private CartRequestContextResolver cartRequestContextResolver;

    @Test
    void shouldReturnGuestCartAsJson() throws Exception {
        CartRequestContext context = new CartRequestContext(null, "guest-token");
        when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);
        when(cartService.getCartDtoList(null, "guest-token")).thenReturn(List.of(cartItem()));

        mockMvc.perform(get("/api/v1/cart").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.items[0].inventoryItemId").value(10))
                .andExpect(jsonPath("$.items[0].price").value(19.99))
                .andExpect(jsonPath("$.totalPrice").value(19.99));
    }

    @Test
    void shouldAddAvailableItemAndReturnUpdatedCart() throws Exception {
        CartRequestContext context = new CartRequestContext(null, "guest-token");
        when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);
        when(cartService.addToCart(10L, null, "guest-token")).thenReturn(true);
        when(cartService.getCartDtoList(null, "guest-token")).thenReturn(List.of(cartItem()));

        mockMvc.perform(post("/api/v1/cart")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"inventoryItemId\":10}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.items[0].inventoryItemId").value(10));

        verify(cartService).addToCart(10L, null, "guest-token");
    }

    @Test
    void shouldReturnConflictWhenInventoryIsUnavailable() throws Exception {
        CartRequestContext context = new CartRequestContext(null, "guest-token");
        when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);
        when(cartService.addToCart(10L, null, "guest-token")).thenReturn(false);

        mockMvc.perform(post("/api/v1/cart")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"inventoryItemId\":10}"))
                .andExpect(status().isConflict())
                .andExpect(jsonPath("$.status").value(409))
                .andExpect(jsonPath("$.message").value("Inventory item is unavailable"));
    }

    @Test
    void shouldReturnBadRequestForMissingInventoryItemId() throws Exception {
        mockMvc.perform(post("/api/v1/cart")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{}"))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.status").value(400))
                .andExpect(jsonPath("$.message").value("inventoryItemId inventoryItemId is required"));
    }

    @Test
    void shouldRemoveItemWithoutReturningBody() throws Exception {
        CartRequestContext context = new CartRequestContext(null, "guest-token");
        when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);

        mockMvc.perform(delete("/api/v1/cart/items/10"))
                .andExpect(status().isNoContent());

        verify(cartService).removeFromCart(eq(10L), eq(null), eq("guest-token"));
    }

    @Test
    void shouldClearCartWithoutReturningBody() throws Exception {
        CartRequestContext context = new CartRequestContext(null, "guest-token");
        when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);

        mockMvc.perform(delete("/api/v1/cart"))
                .andExpect(status().isNoContent());

        verify(cartService).clearCart(null, "guest-token");
    }

    // Tạo item fixture theo serialized-inventory invariant: một DTO đại diện cho đúng một inventory item.
    private CartItemDto cartItem() {
        return new CartItemDto(10L, 1L, "Test Product", "9780000000001", "A", new BigDecimal("19.99"));
    }
}
