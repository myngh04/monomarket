package com.monomarket.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.BuybackRequestStatusHistory;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;

@DataJpaTest
class BuybackRequestRepositoryTest {

    @Autowired
    private BuybackRequestRepository buybackRequestRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    private User owner;
    private User reviewer;
    private Product product;

    @BeforeEach
    void setUp() {
        owner = saveUser("owner@example.com", "Owner");
        reviewer = saveUser("staff@example.com", "Staff Reviewer");

        product = new Product();
        product.setIsbnOrJan("9780000000001");
        product.setTitleJa("テスト商品");
        product.setTitleEn("Test Product");
        product = productRepository.save(product);
    }

    @Test
    @DisplayName("Lọc request theo status và phân trang theo thời gian tạo")
    void shouldFilterRequestsByStatusAndPaginate() {
        BuybackRequest oldest = saveRequest(BuybackRequestStatus.PENDING, "oldest@example.com");
        saveRequest(BuybackRequestStatus.PENDING, "newer@example.com");
        saveRequest(BuybackRequestStatus.TESTING, "testing@example.com");

        Page<BuybackRequest> result = buybackRequestRepository
                .findByStatusForAdminQueue(BuybackRequestStatus.PENDING, PageRequest.of(0, 1));

        assertThat(result.getTotalElements()).isEqualTo(2);
        assertThat(result.getContent()).hasSize(1);
        assertThat(result.getContent().get(0).getId()).isNotEqualTo(oldest.getId());
        assertThat(result.getContent().get(0).getStatus()).isEqualTo(BuybackRequestStatus.PENDING);
    }

    @Test
    @DisplayName("Queue admin ưu tiên status trước rồi request mới hơn")
    void shouldPrioritizeEarlierWorkflowStatuses() {
        BuybackRequest stocked = saveRequest(BuybackRequestStatus.STOCKED, "stocked@example.com");
        BuybackRequest pending = saveRequest(BuybackRequestStatus.PENDING, "pending@example.com");

        Page<BuybackRequest> result = buybackRequestRepository
                .findAllForAdminQueue(PageRequest.of(0, 10));

        assertThat(result.getContent().get(0).getId()).isEqualTo(pending.getId());
        assertThat(result.getContent()).extracting(BuybackRequest::getId)
                .contains(stocked.getId());
    }

    @Test
    @DisplayName("Đếm đúng số request theo status để làm KPI dashboard")
    void shouldCountRequestsByStatus() {
        saveRequest(BuybackRequestStatus.PENDING, "pending-1@example.com");
        saveRequest(BuybackRequestStatus.PENDING, "pending-2@example.com");
        saveRequest(BuybackRequestStatus.PRICED, "priced@example.com");

        assertThat(buybackRequestRepository.countByStatus(BuybackRequestStatus.PENDING)).isEqualTo(2);
        assertThat(buybackRequestRepository.countByStatus(BuybackRequestStatus.PRICED)).isEqualTo(1);
        assertThat(buybackRequestRepository.countByStatus(BuybackRequestStatus.STOCKED)).isZero();
    }

    @Test
    @DisplayName("Bulk-load item và product cho danh sách dashboard đã phân trang")
    void shouldFetchDashboardListDetailsByIds() {
        BuybackRequest request = saveRequest(BuybackRequestStatus.PENDING, "dashboard-list@example.com");

        List<BuybackRequest> result = buybackRequestRepository
                .findAllByIdWithAdminListDetails(List.of(request.getId()));

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getItems()).hasSize(1);
        assertThat(result.get(0).getItems().get(0).getProduct().getTitleEn()).isEqualTo("Test Product");
    }

    @Test
    @DisplayName("Admin detail fetch đủ user, reviewer và product trong một request")
    void shouldFetchAdminDetails() {
        BuybackRequest request = saveRequest(BuybackRequestStatus.TESTING, "admin-detail@example.com");
        request.setReviewedBy(reviewer);
        request.setInspectionNotes("Kiểm tra ngoại quan");
        request = buybackRequestRepository.saveAndFlush(request);

        BuybackRequest result = buybackRequestRepository.findByIdWithAdminDetails(request.getId()).orElseThrow();

        assertThat(result.getUser().getEmail()).isEqualTo("admin-detail@example.com");
        assertThat(result.getReviewedBy().getEmail()).isEqualTo("staff@example.com");
        assertThat(result.getInspectionNotes()).isEqualTo("Kiểm tra ngoại quan");
        assertThat(result.getItems()).hasSize(1);
        assertThat(result.getItems().get(0).getProduct().getTitleEn()).isEqualTo("Test Product");
    }

    @Test
    @DisplayName("Lấy được audit history theo thứ tự thời gian")
    void shouldFetchStatusHistoryInChronologicalOrder() {
        BuybackRequest request = saveRequest(BuybackRequestStatus.RECEIVED, "history@example.com");
        BuybackRequestStatusHistory first = history(BuybackRequestStatus.PENDING, BuybackRequestStatus.RECEIVED,
                "Đã nhận hàng");
        BuybackRequestStatusHistory second = history(BuybackRequestStatus.RECEIVED, BuybackRequestStatus.TESTING,
                "Bắt đầu kiểm định");
        first.setCreatedAt(LocalDateTime.of(2026, 8, 7, 9, 0));
        second.setCreatedAt(LocalDateTime.of(2026, 8, 7, 10, 0));
        request.addStatusHistory(first);
        request.addStatusHistory(second);
        buybackRequestRepository.saveAndFlush(request);

        List<BuybackRequestStatusHistory> result = buybackRequestRepository
                .findStatusHistoryByRequestId(request.getId());

        assertThat(result).hasSize(2);
        assertThat(result.get(0).getToStatus()).isEqualTo(BuybackRequestStatus.RECEIVED);
        assertThat(result.get(1).getToStatus()).isEqualTo(BuybackRequestStatus.TESTING);
        assertThat(result.get(0).getChangedBy()).isNull();
    }

    private User saveUser(String email, String fullName) {
        User user = new User();
        user.setEmail(email);
        user.setPassword("password");
        user.setFullName(fullName);
        return userRepository.save(user);
    }

    private BuybackRequest saveRequest(BuybackRequestStatus status, String email) {
        User requestOwner = email.equals(owner.getEmail()) ? owner : saveUser(email, email);

        BuybackRequest request = new BuybackRequest();
        request.setUser(requestOwner);
        request.setStatus(status);
        request.setTotalEstimatedPrice(new BigDecimal("500.00"));

        BuybackRequestItem item = new BuybackRequestItem();
        item.setProduct(product);
        item.setSubmittedIsbnOrJan(product.getIsbnOrJan());
        item.setUserConditionRank("A");
        request.addItem(item);

        return buybackRequestRepository.saveAndFlush(request);
    }

    private BuybackRequestStatusHistory history(
            BuybackRequestStatus fromStatus,
            BuybackRequestStatus toStatus,
            String note) {
        BuybackRequestStatusHistory history = new BuybackRequestStatusHistory();
        history.setFromStatus(fromStatus);
        history.setToStatus(toStatus);
        history.setNote(note);
        return history;
    }
}
