package com.monomarket.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class OrderDto {
  private Long orderId;
  private LocalDateTime orderDate;
  private String status;
  private BigDecimal totalPrice;
  private String shippingAddress;
  private List<OrderItemDto> orderItems;
}

