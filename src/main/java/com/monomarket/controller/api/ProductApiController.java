package com.monomarket.controller.api;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

import com.monomarket.dto.api.ApiPageResponse;
import com.monomarket.dto.api.ProductResponse;
import com.monomarket.entity.Product;
import com.monomarket.service.ProductService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(path = "/api/v1/products", produces = MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
@Tag(name = "Products", description = "Browse the public product catalog and available inventory.")
public class ProductApiController {

    private static final int DEFAULT_PAGE_SIZE = 12;
    private static final int MAX_PAGE_SIZE = 50;

    private final ProductService productService;

    // Trả catalog JSON có pagination và hỗ trợ các filter catalog đang tồn tại của
    // MVC.
    @GetMapping
    @Operation(summary = "List products", description = "Trả catalog có pagination và filter category hoặc platform.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Product page returned"),
            @ApiResponse(responseCode = "400", description = "Pagination parameters are invalid")
    })
    public ApiPageResponse<ProductResponse> getProducts(
            @RequestParam(required = false) Integer category,
            @RequestParam(required = false) String platform,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size) {
        validatePagination(page, size);

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Product> products = getFilteredProducts(category, platform, pageable);

        return ApiPageResponse.from(products.map(ProductResponse::from));
    }

    // Trả chi tiết một product dưới dạng DTO JSON, chỉ expose inventory còn
    // AVAILABLE cho storefront.
    @GetMapping("/{productId}")
    @Operation(summary = "Get product detail", description = "Chỉ trả inventory item đang AVAILABLE.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Product returned"),
            @ApiResponse(responseCode = "404", description = "Product does not exist")
    })
    public ProductResponse getProduct(@PathVariable Long productId) {
        Product product = productService.getProductById(productId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product not found"));

        return ProductResponse.from(product);
    }

    // Chọn một filter catalog theo đúng thứ tự ưu tiên đang dùng ở MVC để hai
    // interface cho kết quả nhất quán.
    private Page<Product> getFilteredProducts(Integer category, String platform, Pageable pageable) {
        if (category != null) {
            return productService.getProductsByCategory(category, pageable);
        }

        if (platform != null && !platform.isBlank()) {
            return productService.getProductsByPlatform(platform, pageable);
        }

        return productService.getAllProducts(pageable);
    }

    // Chặn page âm và size quá lớn trước khi tạo Pageable để bảo vệ query catalog.
    private void validatePagination(int page, int size) {
        if (page < 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "page must be greater than or equal to 0");
        }

        if (size < 1 || size > MAX_PAGE_SIZE) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "size must be between 1 and " + MAX_PAGE_SIZE);
        }
    }
}
