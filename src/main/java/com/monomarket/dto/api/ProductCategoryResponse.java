package com.monomarket.dto.api;

import com.monomarket.entity.Category;

public record ProductCategoryResponse(
        Integer id,
        String nameEn,
        String nameJa,
        String slug,
        String parentSlug) {

    public static ProductCategoryResponse from(Category category) {
        if (category == null) {
            return null;
        }

        return new ProductCategoryResponse(
                category.getId(),
                category.getNameEn(),
                category.getNameJa(),
                category.getSlug(),
                category.getParent() == null ? null : category.getParent().getSlug());
    }
}
