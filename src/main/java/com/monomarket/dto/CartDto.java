package com.monomarket.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartDto {
  // Danh sách các món hàng trong giỏ hàng
  private List<CartItemDto> items = new ArrayList<>();
  
  // Tính tổng tiền của trong giỏ hàng
  public BigDecimal getTotalPrice() {
    return items.stream()
        .map(CartItemDto::getSubtotal)
        .reduce(BigDecimal.ZERO, BigDecimal::add);
  }
}
