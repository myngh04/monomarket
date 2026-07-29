package com.monomarket.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class OrderItemDto {
  private String productTitle;
  private String conditionRank;
  private String instoreCode;
  private BigDecimal price;
}

