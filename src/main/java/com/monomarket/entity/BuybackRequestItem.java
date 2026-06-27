package com.monomarket.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "buyback_request_items")
@Getter
@Setter
public class BuybackRequestItem {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  // Thuộc về đơn request thu mua nào
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "request_id", nullable = false)
  private BuybackRequest buybackRequest;

  // Nếu hệ thống nhận diện được mã vạch ISBN/JAN thì nối thẳng vào Catalog
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "product_id")
  private Product product;

  @Column(nullable = false, length = 255)
  private String userDeclaredTitle; // Khách tự gõ tên sản phẩm nếu không có mã vạch

  @Column(length = 50)
  private String userDeclaredCondition; // Khách tự đánh giá (Ví dụ: "Hơi trầy xước nhẹ")

  @Column(length = 5)
  private String finalConditionRank; // S, A, B, C (Rank chuẩn sau khi thẩm định viên của sàn kiểm tra)

  @Column(precision = 12, scale = 2)
  private BigDecimal finalBuyPrice; // Số tiền thực tế sàn chốt mua lại từ khách
}