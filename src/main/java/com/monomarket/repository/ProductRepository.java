package com.monomarket.repository;

import com.monomarket.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Tìm kiếm thông tin gốc dựa vào mã vạch quốc tế (ISBN/JAN)
    @Query("SELECT p FROM Product p WHERE p.isbnOrJan = :isbnOrJan")
    Optional<Product> findByIsbnOrJan(String isbnOrJan);

    // Tìm kiếm các sản phẩm thuộc cùng một danh mục
    List<Product> findByCategoryId(Integer categoryId);

    // Tìm kiếm xuyên thấu vào trong trường JSONB attributes của Postgres
    @Query(value = "SELECT * FROM products WHERE attributes ->> :key = :value", nativeQuery = true)
    List<Product> findByAttribute(@Param("key") String key, @Param("value") String value);
}