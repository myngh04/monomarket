package com.monomarket.controller;

import com.monomarket.service.UserService;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class AuthController {

  private final UserService userService;

  // Hiển thị trang login ở endpoint /login
  @GetMapping("/login")
  public String showLoginPage() {
    return "login";
  }

  // Hiển thị trang register ở endpoint /register
  @GetMapping("/register")
  public String showRegisterPage() {
    return "register";
  }

  // Xử lý đăng ký user mới
  @PostMapping("/register")
  public String handleRegister(
      @RequestParam("fullName") String fullName,
      @RequestParam("email") String email,
      @RequestParam("password") String password,
      @RequestParam("confirmPassword") String confirmPassword,
      Model model) {

    // Kiểm tra password và confirmPassword khớp nhau
    if (!password.equals(confirmPassword)) {
      model.addAttribute("error", "Password and Confirm Password do not match.");
      return "register";
    }

    try {
      // Gọi userService để lưu thông tin user
      userService.registerUser(fullName, email, password);

      // Nếu đăng ký thành công, chuyển hướng đến trang login
      return "redirect:/login?registered";
    } catch (Exception e) {

      // Nếu có lỗi xảy ra, hiển thị thông báo lỗi trên trang register
      model.addAttribute("error", e.getMessage());
      return "register";
    }
  }

}
