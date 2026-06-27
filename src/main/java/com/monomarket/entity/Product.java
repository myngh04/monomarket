package com.monomarket.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Map;

import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "products")
@Getter
@Setter
public class Product {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true, length = 50)
  private String instoreCode;

  @Column(nullable = false)
  private BigDecimal price;

  @Column(nullable = false, length = 5)
  private String conditionRank;

  private Integer stock = 1;

  @Column(length = 20)
  private String status = "AVAILABLE";

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id") // chỉ định tên cột khóa ngoại
  private Category category;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Map<String, Object> attributes;

  @Column(updatable = false)
  private LocalDateTime createdAt = LocalDateTime.now();

  private LocalDateTime updatedAt = LocalDateTime.now();
}
