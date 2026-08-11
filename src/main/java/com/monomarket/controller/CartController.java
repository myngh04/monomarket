package com.monomarket.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.controller.support.CartRequestContext;
import com.monomarket.controller.support.CartRequestContextResolver;
import com.monomarket.service.CartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

  private final CartService cartService;
  private final CartRequestContextResolver cartRequestContextResolver;

  // Hiển thị cart Thymeleaf của user hoặc guest, dùng chung guest-cookie behavior với REST API.
  @GetMapping
  public String showCartPage(
      Authentication authentication,
      HttpServletRequest request,
      HttpServletResponse response,
      Model model) {
    CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
    model.addAttribute("cartItems", cartService.getCartDtoList(context.user(), context.guestToken()));
    return "ecommerce/cart";
  }

  // Thêm inventory item rồi redirect về cart để giữ flow form POST của MVC hiện tại.
  @PostMapping("/add")
  public String addToCart(
      @RequestParam("inventoryItemId") Long inventoryItemId,
      Authentication authentication,
      HttpServletRequest request,
      HttpServletResponse response) {
    CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
    cartService.addToCart(inventoryItemId, context.user(), context.guestToken());
    return "redirect:/cart";
  }

  // Xóa inventory item rồi redirect về cart để giữ behavior MVC cũ cho guest và authenticated user.
  @PostMapping("/remove")
  public String removeFromCart(
      @RequestParam("inventoryItemId") Long inventoryItemId,
      Authentication authentication,
      HttpServletRequest request,
      HttpServletResponse response) {
    CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
    cartService.removeFromCart(inventoryItemId, context.user(), context.guestToken());
    return "redirect:/cart";
  }

  // Xóa toàn bộ item rồi redirect về cart, không xóa guest token để cart identity vẫn ổn định.
  @PostMapping("/clear")
  public String clearCart(
      Authentication authentication,
      HttpServletRequest request,
      HttpServletResponse response) {
    CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
    cartService.clearCart(context.user(), context.guestToken());
    return "redirect:/cart";
  }
}
