package com.monomarket.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.service.ProductService;
import com.monomarket.entity.Product;
import com.monomarket.repository.CategoryRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
  private final ProductService productService;
  private final CategoryRepository categoryRepository;

  // Trang chủ hiển thị tất cả sản phẩm có phân trang và filter theo danh mục hoặc
  // nền tảng
  @GetMapping("/")
  public String viewHomePage(
      @RequestParam(value = "category", required = false) Integer categoryId,
      @RequestParam(value = "platform", required = false) String platform,
      @RequestParam(value = "page", defaultValue = "0") int page,
      @RequestParam(value = "size", defaultValue = "12") int size,
      Model model) {

    // Lấy toàn bộ danh mục con (có cha) để hiển thị filter
    model.addAttribute("categories", categoryRepository.findAll().stream()
        .filter(c -> c.getParent() != null)
        .toList());

    // Tạo đối tượng phân trang: Sắp xếp theo ID giảm dần (Sản phẩm mới nhập hiển
    // thị lên trước)
    Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
    Page<Product> productPage;

    // Phân luồng lọc sản phẩm
    if (categoryId != null) {
      productPage = productService.getProductsByCategory(categoryId, pageable);
      model.addAttribute("activeCategoryId", categoryId);
    } else if (platform != null && !platform.isEmpty()) {
      productPage = productService.getProductsByPlatform(platform, pageable);
      model.addAttribute("activePlatform", platform);
    } else {
      productPage = productService.getAllProducts(pageable);
    }

    // Đưa dữ liệu sang thymeleaf template

    // Danh sách sản phẩm ở trang hiện tại
    model.addAttribute("products", productPage.getContent());

    // Số trang hiện tại (0-indexed)
    model.addAttribute("currentPage", page);

    // Tổng số trang tính từ DB
    model.addAttribute("totalPages", productPage.getTotalPages());

    // Tổng số sản phẩm trong DB
    model.addAttribute("totalProducts", productPage.getTotalElements());

    return "index";
  }
}
