package com.monomarket.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "buyback_requests")
@Getter
@Setter
public class BuybackRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Người dùng tạo request thu mua (Tạm thời để Join sang bảng User)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(length = 20)
    private String status = "PENDING"; // PENDING, TESTING, PRICED, APPROVED, REJECTED

    @Column(precision = 12, scale = 2)
    private BigDecimal totalEstimatedPrice = BigDecimal.ZERO;

    // Chiều ngược nối xuống danh sách các món đồ cụ thể trong đơn thu mua này
    @OneToMany(mappedBy = "buybackRequest", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BuybackRequestItem> items = new ArrayList<>();

    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Column
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

    // Helper method đồng bộ 2 chiều khi thêm item thanh lý
    public void addItem(BuybackRequestItem item) {
        items.add(item);
        item.setBuybackRequest(this);
    }
}