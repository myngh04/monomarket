package com.monomarket.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BuybackProductLookupDto {
  private Long productId;
  private String isbnOrJan;
  private String title;
  private BigDecimal estimatedBuybackPrice;
}
