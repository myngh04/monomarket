package com.monomarket.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "categories")
@Getter
@Setter
public class Category {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Column(name = "name_en", nullable = false, length = 100)
  private String nameEn;

  @Column(name = "name_ja", nullable = false, length = 100)
  private String nameJa;

  @Column(nullable = false, unique = true, length = 100)
  private String slug;

  // Danh mục cha (Owning side)
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "parent_id")
  private Category parent;

  // Danh sách các danh mục con (Inverse side)
  @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL, orphanRemoval = true)
  private List<Category> children = new ArrayList<>();

  // Helper Method đồng bộ hai chiều cha - con khi seed dữ liệu
  public void addChild(Category child) {
    children.add(child);
    child.setParent(this);
  }

  public void removeChild(Category child) {
    children.remove(child);
    child.setParent(null);
  }
}
