package com.monomarket.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Map;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.BuybackRequestStatusHistory;
import com.monomarket.entity.User;
import com.monomarket.repository.BuybackRequestRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminBuybackService {

    private final BuybackRequestRepository buybackRequestRepository;

    // Lấy danh sách Buyback cho dashboard; khi có status thì chỉ lấy đúng hàng đợi
    // đó.
    @Transactional(readOnly = true)
    public Page<BuybackRequest> getRequests(BuybackRequestStatus status, Pageable pageable) {
        if (status == null) {
            return buybackRequestRepository.findAllByOrderByCreatedAtAsc(pageable);
        }
        return buybackRequestRepository.findByStatusOrderByCreatedAtAsc(status, pageable);
    }

    // Đếm request theo status để dashboard hiển thị các chỉ số xử lý nhanh.
    @Transactional(readOnly = true)
    public long countByStatus(BuybackRequestStatus status) {
        if (status == null) {
            throw new IllegalArgumentException("Status is required");
        }
        return buybackRequestRepository.countByStatus(status);
    }

    // Lấy detail admin đã fetch sẵn user, reviewer và product để view không phụ
    // thuộc OSIV.
    @Transactional(readOnly = true)
    public BuybackRequest getRequestDetails(Long requestId) {
        return buybackRequestRepository.findByIdWithAdminDetails(requestId)
                .orElseThrow(() -> new IllegalArgumentException("Buyback request not found"));
    }

    // Chuyển request sang trạng thái kế tiếp sau khi kiểm tra quyền, transition và
    // ghi audit history.
    public BuybackRequest transitionStatus(Long requestId, User reviewer,
            BuybackRequestStatus targetStatus, String note) {
        requireStaffOrAdmin(reviewer);
        if (targetStatus == null) {
            throw new IllegalArgumentException("Target status is required");
        }

        BuybackRequest request = getRequestForUpdate(requestId);
        BuybackRequestStatus currentStatus = request.getStatus();
        if (!isAllowedTransition(currentStatus, targetStatus)) {
            throw new IllegalStateException(
                    "Cannot change Buyback request from " + currentStatus + " to " + targetStatus);
        }

        applyTransition(request, reviewer, targetStatus, normalizeOptional(note));
        return buybackRequestRepository.save(request);
    }

    // Chốt condition và giá mua thực tế ở bước TESTING -> PRICED, đồng thời lưu ghi
    // chú kiểm định.
    public BuybackRequest reviewAndPrice(Long requestId, User reviewer,
            String finalConditionRank, BigDecimal finalBuyPrice, String inspectionNotes) {
        requireStaffOrAdmin(reviewer);
        String normalizedRank = normalizeConditionRank(finalConditionRank);
        validateFinalPrice(finalBuyPrice);

        BuybackRequest request = getRequestForUpdate(requestId);
        if (request.getStatus() != BuybackRequestStatus.TESTING) {
            throw new IllegalStateException("Only TESTING requests can be priced");
        }

        BuybackRequestItem item = requireSingleItem(request);
        item.setFinalConditionRank(normalizedRank);
        item.setFinalBuyPrice(finalBuyPrice);
        request.setInspectionNotes(normalizeOptional(inspectionNotes));
        applyTransition(request, reviewer, BuybackRequestStatus.PRICED,
                request.getInspectionNotes());
        return buybackRequestRepository.save(request);
    }

    // Lấy request trong transaction hiện tại để transition không thao tác trên dữ
    // liệu chưa được kiểm tra.
    private BuybackRequest getRequestForUpdate(Long requestId) {
        if (requestId == null) {
            throw new IllegalArgumentException("Request id is required");
        }
        return buybackRequestRepository.findByIdWithAdminDetails(requestId)
                .orElseThrow(() -> new IllegalArgumentException("Buyback request not found"));
    }

    // Ghi status mới, reviewer, thời điểm xử lý và một audit history trong cùng
    // transaction.
    private void applyTransition(BuybackRequest request, User reviewer,
            BuybackRequestStatus targetStatus, String note) {
        BuybackRequestStatusHistory history = new BuybackRequestStatusHistory();
        history.setFromStatus(request.getStatus());
        history.setToStatus(targetStatus);
        history.setChangedBy(reviewer);
        history.setNote(note);

        request.setStatus(targetStatus);
        request.setReviewedBy(reviewer);
        request.setReviewedAt(LocalDateTime.now());
        request.addStatusHistory(history);

        if (targetStatus == BuybackRequestStatus.REJECTED) {
            request.setRejectionReason(note);
        }
    }

    // Xác định các cạnh hợp lệ của state machine Buyback, không cho phép nhảy cóc
    // trạng thái.
    private boolean isAllowedTransition(BuybackRequestStatus currentStatus,
            BuybackRequestStatus targetStatus) {
        return ALLOWED_TRANSITIONS.getOrDefault(currentStatus, Set.of()).contains(targetStatus);
    }

    // Kiểm tra reviewer có quyền vận hành Buyback; USER không được gọi service
    // admin.
    private void requireStaffOrAdmin(User reviewer) {
        if (reviewer == null || reviewer.getId() == null
                || !("STAFF".equalsIgnoreCase(reviewer.getRole())
                        || "ADMIN".equalsIgnoreCase(reviewer.getRole()))) {
            throw new IllegalArgumentException("Staff or admin permission is required");
        }
    }

    // Chuẩn hóa rank kiểm định và chỉ chấp nhận bốn rank nghiệp vụ của Buyback.
    private String normalizeConditionRank(String conditionRank) {
        String normalized = conditionRank == null ? "" : conditionRank.trim().toUpperCase();
        if (!Set.of("S", "A", "B", "C").contains(normalized)) {
            throw new IllegalArgumentException("Final condition rank must be S, A, B, or C");
        }
        return normalized;
    }

    // Không cho phép lưu giá final âm hoặc null sau khi staff chốt định giá.
    private void validateFinalPrice(BigDecimal finalBuyPrice) {
        if (finalBuyPrice == null || finalBuyPrice.signum() < 0) {
            throw new IllegalArgumentException("Final buy price must be zero or greater");
        }
    }

    // Đảm bảo request hiện tại đúng mô hình một request chứa một sản phẩm.
    private BuybackRequestItem requireSingleItem(BuybackRequest request) {
        if (request.getItems() == null || request.getItems().size() != 1) {
            throw new IllegalStateException("Buyback request must contain exactly one item");
        }
        return request.getItems().get(0);
    }

    // Chuẩn hóa ghi chú tùy chọn trước khi ghi audit hoặc các cột review.
    private String normalizeOptional(String value) {
        return value == null || value.isBlank() ? null : value.trim();
    }

    private static final Map<BuybackRequestStatus, Set<BuybackRequestStatus>> ALLOWED_TRANSITIONS = buildAllowedTransitions();

    // Khai báo state machine tập trung để mọi transition của service dùng cùng một
    // luật.
    private static Map<BuybackRequestStatus, Set<BuybackRequestStatus>> buildAllowedTransitions() {
        Map<BuybackRequestStatus, Set<BuybackRequestStatus>> transitions = new EnumMap<>(BuybackRequestStatus.class);
        transitions.put(BuybackRequestStatus.PENDING,
                EnumSet.of(BuybackRequestStatus.RECEIVED, BuybackRequestStatus.REJECTED));
        transitions.put(BuybackRequestStatus.RECEIVED,
                EnumSet.of(BuybackRequestStatus.TESTING, BuybackRequestStatus.REJECTED));
        transitions.put(BuybackRequestStatus.TESTING,
                EnumSet.of(BuybackRequestStatus.PRICED, BuybackRequestStatus.REJECTED));
        transitions.put(BuybackRequestStatus.PRICED,
                EnumSet.of(BuybackRequestStatus.USER_ACCEPTED,
                        BuybackRequestStatus.USER_DECLINED, BuybackRequestStatus.REJECTED));
        transitions.put(BuybackRequestStatus.USER_ACCEPTED,
                EnumSet.of(BuybackRequestStatus.PAID));
        transitions.put(BuybackRequestStatus.PAID,
                EnumSet.of(BuybackRequestStatus.STOCKED));
        return transitions;
    }
}
