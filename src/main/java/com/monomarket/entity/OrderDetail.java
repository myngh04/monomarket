package com.monomarket.entity;

import java.math.BigDecimal;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "order_items")
@Getter
@Setter
public class OrderDetail {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "order_id", nullable = false) // Chỉ định rõ ràng tên cột
  private Order order;

  // Lưu ID sản phẩm để làm vết lịch sử đơn hàng
  @Column(nullable = false)
  private Long productId;

  // Giá tiền tại ĐÚNG THỜI ĐIỂM BẤM MUA
  @Column(nullable = false)
  private BigDecimal price;

  // Số lượng sản phẩm mua
  @Column(nullable = false)
  private Integer quantity = 1;
}
