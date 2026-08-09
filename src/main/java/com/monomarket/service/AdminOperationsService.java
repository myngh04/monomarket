package com.monomarket.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Order;
import com.monomarket.repository.InventoryItemRepository;
import com.monomarket.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AdminOperationsService {

    private final InventoryItemRepository inventoryItemRepository;
    private final OrderRepository orderRepository;

    // Lấy inventory phân trang kèm product cho trang quản trị kho read-only.
    public Page<InventoryItem> getInventory(Pageable pageable) {
        return inventoryItemRepository.findAllWithProduct(pageable);
    }

    // Lấy order phân trang kèm user cho trang quản trị đơn hàng read-only.
    public Page<Order> getOrders(Pageable pageable) {
        return orderRepository.findAllWithUser(pageable);
    }
}
