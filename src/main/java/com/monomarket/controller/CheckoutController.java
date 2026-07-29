package com.monomarket.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.monomarket.dto.OrderDto;
import com.monomarket.entity.Order;
import com.monomarket.entity.User;
import com.monomarket.exception.OutOfStockException;
import com.monomarket.service.CartService;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CheckoutController {

  private final OrderService orderService;
  private final CartService cartService;
  private final UserService userService;

  // Helper: Lấy User đang đăng nhập — nếu chưa đăng nhập trả về null
  private User getCurrentUser(Authentication authentication) {
    if (authentication != null && authentication.isAuthenticated()
        && !"anonymousUser".equals(authentication.getPrincipal())) {
      return userService.findByEmail(authentication.getName()).orElse(null);
    }
    return null;
  }

  // 1. GET /checkout — Hiển thị trang review đơn + form nhập địa chỉ
  @GetMapping("/checkout")
  public String showCheckoutPage(Authentication authentication, Model model) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    // Lấy danh sách sản phẩm trong giỏ để preview (readonly)
    var cartItems = cartService.getCartDtoList(user, null);

    // Nếu giỏ hàng rỗng → redirect về trang giỏ hàng
    if (cartItems.isEmpty()) {
      return "redirect:/cart";
    }

    // Tính tổng tiền để hiển thị trước khi confirm
    var total = cartItems.stream()
        .map(item -> item.getPrice())
        .reduce(BigDecimal.ZERO, BigDecimal::add);

    model.addAttribute("cartItems", cartItems);
    model.addAttribute("total", total);
    return "checkout";
  }

  // 2. POST /checkout/confirm — Tạo Order, lock stock, xóa cart
  @PostMapping("/checkout/confirm")
  public String confirmCheckout(
      @RequestParam("shippingAddress") String shippingAddress,
      Authentication authentication,
      RedirectAttributes redirectAttributes) {

    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    // Validate địa chỉ giao hàng: không được để trống hoặc chỉ chứa khoảng trắng
    if (shippingAddress == null || shippingAddress.trim().isEmpty()) {
      redirectAttributes.addFlashAttribute("errorMessage", "Please provide a valid shipping address.");
      return "redirect:/checkout";
    }

    try {
      // Gọi service để thực hiện toàn bộ logic checkout trong 1 transaction
      Order order = orderService.checkout(user, shippingAddress.trim());

      // Thành công → chuyển sang trang xác nhận đơn hàng kèm orderId
      return "redirect:/orders/" + order.getId() + "/confirmation";

    } catch (OutOfStockException e) {
      // Có món hàng không còn AVAILABLE → báo đúng thực tế để user tự xóa hoặc chọn món khác
      String itemList = String.join(", ", e.getUnavailableItems());
      redirectAttributes.addFlashAttribute("errorMessage",
          "Sorry, the following item(s) are no longer available: " + itemList + ". Please update your cart to proceed.");
      return "redirect:/cart";
    } catch (IllegalStateException e) {
      // Giỏ hàng rỗng hoặc lỗi khác
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
      return "redirect:/cart";
    }
  }

  // 3. GET /orders/{id}/confirmation — Trang xác nhận đặt hàng thành công
  @GetMapping("/orders/{id}/confirmation")
  public String showConfirmation(@PathVariable("id") Long id,
      Authentication authentication,
      Model model) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    OrderDto order = orderService.getOrderDetail(id, user);
    model.addAttribute("order", order);
    return "order-confirmation";
  }

  // 4. GET /orders — Lịch sử đơn hàng của user
  @GetMapping("/orders")
  public String showOrderHistory(Authentication authentication, Model model) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    List<OrderDto> orders = orderService.getOrdersByUser(user);
    model.addAttribute("orders", orders);
    return "order-history";
  }

  // 5. GET /orders/{id} — Chi tiết 1 đơn hàng
  @GetMapping("/orders/{id}")
  public String showOrderDetail(@PathVariable("id") Long id,
      Authentication authentication,
      Model model) {
    User user = getCurrentUser(authentication);
    // Nếu user chưa đăng nhập → redirect về login
    if (user == null) {
      return "redirect:/login";
    }

    // Lấy chi tiết đơn hàng qua orderService
    OrderDto order = orderService.getOrderDetail(id, user);
    model.addAttribute("order", order);
    return "order-detail";
  }
}
