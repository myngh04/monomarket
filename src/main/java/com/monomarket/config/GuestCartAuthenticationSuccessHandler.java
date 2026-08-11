package com.monomarket.config;

import java.io.IOException;
import java.util.Arrays;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.stereotype.Component;

import com.monomarket.controller.support.CartRequestContextResolver;
import com.monomarket.entity.User;
import com.monomarket.service.CartService;
import com.monomarket.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

/** Gộp guest cart vào cart của user ngay sau khi đăng nhập thành công. */
@Component
@RequiredArgsConstructor
public class GuestCartAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

  private final CartService cartService;
  private final UserService userService;
  private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {
    String guestToken = getGuestToken(request);
    User user = userService.findByEmail(authentication.getName()).orElse(null);

    if (user != null && guestToken != null) {
      cartService.mergeGuestCartToUserCart(user, guestToken);
      expireGuestCookie(response);
    }

    redirectStrategy.sendRedirect(request, response, "/");
  }

  private String getGuestToken(HttpServletRequest request) {
    if (request.getCookies() == null) {
      return null;
    }

    return Arrays.stream(request.getCookies())
        .filter(cookie -> CartRequestContextResolver.GUEST_COOKIE_NAME.equals(cookie.getName()))
        .map(Cookie::getValue)
        .findFirst()
        .orElse(null);
  }

  private void expireGuestCookie(HttpServletResponse response) {
    Cookie cookie = new Cookie(CartRequestContextResolver.GUEST_COOKIE_NAME, "");
    cookie.setPath("/");
    cookie.setMaxAge(0);
    cookie.setHttpOnly(true);
    response.addCookie(cookie);
  }
}
