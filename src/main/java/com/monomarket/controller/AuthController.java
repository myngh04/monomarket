package com.monomarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {
  
  // Trả về trang login ở đường dẫn /login
  @GetMapping("/login")
  public String login() {
    return "login";
  }
}
