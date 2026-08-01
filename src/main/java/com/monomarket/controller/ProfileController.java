package com.monomarket.controller;

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
import com.monomarket.dto.UserProfileDto;
import com.monomarket.entity.User;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProfileController {

  private final UserService userService;
  private final OrderService orderService;

  // Helper: Lấy User đang đăng nhập — nếu chưa đăng nhập trả về null
  private User getCurrentUser(Authentication authentication) {
    if (authentication != null && authentication.isAuthenticated()
        && !"anonymousUser".equals(authentication.getPrincipal())) {
      return userService.findByEmail(authentication.getName()).orElse(null);
    }
    return null;
  }

  // 1. GET /profile — Trang cá nhân: Thông tin tài khoản + Lịch sử đơn hàng gần đây
  @GetMapping("/profile")
  public String showProfilePage(Authentication authentication, Model model) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    UserProfileDto profileDto = new UserProfileDto(
        user.getEmail(),
        user.getFullName(),
        user.getPhone()
    );

    // Profile là trang tổng quan đơn hàng chính. View hiển thị 5 dòng đầu tiên
    // và cho phép mở rộng dần bằng dropdown giới hạn hiển thị, nhờ đó user vẫn
    // xem được toàn bộ lịch sử mà không cần chuyển sang trang khác.
    List<OrderDto> recentOrders = orderService.getOrdersByUser(user);

    model.addAttribute("profile", profileDto);
    model.addAttribute("recentOrders", recentOrders);
    return "profile";
  }

  // 2. POST /profile/update — Cập nhật Tên và Số điện thoại
  @PostMapping("/profile/update")
  public String updateProfile(
      @RequestParam("fullName") String fullName,
      @RequestParam("phone") String phone,
      Authentication authentication,
      RedirectAttributes redirectAttributes) {

    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    // Validate tên không được để trống
    if (fullName == null || fullName.trim().isEmpty()) {
      redirectAttributes.addFlashAttribute("errorMessage", "Full name cannot be empty.");
      return "redirect:/profile";
    }

    userService.updateProfile(user, fullName.trim(), phone != null ? phone.trim() : "");
    redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");

    return "redirect:/profile";
  }

  // 3. POST /orders/{id}/cancel — Hủy đơn hàng PENDING
  @PostMapping("/orders/{id}/cancel")
  public String cancelOrder(
      @PathVariable("id") Long orderId,
      Authentication authentication,
      RedirectAttributes redirectAttributes) {

    return cancelOrder(orderId, authentication, redirectAttributes, "redirect:/orders/" + orderId);
  }

  // Sau khi hủy đơn tại trang tổng quan, quay lại profile để trạng thái mới
  // được hiển thị ngay trong danh sách đơn hàng gần đây.
  @PostMapping("/profile/orders/{id}/cancel")
  public String cancelOrderFromProfile(
      @PathVariable("id") Long orderId,
      Authentication authentication,
      RedirectAttributes redirectAttributes) {

    return cancelOrder(orderId, authentication, redirectAttributes, "redirect:/profile");
  }

  private String cancelOrder(
      Long orderId,
      Authentication authentication,
      RedirectAttributes redirectAttributes,
      String successRedirect) {

    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    try {
      orderService.cancelOrder(orderId, user);
      redirectAttributes.addFlashAttribute("successMessage", "Order #" + orderId + " has been cancelled successfully.");
    } catch (IllegalArgumentException | IllegalStateException e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    }

    return successRedirect;
  }
}
