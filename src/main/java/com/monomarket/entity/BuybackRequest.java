package com.monomarket.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDate;
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

    // Người dùng tạo request thu mua.
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private BuybackRequestStatus status = BuybackRequestStatus.PENDING;

    @Column(precision = 12, scale = 2)
    private BigDecimal totalEstimatedPrice = BigDecimal.ZERO;

    @Column(length = 1000)
    private String description;

    @Column(length = 500)
    private String handoverAddress;

    @Column
    private LocalDate preferredHandoverDate;

    // Nhân viên/admin gần nhất xử lý request và thông tin kiểm định tương ứng.
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reviewed_by")
    private User reviewedBy;

    @Column
    private LocalDateTime reviewedAt;

    @Column(length = 2000)
    private String inspectionNotes;

    @Column(length = 1000)
    private String rejectionReason;

    // Chiều ngược nối xuống danh sách các món đồ cụ thể trong đơn thu mua này
    @OneToMany(mappedBy = "buybackRequest", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BuybackRequestItem> items = new ArrayList<>();

    // Lịch sử chuyển trạng thái để admin biết request đã được ai xử lý và lúc nào.
    @OneToMany(mappedBy = "buybackRequest", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("createdAt ASC")
    private List<BuybackRequestStatusHistory> statusHistory = new ArrayList<>();

    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Column
    private LocalDateTime updatedAt;

    // Gán timestamp khi request được tạo lần đầu.
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    // Cập nhật timestamp mỗi khi request hoặc trạng thái xử lý thay đổi.
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    // Đồng bộ quan hệ hai chiều khi thêm item vào request.
    public void addItem(BuybackRequestItem item) {
        items.add(item);
        item.setBuybackRequest(this);
    }

    // Đồng bộ quan hệ hai chiều khi thêm một bản ghi lịch sử trạng thái.
    public void addStatusHistory(BuybackRequestStatusHistory history) {
        statusHistory.add(history);
        history.setBuybackRequest(this);
    }
}
