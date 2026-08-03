package com.monomarket.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import java.math.BigDecimal;
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

  // Nối sang bảng Categories 
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id")
  private Category category;

  @JdbcTypeCode(SqlTypes.JSON)
  @Column(name = "attributes")
  private Map<String, Object> attributes;

  // Nối ngược sang danh sách hàng hóa thực tế đang có
  @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
  // Ưu tiên hàng AVAILABLE, sau đó sắp xếp theo giá tăng dần.
  @OrderBy("status ASC, price ASC")
  private java.util.List<InventoryItem> inventoryItems;

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

  // Chọn title tiếng Anh nếu có, nếu không fallback sang title tiếng Nhật.
  public String getDisplayTitle() {
    return titleEn != null && !titleEn.isBlank() ? titleEn : titleJa;
  }

  // Đọc giá thu mua tham khảo từ attributes của product và chuẩn hóa về BigDecimal.
  public BigDecimal getBuybackPrice() {
    Object rawPrice = attributes == null ? null : attributes.get("buyback_price");
    if (rawPrice == null) {
      throw new IllegalStateException("Buyback price is not configured for product: " + isbnOrJan);
    }

    try {
      return rawPrice instanceof BigDecimal
          ? (BigDecimal) rawPrice
          : new BigDecimal(rawPrice.toString());
    } catch (NumberFormatException exception) {
      throw new IllegalStateException("Invalid buyback price for product: " + isbnOrJan, exception);
    }
  }
}
