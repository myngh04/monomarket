package com.monomarket.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.User;
import com.monomarket.repository.BuybackRequestRepository;

@ExtendWith(MockitoExtension.class)
class AdminBuybackServiceTest {

        @Mock
        private BuybackRequestRepository buybackRequestRepository;

        @InjectMocks
        private AdminBuybackService adminBuybackService;

        private User staff;
        private User regularUser;

        @BeforeEach
        void setUp() {
                staff = user(10L, "STAFF");
                regularUser = user(20L, "USER");
        }

        @Test
        @DisplayName("Lấy danh sách admin theo status và phân trang")
        void shouldGetRequestsByStatus() {
                PageRequest pageable = PageRequest.of(0, 10);
                BuybackRequest request = request(BuybackRequestStatus.PENDING);
                when(buybackRequestRepository.findByStatusOrderByCreatedAtAsc(
                                BuybackRequestStatus.PENDING, pageable))
                                .thenReturn(new PageImpl<>(List.of(request), pageable, 1));

                assertThat(adminBuybackService.getRequests(BuybackRequestStatus.PENDING, pageable)
                                .getContent()).containsExactly(request);
                verify(buybackRequestRepository).findByStatusOrderByCreatedAtAsc(
                                BuybackRequestStatus.PENDING, pageable);
        }

        @Test
        @DisplayName("Không truyền status thì lấy toàn bộ request")
        void shouldGetAllRequestsWhenStatusIsMissing() {
                PageRequest pageable = PageRequest.of(0, 10);
                when(buybackRequestRepository.findAllByOrderByCreatedAtAsc(pageable))
                                .thenReturn(new PageImpl<>(List.of(), pageable, 0));

                assertThat(adminBuybackService.getRequests(null, pageable).getTotalElements()).isZero();
                verify(buybackRequestRepository).findAllByOrderByCreatedAtAsc(pageable);
        }

        @Test
        @DisplayName("Staff chuyển request từ PENDING sang RECEIVED và tạo audit history")
        void shouldTransitionRequestAndRecordHistory() {
                BuybackRequest request = request(BuybackRequestStatus.PENDING);
                when(buybackRequestRepository.findByIdWithAdminDetails(1L)).thenReturn(Optional.of(request));
                when(buybackRequestRepository.save(any(BuybackRequest.class)))
                                .thenAnswer(invocation -> invocation.getArgument(0));

                BuybackRequest result = adminBuybackService.transitionStatus(
                                1L, staff, BuybackRequestStatus.RECEIVED, "Received at store");

                assertThat(result.getStatus()).isEqualTo(BuybackRequestStatus.RECEIVED);
                assertThat(result.getReviewedBy()).isSameAs(staff);
                assertThat(result.getReviewedAt()).isNotNull();
                assertThat(result.getStatusHistory()).hasSize(1);
                assertThat(result.getStatusHistory().get(0).getFromStatus())
                                .isEqualTo(BuybackRequestStatus.PENDING);
                assertThat(result.getStatusHistory().get(0).getToStatus())
                                .isEqualTo(BuybackRequestStatus.RECEIVED);
                assertThat(result.getStatusHistory().get(0).getNote()).isEqualTo("Received at store");
        }

        @Test
        @DisplayName("User không được gọi service admin")
        void shouldRejectRegularUser() {
                assertThatThrownBy(() -> adminBuybackService.transitionStatus(
                                1L, regularUser, BuybackRequestStatus.RECEIVED, null))
                                .isInstanceOf(IllegalArgumentException.class)
                                .hasMessage("Staff or admin permission is required");
        }

        @Test
        @DisplayName("Không cho phép nhảy cóc state")
        void shouldRejectInvalidTransition() {
                BuybackRequest request = request(BuybackRequestStatus.PENDING);
                when(buybackRequestRepository.findByIdWithAdminDetails(1L)).thenReturn(Optional.of(request));

                assertThatThrownBy(() -> adminBuybackService.transitionStatus(
                                1L, staff, BuybackRequestStatus.PRICED, null))
                                .isInstanceOf(IllegalStateException.class)
                                .hasMessageContaining("Cannot change Buyback request");
        }

        @Test
        @DisplayName("TESTING được chốt condition và giá để chuyển sang PRICED")
        void shouldReviewAndPriceRequest() {
                BuybackRequest request = request(BuybackRequestStatus.TESTING);
                when(buybackRequestRepository.findByIdWithAdminDetails(1L)).thenReturn(Optional.of(request));
                when(buybackRequestRepository.save(any(BuybackRequest.class)))
                                .thenAnswer(invocation -> invocation.getArgument(0));

                BuybackRequest result = adminBuybackService.reviewAndPrice(
                                1L, staff, " b ", new BigDecimal("850"), "Minor scratches");

                BuybackRequestItem item = result.getItems().get(0);
                assertThat(result.getStatus()).isEqualTo(BuybackRequestStatus.PRICED);
                assertThat(result.getInspectionNotes()).isEqualTo("Minor scratches");
                assertThat(item.getFinalConditionRank()).isEqualTo("B");
                assertThat(item.getFinalBuyPrice()).isEqualByComparingTo("850");
                assertThat(result.getStatusHistory()).hasSize(1);
        }

        @Test
        @DisplayName("Không cho phép chốt giá âm hoặc rank không hợp lệ")
        void shouldRejectInvalidFinalReviewData() {
                assertThatThrownBy(() -> adminBuybackService.reviewAndPrice(
                                1L, staff, "D", BigDecimal.TEN, null))
                                .isInstanceOf(IllegalArgumentException.class)
                                .hasMessageContaining("Final condition rank");

                assertThatThrownBy(() -> adminBuybackService.reviewAndPrice(
                                1L, staff, "A", new BigDecimal("-1"), null))
                                .isInstanceOf(IllegalArgumentException.class)
                                .hasMessageContaining("Final buy price");
        }

        private User user(Long id, String role) {
                User user = new User();
                user.setId(id);
                user.setRole(role);
                return user;
        }

        private BuybackRequest request(BuybackRequestStatus status) {
                BuybackRequest request = new BuybackRequest();
                request.setId(1L);
                request.setStatus(status);

                BuybackRequestItem item = new BuybackRequestItem();
                request.addItem(item);
                return request;
        }
}
