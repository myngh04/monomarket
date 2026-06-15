package com.monomarket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
  // Query Native: Lọc sản phẩm theo hệ máy nằm sâu trong trường JSONB attributes
  @Query(value = "SELECT * FROM Product WHERE attributes->>'platform' = :platform", nativeQuery = true)
  List<Product> findByPlatform(@Param("platform") String platform);

  // Lọc sản phẩm theo tình trạng Rank đồ cũ (S, A, B, C) và xếp hàng mới lên đầu
  List<Product> findByConditionRankOrderByCreatedAtDesc(String conditionRank);
}
