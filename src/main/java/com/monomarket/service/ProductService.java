package com.monomarket.service;

import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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
    return loadViewDetails(productRepository.findAllOrderByAvailability(pageable));
  }

  // Lấy sản phẩm gốc theo danh mục (Ví dụ: id = 5 là Novels)
  public Page<Product> getProductsByCategory(Integer categoryId, Pageable pageable) {
    return loadViewDetails(productRepository.findByCategoryIdOrderByAvailability(categoryId, pageable));
  }

  // Lọc Catalog theo hệ máy (Platform) có phân trang, dựa vào trường attributes
  // trong JSONB của Postgres
  // Ví dụ: platform = "Nintendo Switch" hoặc "PS5" nằm trong attributes
  public Page<Product> getProductsByPlatform(String platform, Pageable pageable) {
    return loadViewDetails(productRepository.findByAttributeOrderByAvailability("platform", platform, pageable));
  }

  // Lấy 1 sản phẩm cụ thể theo id, nếu không có trả về null
  public Optional<Product> getProductById(Long id) {
    return productRepository.findByIdWithViewDetails(id);
  }

  // Fetch dữ liệu view bằng query riêng sau khi đã phân trang, rồi khôi phục đúng
  // thứ tự của Page ban đầu.
  private Page<Product> loadViewDetails(Page<Product> productPage) {
    if (productPage.isEmpty()) {
      return productPage;
    }

    Map<Long, Product> productsById = productRepository.findAllByIdWithViewDetails(
        productPage.getContent().stream().map(Product::getId).toList())
        .stream()
        .collect(Collectors.toMap(Product::getId, Function.identity()));

    var orderedProducts = productPage.getContent().stream()
        .map(product -> productsById.get(product.getId()))
        .toList();

    return new PageImpl<>(orderedProducts, productPage.getPageable(), productPage.getTotalElements());
  }
}
