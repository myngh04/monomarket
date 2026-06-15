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

  public List<Product> getAllProducts() {
    return productRepository.findAll();
  }

  public List<Product> getProductsByPlatform(String platform) {
    return productRepository.findByPlatform(platform);
  }

  public List<Product> getProductsByConditionRank(String rank) {
    return productRepository.findByConditionRankOrderByCreatedAtDesc(rank);
  }
}
