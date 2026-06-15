package com.monomarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
  private final ProductService productService;

  // Trang chủ hiển thị tất cả sản phẩm
  @GetMapping("/")
  public String viewHomePage(@RequestParam(value = "platform", required = false) String platform, Model model) {
    if (platform != null && !platform.isEmpty()) {
      model.addAttribute("products", productService.getProductsByPlatform(platform));
    } else {
      model.addAttribute("products", productService.getAllProducts());
    }

    return "index";
  }
}
