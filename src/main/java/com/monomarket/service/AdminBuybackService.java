package com.monomarket.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.BuybackRequestStatusHistory;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.User;
import com.monomarket.repository.BuybackRequestRepository;
import com.monomarket.repository.InventoryItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminBuybackService {

    private final BuybackRequestRepository buybackRequestRepository;
    private final InventoryItemRepository inventoryItemRepository;

    // Lấy danh sách Buyback cho dashboard; khi có status thì chỉ lấy đúng hàng đợi
    // đó.
    @Transactional(readOnly = true)
    public Page<BuybackRequest> getRequests(BuybackRequestStatus status, Pageable pageable) {
        Page<BuybackRequest> requestPage;
        if (status == null) {
            requestPage = buybackRequestRepository.findAllForAdminQueue(pageable);
        } else {
            requestPage = buybackRequestRepository.findByStatusForAdminQueue(status, pageable);
        }
        return loadDashboardDetails(requestPage);
    }

    // Đếm request theo status để dashboard hiển thị các chỉ số xử lý nhanh.
    @Transactional(readOnly = true)
    public long countByStatus(BuybackRequestStatus status) {
        if (status == null) {
            throw new IllegalArgumentException("Status is required");
        }
        return buybackRequestRepository.countByStatus(status);
    }

    // Lấy giá bán storefront của các request STOCKED bằng một query bulk cho bảng admin.
    @Transactional(readOnly = true)
    public Map<Long, BigDecimal> getStorePrices(List<BuybackRequest> requests) {
        if (requests == null || requests.isEmpty()) {
            return Map.of();
        }

        Map<String, Long> requestIdByCode = new HashMap<>();
        for (BuybackRequest request : requests) {
            if (request.getStatus() != BuybackRequestStatus.STOCKED
                    || request.getItems() == null || request.getItems().size() != 1) {
                continue;
            }
            BuybackRequestItem item = request.getItems().get(0);
            if (request.getId() != null && item.getId() != null) {
                requestIdByCode.put("BB-" + request.getId() + "-" + item.getId(), request.getId());
            }
        }

        if (requestIdByCode.isEmpty()) {
            return Map.of();
        }

        Map<Long, BigDecimal> prices = new HashMap<>();
        for (InventoryItem inventoryItem : inventoryItemRepository
                .findByInstoreCodeIn(requestIdByCode.keySet().stream().toList())) {
            Long requestId = requestIdByCode.get(inventoryItem.getInstoreCode());
            if (requestId != null) {
                prices.put(requestId, inventoryItem.getPrice());
            }
        }
        return prices;
    }

    // Lấy detail admin đã fetch sẵn user, reviewer và product để view không phụ
    // thuộc OSIV.
    @Transactional(readOnly = true)
    public BuybackRequest getRequestDetails(Long requestId) {
        return buybackRequestRepository.findByIdWithAdminDetails(requestId)
                .orElseThrow(() -> new IllegalArgumentException("Buyback request not found"));
    }

    // Lấy audit history của request để detail view hiển thị đầy đủ ai đã đổi status và lúc nào.
    @Transactional(readOnly = true)
    public List<BuybackRequestStatusHistory> getStatusHistory(Long requestId) {
        if (requestId == null) {
            throw new IllegalArgumentException("Request id is required");
        }
        return buybackRequestRepository.findStatusHistoryByRequestId(requestId);
    }

    // Trả về các status kế tiếp hợp lệ để UI chỉ hiển thị thao tác mà state machine cho phép.
    @Transactional(readOnly = true)
    public List<BuybackRequestStatus> getAllowedNextStatuses(BuybackRequestStatus currentStatus) {
        if (currentStatus == null) {
            throw new IllegalArgumentException("Current status is required");
        }
        return List.copyOf(ALLOWED_TRANSITIONS.getOrDefault(currentStatus, Set.of()));
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
        if (currentStatus == BuybackRequestStatus.PRICED
                && targetStatus == BuybackRequestStatus.USER_ACCEPTED) {
            throw new IllegalStateException("User must accept the final Buyback price");
        }
        if (!isAllowedTransition(currentStatus, targetStatus)) {
            throw new IllegalStateException(
                    "Cannot change Buyback request from " + currentStatus + " to " + targetStatus);
        }

        applyTransition(request, reviewer, targetStatus, normalizeOptional(note));
        return buybackRequestRepository.save(request);
    }

    // Nhập giá bán storefront sau khi đã thanh toán cho user rồi mới chuyển request sang STOCKED.
    public BuybackRequest stockRequest(Long requestId, User reviewer, BigDecimal sellingPrice) {
        requireStaffOrAdmin(reviewer);
        validateSellingPrice(sellingPrice);

        BuybackRequest request = getRequestForUpdate(requestId);
        if (request.getStatus() != BuybackRequestStatus.PAID) {
            throw new IllegalStateException("Only PAID requests can be stocked");
        }

        BuybackRequestItem item = requireSingleItem(request);
        validateSellingPriceAboveBuyPrice(sellingPrice, item.getFinalBuyPrice());
        applyTransition(request, reviewer, BuybackRequestStatus.STOCKED,
                "Listed on storefront at " + sellingPrice);
        createInventoryItem(request, sellingPrice);
        return buybackRequestRepository.save(request);
    }

    // Chốt condition và giá mua thực tế ở bước TESTING -> PRICED, đồng thời lưu ghi
    // chú kiểm định.
    public BuybackRequest reviewAndPrice(Long requestId, User reviewer,
            String finalConditionRank, BigDecimal finalBuyPrice, String inspectionNotes) {
        requireStaffOrAdmin(reviewer);
        String normalizedRank = normalizeConditionRank(finalConditionRank);
        validateFinalPrice(finalBuyPrice);
        String normalizedNotes = requireInspectionNotes(inspectionNotes);

        BuybackRequest request = getRequestForUpdate(requestId);
        if (request.getStatus() != BuybackRequestStatus.TESTING) {
            throw new IllegalStateException("Only TESTING requests can be priced");
        }

        BuybackRequestItem item = requireSingleItem(request);
        item.setFinalConditionRank(normalizedRank);
        item.setFinalBuyPrice(finalBuyPrice);
        request.setInspectionNotes(normalizedNotes);
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

    // Kiểm tra giá bán storefront có tồn tại và không âm trước khi tiếp tục xử lý.
    private void validateSellingPrice(BigDecimal sellingPrice) {
        if (sellingPrice == null || sellingPrice.signum() <= 0) {
            throw new IllegalArgumentException("Selling price must be greater than zero");
        }
    }

    // Bắt buộc giá bán cao hơn số tiền đã chốt mua lại để không đưa hàng lên web dưới giá vốn.
    private void validateSellingPriceAboveBuyPrice(BigDecimal sellingPrice, BigDecimal finalBuyPrice) {
        if (finalBuyPrice == null || sellingPrice.compareTo(finalBuyPrice) <= 0) {
            throw new IllegalArgumentException("Selling price must be higher than the final Buyback price");
        }
    }

    // Bắt buộc staff ghi kết quả kiểm định để user hiểu cơ sở của final price.
    private String requireInspectionNotes(String inspectionNotes) {
        String normalized = normalizeOptional(inspectionNotes);
        if (normalized == null) {
            throw new IllegalArgumentException("Inspection notes are required before pricing");
        }
        return normalized;
    }

    // Đảm bảo request hiện tại đúng mô hình một request chứa một sản phẩm.
    private BuybackRequestItem requireSingleItem(BuybackRequest request) {
        if (request.getItems() == null || request.getItems().size() != 1) {
            throw new IllegalStateException("Buyback request must contain exactly one item");
        }
        return request.getItems().get(0);
    }

    // Tạo một inventory item AVAILABLE khi request đã PAID và được chuyển sang STOCKED.
    // Mã deterministic giúp retry an toàn mà không tạo duplicate item cho cùng request.
    private void createInventoryItem(BuybackRequest request, BigDecimal sellingPrice) {
        BuybackRequestItem requestItem = requireSingleItem(request);
        if (requestItem.getProduct() == null
                || requestItem.getFinalConditionRank() == null
                || requestItem.getFinalBuyPrice() == null) {
            throw new IllegalStateException("A priced product is required before stocking");
        }

        String instoreCode = "BB-" + request.getId() + "-" + requestItem.getId();
        if (inventoryItemRepository.findByInstoreCode(instoreCode).isPresent()) {
            return;
        }

        InventoryItem inventoryItem = new InventoryItem();
        inventoryItem.setProduct(requestItem.getProduct());
        inventoryItem.setInstoreCode(instoreCode);
        inventoryItem.setPrice(sellingPrice);
        inventoryItem.setConditionRank(requestItem.getFinalConditionRank());
        inventoryItem.setStatus("AVAILABLE");
        inventoryItem.setItemType("USED");
        inventoryItemRepository.save(inventoryItem);
    }

    // Bulk-load item/product của trang hiện tại rồi giữ nguyên thứ tự và metadata phân trang ban đầu.
    private Page<BuybackRequest> loadDashboardDetails(Page<BuybackRequest> requestPage) {
        if (requestPage.isEmpty()) {
            return requestPage;
        }

        List<Long> requestIds = requestPage.getContent().stream()
                .map(BuybackRequest::getId)
                .toList();
        Map<Long, BuybackRequest> detailsById = new HashMap<>();
        for (BuybackRequest request : buybackRequestRepository.findAllByIdWithAdminListDetails(requestIds)) {
            detailsById.put(request.getId(), request);
        }

        List<BuybackRequest> orderedRequests = requestIds.stream()
                .map(detailsById::get)
                .filter(java.util.Objects::nonNull)
                .toList();
        return new PageImpl<>(orderedRequests, requestPage.getPageable(), requestPage.getTotalElements());
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
        // PRICED chỉ được tạo qua reviewAndPrice để không bỏ qua validation final review.
        transitions.put(BuybackRequestStatus.TESTING,
                EnumSet.of(BuybackRequestStatus.REJECTED));
        // PRICED là điểm dừng chờ user quyết định; admin không được bấm qua trạng thái user.
        transitions.put(BuybackRequestStatus.PRICED, EnumSet.noneOf(BuybackRequestStatus.class));
        transitions.put(BuybackRequestStatus.USER_ACCEPTED,
                EnumSet.of(BuybackRequestStatus.PAID));
        // STOCKED chỉ được tạo qua stockRequest sau khi admin nhập selling price.
        transitions.put(BuybackRequestStatus.PAID, EnumSet.noneOf(BuybackRequestStatus.class));
        return transitions;
    }
}
