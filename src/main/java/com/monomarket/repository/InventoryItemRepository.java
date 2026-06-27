package com.monomarket.repository;

import com.monomarket.entity.InventoryItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface InventoryItemRepository extends JpaRepository<InventoryItem, Long> {

    // Tìm chính xác món đồ cũ cụ thể bằng mã vạch dán tại cửa hàng
    Optional<InventoryItem> findByInstoreCode(String instoreCode);

    // Lọc đống đồ cũ đang bày trên kệ theo trạng thái (AVAILABLE, PENDING, SOLD)
    List<InventoryItem> findByStatus(String status);

    // Lọc đồ cũ theo độ mới (Rank S, A, B, C) và sắp xếp theo hàng mới về
    List<InventoryItem> findByConditionRankOrderByCreatedAtDesc(String conditionRank);

    // Lấy toàn bộ danh sách hàng tồn kho thực tế của một đầu sách/đầu game gốc (Product)
    List<InventoryItem> findByProductId(Long productId);
}