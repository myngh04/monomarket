package com.monomarket.dto.api;

import java.util.List;

import com.monomarket.entity.Product;

public record ProductResponse(
        Long id,
        String isbnOrJan,
        String titleJa,
        String titleEn,
        String displayTitle,
        ProductCategoryResponse category,
        List<ProductInventoryResponse> availableInventoryItems) {

    public static ProductResponse from(Product product) {
        List<ProductInventoryResponse> availableInventoryItems = product.getInventoryItems() == null
                ? List.of()
                : product.getInventoryItems().stream()
                        .filter(inventoryItem -> "AVAILABLE".equals(inventoryItem.getStatus()))
                        .map(ProductInventoryResponse::from)
                        .toList();

        return new ProductResponse(
                product.getId(),
                product.getIsbnOrJan(),
                product.getTitleJa(),
                product.getTitleEn(),
                product.getDisplayTitle(),
                ProductCategoryResponse.from(product.getCategory()),
                availableInventoryItems);
    }
}
