package com.monomarket.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.BuybackRequest;

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

    // Lấy request theo status cho admin dashboard, ưu tiên request tạo trước để xử
    // lý theo hàng đợi.
    List<BuybackRequest> findByStatusOrderByCreatedAtAsc(String status);
}
