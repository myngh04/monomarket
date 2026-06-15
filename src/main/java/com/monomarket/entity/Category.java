package com.monomarket.entity;

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

  @Column(nullable = false)
  private String nameEn;

  @Column(nullable = false)
  private String nameJa;

  @Column(nullable = false, unique = true)
  private String slug;

  @Column
  private Integer parentId;
}
