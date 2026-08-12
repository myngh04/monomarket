package com.monomarket.controller.support;

import java.util.UUID;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.monomarket.entity.User;
import com.monomarket.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class CartRequestContextResolver {

    public static final String GUEST_COOKIE_NAME = "MONO_GUEST_TOKEN";
    private static final int GUEST_COOKIE_MAX_AGE_SECONDS = 30 * 24 * 60 * 60;

    private final UserService userService;

    // Gom user đã đăng nhập và guest token thành một context dùng chung cho MVC lẫn REST cart endpoint.
    public CartRequestContext resolve(
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {
        return new CartRequestContext(
                getCurrentUser(authentication),
                getOrCreateGuestToken(request, response));
    }

    // Lấy guest token hiện có hoặc phát hành cookie HttpOnly mới để guest cart tồn tại qua nhiều request.
    private String getOrCreateGuestToken(HttpServletRequest request, HttpServletResponse response) {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (GUEST_COOKIE_NAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }

        String guestToken = UUID.randomUUID().toString();
        Cookie cookie = new Cookie(GUEST_COOKIE_NAME, guestToken);
        cookie.setPath("/");
        cookie.setMaxAge(GUEST_COOKIE_MAX_AGE_SECONDS);
        cookie.setHttpOnly(true);
        cookie.setSecure(request.isSecure());
        response.addCookie(cookie);
        return guestToken;
    }

    // Chỉ resolve User khi authentication đại diện cho account thật, không dùng anonymous principal làm owner cart.
    private User getCurrentUser(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getPrincipal())) {
            return null;
        }

        return userService.findByEmail(authentication.getName()).orElse(null);
    }
}
