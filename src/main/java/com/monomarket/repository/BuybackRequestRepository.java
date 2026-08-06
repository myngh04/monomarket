package com.monomarket.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.BuybackRequestStatusHistory;

@Repository
public interface BuybackRequestRepository extends JpaRepository<BuybackRequest, Long> {

        // Lấy các request theo userId, fetch item/product và sắp xếp mới nhất trước cho
        // trang history.
        @Query("SELECT DISTINCT r FROM BuybackRequest r "
                        + "LEFT JOIN FETCH r.items i "
                        + "LEFT JOIN FETCH i.product p "
                        + "WHERE r.user.id = :userId "
                        + "ORDER BY r.createdAt DESC")
        List<BuybackRequest> findByUserIdWithItems(@Param("userId") Long userId);

        // Tìm detail theo requestId và userId; trả rỗng nếu request không tồn tại hoặc
        // không thuộc user.
        @Query("SELECT DISTINCT r FROM BuybackRequest r "
                        + "LEFT JOIN FETCH r.items i "
                        + "LEFT JOIN FETCH i.product p "
                        + "WHERE r.id = :requestId AND r.user.id = :userId")
        Optional<BuybackRequest> findByIdAndUserIdWithItems(
                        @Param("requestId") Long requestId,
                        @Param("userId") Long userId);

        // Lấy toàn bộ request phân trang cho admin dashboard, request cũ hơn sẽ được ưu tiên.
        Page<BuybackRequest> findAllByOrderByCreatedAtAsc(Pageable pageable);

        // Lọc request theo status để admin xử lý đúng hàng đợi nghiệp vụ.
        Page<BuybackRequest> findByStatusOrderByCreatedAtAsc(
                        BuybackRequestStatus status,
                        Pageable pageable);

        // Đếm request theo status để hiển thị KPI trên dashboard.
        long countByStatus(BuybackRequestStatus status);

        // Lấy detail admin kèm user, reviewer và product để view không phát sinh lazy
        // query.
        @Query("SELECT DISTINCT r FROM BuybackRequest r "
                        + "LEFT JOIN FETCH r.user u "
                        + "LEFT JOIN FETCH r.reviewedBy reviewer "
                        + "LEFT JOIN FETCH r.items i "
                        + "LEFT JOIN FETCH i.product p "
                        + "WHERE r.id = :requestId")
        Optional<BuybackRequest> findByIdWithAdminDetails(@Param("requestId") Long requestId);

        // Lấy audit history theo request, sắp xếp từ trạng thái đầu tiên đến mới nhất.
        @Query("SELECT h FROM BuybackRequestStatusHistory h "
                        + "LEFT JOIN FETCH h.changedBy "
                        + "WHERE h.buybackRequest.id = :requestId "
                        + "ORDER BY h.createdAt ASC")
        List<BuybackRequestStatusHistory> findStatusHistoryByRequestId(
                        @Param("requestId") Long requestId);
}
