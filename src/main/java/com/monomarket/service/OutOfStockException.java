package com.monomarket.service;

import java.util.List;

// Custom unchecked exception: ném ra khi có sản phẩm trong giỏ không còn AVAILABLE lúc checkout.
// Kế thừa RuntimeException → Spring sẽ tự động rollback @Transactional khi exception này bị throw.
// Lấy theo danh sách tên sản phẩm hết hàng để Controller hiển thị thông báo cụ thể cho user.
public class OutOfStockException extends RuntimeException {

  private final List<String> unavailableItems;

  public OutOfStockException(List<String> unavailableItems) {
    super("These items are no longer available: " + String.join(", ", unavailableItems));
    this.unavailableItems = unavailableItems;
  }

  // Controller dùng method này để lấy danh sách tên sản phẩm đã hết hàng
  public List<String> getUnavailableItems() {
    return unavailableItems;
  }
}