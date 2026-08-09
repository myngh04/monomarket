package com.monomarket.repository;

import com.monomarket.entity.InventoryItem;
import jakarta.persistence.LockModeType;
import jakarta.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface InventoryItemRepository extends JpaRepository<InventoryItem, Long> {

    // Lấy inventory phân trang kèm product để trang admin render mà không phụ thuộc OSIV.
    @Query(value = "SELECT i FROM InventoryItem i LEFT JOIN FETCH i.product",
            countQuery = "SELECT COUNT(i) FROM InventoryItem i")
    Page<InventoryItem> findAllWithProduct(Pageable pageable);

    // Tìm chính xác món đồ cũ cụ thể bằng mã vạch dán tại cửa hàng
    Optional<InventoryItem> findByInstoreCode(String instoreCode);

    // Lấy nhiều mã inventory một lần để dashboard không query riêng từng Buyback request.
    List<InventoryItem> findByInstoreCodeIn(List<String> instoreCodes);

    // Lọc đống đồ cũ đang bày trên kệ theo trạng thái (AVAILABLE, PENDING, SOLD)
    List<InventoryItem> findByStatus(String status);

    // Lọc đồ cũ theo độ mới (Rank S, A, B, C) và sắp xếp theo hàng mới về
    List<InventoryItem> findByConditionRankOrderByCreatedAtDesc(String conditionRank);

    // Lấy toàn bộ danh sách hàng tồn kho thực tế của một đầu sách/đầu game gốc
    // (Product)
    List<InventoryItem> findByProductId(Long productId);

    // Khi checkout: Lock toàn bộ các InventoryItem theo danh sách ID bằng
    // SELECT ... FOR UPDATE. Ngăn chặn race condition khi 2 user cùng mua 1 món
    // hàng
    // secondhand duy nhất. Request đến sau sẽ bị block cho đến khi transaction
    // trước commit.
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    // Cấu hình: Nếu bị Lock, chỉ chờ tối đa 2000ms (2 giây). Quá 2s ném
    // LockTimeoutException ngay chứ không chờ nữa!
    @QueryHints({ @QueryHint(name = "jakarta.persistence.lock.timeout", value = "2000") })
    @Query("SELECT i FROM InventoryItem i WHERE i.id IN :ids")
    List<InventoryItem> findAllByIdForUpdate(@Param("ids") List<Long> ids);
}
