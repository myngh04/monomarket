package com.monomarket.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
  // Tìm CartItem theo cartId và inventoryItemId
  Optional<CartItem> findByCartIdAndInventoryItemId(Long cartId, Long inventoryItemId);
  
  // Xóa món hàng khỏi giỏ hàng theo cartId và inventoryItemId
  void deleteByCartIdAndInventoryItemId(Long cartId, Long inventoryItemId);
}
