package com.monomarket.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.monomarket.entity.Product;
import com.monomarket.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {
  private final ProductRepository productRepository;

  // Lấy toàn bộ Catalog sản phẩm gốc trong hệ thống có phân trang
  public Page<Product> getAllProducts(Pageable pageable) {
    return productRepository.findAll(pageable);
  }

  // Lấy sản phẩm gốc theo danh mục (Ví dụ: id = 5 là Novels)
  public Page<Product> getProductsByCategory(Integer categoryId, Pageable pageable) {
    return productRepository.findByCategoryId(categoryId, pageable);
  }

  // Lọc Catalog theo hệ máy (Platform) có phân trang, dựa vào trường attributes trong JSONB của Postgres
  // Ví dụ: platform = "Nintendo Switch" hoặc "PS5" nằm trong attributes
  public Page<Product> getProductsByPlatform(String platform, Pageable pageable) {
    return productRepository.findByAttribute("platform", platform, pageable);
  }
}