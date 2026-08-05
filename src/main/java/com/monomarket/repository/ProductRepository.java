package com.monomarket.repository;

import com.monomarket.entity.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Ưu tiên product có ít nhất một inventory AVAILABLE trong catalog.
    @Query(value = """
            SELECT p.*
            FROM products p
            ORDER BY CASE WHEN EXISTS (
                SELECT 1 FROM inventory_items i
                WHERE i.product_id = p.id AND i.status = 'AVAILABLE'
            ) THEN 0 ELSE 1 END, p.id DESC
            """, countQuery = "SELECT count(*) FROM products", nativeQuery = true)
    Page<Product> findAllOrderByAvailability(Pageable pageable);

    // Tìm kiếm thông tin gốc dựa vào mã vạch quốc tế (ISBN/JAN)
    @Query("SELECT p FROM Product p WHERE p.isbnOrJan = :isbnOrJan")
    Optional<Product> findByIsbnOrJan(String isbnOrJan);

    // Ưu tiên product còn hàng trong phạm vi danh mục.
    @Query(value = """
            SELECT p.*
            FROM products p
            WHERE p.category_id = :categoryId
            ORDER BY CASE WHEN EXISTS (
                SELECT 1 FROM inventory_items i
                WHERE i.product_id = p.id AND i.status = 'AVAILABLE'
            ) THEN 0 ELSE 1 END, p.id DESC
            """, countQuery = "SELECT count(*) FROM products WHERE category_id = :categoryId", nativeQuery = true)
    Page<Product> findByCategoryIdOrderByAvailability(@Param("categoryId") Integer categoryId, Pageable pageable);

    // Tìm kiếm xuyên thấu vào trong trường JSONB attributes của Postgres
    @Query(value = """
            SELECT p.*
            FROM products p
            WHERE p.attributes ->> :key = :value
            ORDER BY CASE WHEN EXISTS (
                SELECT 1 FROM inventory_items i
                WHERE i.product_id = p.id AND i.status = 'AVAILABLE'
            ) THEN 0 ELSE 1 END, p.id DESC
            """, countQuery = "SELECT count(*) FROM products WHERE attributes ->> :key = :value", nativeQuery = true)
    Page<Product> findByAttributeOrderByAvailability(@Param("key") String key, @Param("value") String value,
            Pageable pageable);

    // Lấy category và inventory của các product đang hiển thị trên trang hiện tại.
    // Gom vào một query để tránh chạy thêm query riêng cho từng product (Tránh N+1 problem).
    @Query("SELECT DISTINCT p FROM Product p "
            + "LEFT JOIN FETCH p.category c "
            + "LEFT JOIN FETCH c.parent "
            + "LEFT JOIN FETCH p.inventoryItems "
            + "WHERE p.id IN :ids")
    List<Product> findAllByIdWithViewDetails(@Param("ids") List<Long> ids);

    // Load product detail kèm category, parent category và inventory để view hoạt
    // động khi Open Session in View đã tắt.
    @Query("SELECT DISTINCT p FROM Product p "
            + "LEFT JOIN FETCH p.category c "
            + "LEFT JOIN FETCH c.parent "
            + "LEFT JOIN FETCH p.inventoryItems "
            + "WHERE p.id = :id")
    Optional<Product> findByIdWithViewDetails(@Param("id") Long id);
}
