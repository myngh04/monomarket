package com.monomarket.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    // Lấy order phân trang kèm user để trang admin hiển thị người mua khi OSIV đã
    // tắt.
    @Query(value = "SELECT o FROM Order o LEFT JOIN FETCH o.user", countQuery = "SELECT COUNT(o) FROM Order o")
    Page<Order> findAllWithUser(Pageable pageable);

    // Lấy lịch sử đơn hàng: dùng JOIN FETCH để load Order → OrderItem →
    // InventoryItem → Product
    // trong 1 câu SQL duy nhất. Tránh N+1 query khi user có nhiều đơn hàng.
    @Query("SELECT DISTINCT o FROM Order o " +
            "LEFT JOIN FETCH o.items i " +
            "LEFT JOIN FETCH i.inventoryItem inv " +
            "LEFT JOIN FETCH inv.product " +
            "WHERE o.user.id = :userId ORDER BY o.createdAt DESC")
    List<Order> findByUserIdWithDetails(@Param("userId") Long userId);

    // Lấy chi tiết 1 đơn hàng: JOIN FETCH để tránh LazyInitializationException
    // khi truy cập inv.product ở ngoài transaction (ví dụ trong Thymeleaf template)
    @Query("SELECT o FROM Order o " +
            "LEFT JOIN FETCH o.items i " +
            "LEFT JOIN FETCH i.inventoryItem inv " +
            "LEFT JOIN FETCH inv.product " +
            "WHERE o.id = :orderId")
    Optional<Order> findByIdWithDetails(@Param("orderId") Long orderId);
}
