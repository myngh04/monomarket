package com.monomarket.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.Cart;
import com.monomarket.entity.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
  // Tìm giỏ hàng Cart theo User entity
  Optional<Cart> findByUser(User user);

  // Tìm giỏ hàng theo User ID và lấy thông tin toàn bộ CartItem, InventoryItem,
  // Product liên quan
  @Query("SELECT DISTINCT c FROM Cart c "
      + "LEFT JOIN FETCH c.items ci "
      + "LEFT JOIN FETCH ci.inventoryItem ii "
      + "LEFT JOIN FETCH ii.product p "
      + "WHERE c.user.id = :userId")
  Optional<Cart> findByUserIdWithItems(@Param("userId") Long userId);

  // Tìm giỏ hàng theo session token cho guest chưa đăng nhập
  @Query("SELECT DISTINCT c FROM Cart c "
      + "LEFT JOIN FETCH c.items ci "
      + "LEFT JOIN FETCH ci.inventoryItem ii "
      + "LEFT JOIN FETCH ii.product p "
      + "WHERE c.sessionToken = :sessionToken")
  Optional<Cart> findBySessionTokenWithItems(@Param("sessionToken") String sessionToken);
}
