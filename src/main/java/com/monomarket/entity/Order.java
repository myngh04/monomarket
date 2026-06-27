package com.monomarket.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "orders")
@Getter
@Setter
public class Order {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column
  private Long userId;

  @Column(nullable = false)
  private BigDecimal totalPrice;

  @Column(nullable = false, columnDefinition = "TEXT")
  private String shippingAddress;

  @Column(length = 24)
  private String status = "PENDING";

  @Column(updatable = false)
  private LocalDateTime createdAt = LocalDateTime.now();

  // Định nghĩa mối quan hệ xuôi xuống bảng order_items
  @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
  private List<OrderDetail> items = new ArrayList<>();

  // Đồng bộ hai chiều: thêm item vào đơn và gán order ngược lại cho item.
  public void addItem(OrderDetail item) {
    items.add(item);
    item.setOrder(this);
  }

  // Gỡ item khỏi đơn và xóa liên kết order trên item (orphanRemoval sẽ xóa row khi flush).
  public void removeItem(OrderDetail item) {
    items.remove(item);
    item.setOrder(null);
  }
}
