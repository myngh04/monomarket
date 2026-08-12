package com.monomarket.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collections;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import com.monomarket.controller.support.CartRequestContext;
import com.monomarket.controller.support.CartRequestContextResolver;
import com.monomarket.service.CartService;

@WebMvcTest(CartController.class)
@AutoConfigureMockMvc(addFilters = false)
class CartControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private CartService cartService;

  @MockitoBean
  private CartRequestContextResolver cartRequestContextResolver;

  @Test
  void shouldReturnCartViewUsingResolvedCartContext() throws Exception {
    CartRequestContext context = new CartRequestContext(null, "guest-token");
    when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);
    when(cartService.getCartDtoList(null, "guest-token")).thenReturn(Collections.emptyList());

    mockMvc.perform(get("/cart"))
        .andExpect(status().isOk())
        .andExpect(view().name("ecommerce/cart"))
        .andExpect(model().attributeExists("cartItems"));

    verify(cartService).getCartDtoList(null, "guest-token");
  }

  @Test
  void shouldRedirectAfterAddingItemWithResolvedCartContext() throws Exception {
    CartRequestContext context = new CartRequestContext(null, "guest-token");
    when(cartRequestContextResolver.resolve(any(), any(), any())).thenReturn(context);

    mockMvc.perform(post("/cart/add").param("inventoryItemId", "100"))
        .andExpect(status().is3xxRedirection())
        .andExpect(redirectedUrl("/cart"));

    verify(cartService).addToCart(eq(100L), eq(null), eq("guest-token"));
  }
}
