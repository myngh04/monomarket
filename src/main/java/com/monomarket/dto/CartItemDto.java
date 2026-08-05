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
public class CartItemDto {
  private Long inventoryItemId; // ID của món hàng cụ thể trong bảng inventory_items
  private Long productId; // ID của loại sản phẩm trong bảng products
  private String titleJa; // Tên sản phẩm bằng tiếng Nhật
  private String isbnOrJan; // ISBN hoặc JAN code của sản phẩm
  private String conditionRank; // Tình trạng sản phẩm (A, B...)
  private BigDecimal price; // Giá của sản phẩm

  public BigDecimal getSubtotal() {
    if (price == null)
      // Nếu inventoryItem hoặc giá là null, trả về giá trị mặc định là 0
      return BigDecimal.ZERO;

    // Mỗi DTO đại diện cho đúng một inventory item vật lý.
    return price;
  }
}
