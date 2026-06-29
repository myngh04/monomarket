package com.monomarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.service.ProductService;
import com.monomarket.repository.CategoryRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
  private final ProductService productService;
  private final CategoryRepository categoryRepository;

  // Trang chủ hiển thị tất cả sản phẩm
  @GetMapping("/")
  public String viewHomePage(
      @RequestParam(value = "category", required = false) Integer categoryId,
      @RequestParam(value = "platform", required = false) String platform, 
      Model model) {
    
    // Lấy toàn bộ danh mục con (có cha) để hiển thị filter
    model.addAttribute("categories", categoryRepository.findAll().stream()
        .filter(c -> c.getParent() != null)
        .toList());
    
    if (categoryId != null) {
      model.addAttribute("products", productService.getProductsByCategory(categoryId));
      model.addAttribute("activeCategoryId", categoryId);
    } else if (platform != null && !platform.isEmpty()) {
      model.addAttribute("products", productService.getProductsByPlatform(platform));
      model.addAttribute("activePlatform", platform);
    } else {
      model.addAttribute("products", productService.getAllProducts());
    }

    return "index";
  }
}
