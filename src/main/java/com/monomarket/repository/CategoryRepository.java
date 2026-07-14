package com.monomarket.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.monomarket.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

  Optional<Category> findBySlug(String slug);

  // Load toàn bộ cây danh mục 3 cấp cùng lúc (eager fetch) để tránh LazyInitializationException
  @Query("SELECT DISTINCT c FROM Category c "
       + "LEFT JOIN FETCH c.children sub "
       + "LEFT JOIN FETCH sub.children "
       + "WHERE c.parent IS NULL")
  List<Category> findRootCategoriesWithFullTree();
}
