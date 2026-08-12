package com.monomarket.controller.api;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

import com.monomarket.dto.OrderDto;
import com.monomarket.dto.UserProfileDto;
import com.monomarket.entity.User;
import com.monomarket.service.OrderService;
import com.monomarket.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(path = "/api/v1/account", produces = MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
@Tag(name = "Account", description = "Read the signed-in account profile and order history.")
public class AccountApiController {

    private final UserService userService;
    private final OrderService orderService;

    // Trả thông tin profile của account đã đăng nhập; không expose password, role
    // hoặc entity nội bộ.
    @GetMapping("/profile")
    @Operation(summary = "Get current account profile", description = "Yêu cầu session đã đăng nhập.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Profile returned"),
            @ApiResponse(responseCode = "401", description = "Authentication is required")
    })
    public UserProfileDto getProfile(Authentication authentication) {
        User user = requireCurrentUser(authentication);
        return new UserProfileDto(user.getEmail(), user.getFullName(), user.getPhone());
    }

    // Trả toàn bộ order thuộc account hiện tại; OrderService đã fetch relation cần
    // thiết để response không phụ thuộc OSIV.
    @GetMapping("/orders")
    @Operation(summary = "List current account orders", description = "Yêu cầu session đã đăng nhập.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Orders returned"),
            @ApiResponse(responseCode = "401", description = "Authentication is required")
    })
    public List<OrderDto> getOrders(Authentication authentication) {
        return orderService.getOrdersByUser(requireCurrentUser(authentication));
    }

    // Trả một order của account hiện tại; service kiểm tra ownership trước khi
    // serialize response.
    @GetMapping("/orders/{orderId}")
    @Operation(summary = "Get current account order", description = "Chỉ trả order thuộc account đã đăng nhập.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Order returned"),
            @ApiResponse(responseCode = "401", description = "Authentication is required"),
            @ApiResponse(responseCode = "404", description = "Order does not exist or is not owned by the current account")
    })
    public OrderDto getOrder(
            @PathVariable Long orderId,
            Authentication authentication) {
        try {
            return orderService.getOrderDetail(orderId, requireCurrentUser(authentication));
        } catch (IllegalArgumentException exception) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Order not found");
        }
    }

    // Resolve account thật từ Spring Security để API không nhận identity do client
    // tự gửi lên.
    private User requireCurrentUser(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getPrincipal())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authentication is required");
        }

        return userService.findByEmail(authentication.getName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authentication is required"));
    }
}
