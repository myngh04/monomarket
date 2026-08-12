package com.monomarket.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

import com.monomarket.controller.support.CartRequestContext;
import com.monomarket.controller.support.CartRequestContextResolver;
import com.monomarket.dto.CartDto;
import com.monomarket.dto.api.AddCartItemRequest;
import com.monomarket.service.CartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(path = "/api/v1/cart", produces = MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
@Tag(name = "Cart", description = "Manage the current guest or signed-in user's cart.")
public class CartApiController {

    private final CartService cartService;
    private final CartRequestContextResolver cartRequestContextResolver;

    // Trả cart JSON của user hiện tại hoặc guest cookie, đồng thời tạo guest cookie
    // nếu request chưa có.
    @GetMapping
    @Operation(summary = "Get current cart")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Current cart returned")
    })
    public CartDto getCart(
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {
        CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
        return getCartDto(context);
    }

    // Thêm một serialized inventory item vào cart và trả cart mới; thêm lại cùng
    // item vẫn idempotent.
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    @SecurityRequirement(name = "csrfToken")
    @Operation(summary = "Add inventory item to cart", description = "Yêu cầu X-CSRF-TOKEN lấy từ endpoint CSRF.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Cart updated"),
            @ApiResponse(responseCode = "400", description = "Request body is invalid"),
            @ApiResponse(responseCode = "403", description = "CSRF token is missing or invalid"),
            @ApiResponse(responseCode = "409", description = "Inventory item is unavailable")
    })
    public CartDto addCartItem(
            @Valid @RequestBody AddCartItemRequest requestBody,
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {
        CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
        boolean added = cartService.addToCart(requestBody.inventoryItemId(), context.user(), context.guestToken());
        if (!added) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Inventory item is unavailable");
        }

        return getCartDto(context);
    }

    // Xóa một inventory item khỏi cart hiện tại; thao tác idempotent khi item đã
    // không còn trong cart.
    @DeleteMapping("/items/{inventoryItemId}")
    @SecurityRequirement(name = "csrfToken")
    @Operation(summary = "Remove inventory item from cart", description = "Yêu cầu X-CSRF-TOKEN lấy từ endpoint CSRF.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Cart item removed"),
            @ApiResponse(responseCode = "403", description = "CSRF token is missing or invalid")
    })
    public ResponseEntity<Void> removeCartItem(
            @PathVariable Long inventoryItemId,
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {
        CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
        cartService.removeFromCart(inventoryItemId, context.user(), context.guestToken());
        return ResponseEntity.noContent().build();
    }

    // Xóa toàn bộ item khỏi cart hiện tại nhưng vẫn giữ guest token để các request
    // sau dùng cùng cart identity.
    @DeleteMapping
    @SecurityRequirement(name = "csrfToken")
    @Operation(summary = "Clear current cart", description = "Yêu cầu X-CSRF-TOKEN lấy từ endpoint CSRF.")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Cart cleared"),
            @ApiResponse(responseCode = "403", description = "CSRF token is missing or invalid")
    })
    public ResponseEntity<Void> clearCart(
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {
        CartRequestContext context = cartRequestContextResolver.resolve(authentication, request, response);
        cartService.clearCart(context.user(), context.guestToken());
        return ResponseEntity.noContent().build();
    }

    // Chuyển danh sách item từ service thành CartDto để response REST và Thymeleaf
    // dùng chung cấu trúc giá/tổng tiền.
    private CartDto getCartDto(CartRequestContext context) {
        return new CartDto(cartService.getCartDtoList(context.user(), context.guestToken()));
    }
}
