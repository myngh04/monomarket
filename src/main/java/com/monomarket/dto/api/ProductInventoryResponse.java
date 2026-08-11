package com.monomarket.dto.api;

import java.math.BigDecimal;

import com.monomarket.entity.InventoryItem;

public record ProductInventoryResponse(
        Long id,
        String instoreCode,
        BigDecimal price,
        String conditionRank,
        String itemType) {

    public static ProductInventoryResponse from(InventoryItem inventoryItem) {
        return new ProductInventoryResponse(
                inventoryItem.getId(),
                inventoryItem.getInstoreCode(),
                inventoryItem.getPrice(),
                inventoryItem.getConditionRank(),
                inventoryItem.getItemType());
    }
}
