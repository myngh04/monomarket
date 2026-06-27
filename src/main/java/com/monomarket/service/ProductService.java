package com.monomarket.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.monomarket.entity.Product;
import com.monomarket.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
  private final ProductRepository productRepository;

  // Lấy toàn bộ Catalog sản phẩm gốc trong hệ thống
  public List<Product> getAllProducts() {
    return productRepository.findAll();
  }

  // Lấy sản phẩm gốc theo danh mục (Ví dụ: id = 5 là Novels)
  public List<Product> getProductsByCategory(Integer categoryId) {
    return productRepository.findByCategoryId(categoryId);
  }

  // Lọc Catalog theo hệ máy (Platform)
  // Ví dụ: platform = "Nintendo Switch" hoặc "PS5" nằm trong attributes
  public List<Product> getProductsByPlatform(String platform) {
    return productRepository.findByAttribute("platform", platform);
  }
}