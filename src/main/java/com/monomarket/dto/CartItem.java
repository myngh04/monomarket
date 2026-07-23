package com.monomarket.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
  private Long inventoryItemId; // ID của món hàng cụ thể trong bảng inventory_items
  private Long productId; // ID của loại sản phẩm trong bảng products
  private String titleJa; // Tên sản phẩm bằng tiếng Nhật
  private String isbnOrJan; // ISBN hoặc JAN code của sản phẩm
  private String conditionRank; // Tình trạng sản phẩm (A, B...)
  private BigDecimal price; // Giá của sản phẩm
  private int quantity = 1; // Table inventory_items mặc định 1 món hàng cho 1 row

  public BigDecimal getSubTotal() {
    if (price == null)
      // Nếu inventoryItem hoặc giá là null, trả về giá trị mặc định là 0
      return BigDecimal.ZERO;

    // Tính tổng tiền cho 1 loại sản phẩm trong giỏ hàng
    return price.multiply(BigDecimal.valueOf(quantity));
  }
}
