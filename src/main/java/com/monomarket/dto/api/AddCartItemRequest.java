package com.monomarket.dto.api;

import jakarta.validation.constraints.NotNull;

public record AddCartItemRequest(
        @NotNull(message = "inventoryItemId is required") Long inventoryItemId) {
}
