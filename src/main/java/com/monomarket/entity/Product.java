package com.monomarket.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import java.time.LocalDateTime;
import java.util.Map;
import org.hibernate.type.SqlTypes;

@Entity
@Table(name = "products")
@Getter
@Setter
public class Product {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "isbn_or_jan", nullable = false, unique = true, length = 50)
  private String isbnOrJan;

  @Column(name = "title_ja", nullable = false, length = 255)
  private String titleJa;

  @Column(name = "title_en", length = 255)
  private String titleEn;

  // Nối sang bảng Categories (Đã cấu hình từ V2)
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id")
  private Category category;

  // 🌟 Quả bùa JSONB để bới thuộc tính động (Tác giả, Nhà xuất bản, Hệ máy...)
  @JdbcTypeCode(SqlTypes.JSON)
  @Column(columnDefinition = "jsonb")
  private Map<String, Object> attributes;

  @Column(name = "created_at", updatable = false)
  private LocalDateTime createdAt;

  @Column(name = "updated_at")
  private LocalDateTime updatedAt;

  @PrePersist
  protected void onCreate() {
    createdAt = LocalDateTime.now();
    updatedAt = LocalDateTime.now();
  }

  @PreUpdate
  protected void onUpdate() {
    updatedAt = LocalDateTime.now();
  }
}
