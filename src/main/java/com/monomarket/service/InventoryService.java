package com.monomarket.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.monomarket.entity.InventoryItem;
import com.monomarket.repository.InventoryItemRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InventoryService {
  private final InventoryItemRepository inventoryItemRepository;

  // Lấy toàn bộ hàng hóa thực tế đang có trên kệ cửa hàng
  public List<InventoryItem> getAllInventoryItems() {
    return inventoryItemRepository.findAll();
  }

  // Lọc các món đồ cũ cụ thể theo độ mới (Rank)
  public List<InventoryItem> getItemsByConditionRank(String rank) {
    return inventoryItemRepository.findByConditionRankOrderByCreatedAtDesc(rank);
  }

  // Lọc các món đồ cũ cụ thể theo trạng thái (AVAILABLE để bán, SOLD...)
  public List<InventoryItem> getItemsByStatus(String status) {
    return inventoryItemRepository.findByStatus(status);
  }

  // Lấy toàn bộ đống sách cũ/đĩa game cũ thực tế thuộc về 1 mã sản phẩm gốc
  // (Product)
  // Phục vụ cho trang chi tiết sản phẩm: "Một cuốn sách có nhiều người bán /
  // nhiều giá"
  public List<InventoryItem> getInventoryByProductId(Long productId) {
    return inventoryItemRepository.findByProductId(productId);
  }
}