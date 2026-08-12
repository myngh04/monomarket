package com.monomarket.controller.support;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.core.Authentication;

import com.monomarket.entity.User;
import com.monomarket.service.UserService;

import jakarta.servlet.http.Cookie;

class CartRequestContextResolverTest {

    private final UserService userService = Mockito.mock(UserService.class);
    private final CartRequestContextResolver resolver = new CartRequestContextResolver(userService);

    @Test
    void shouldCreateHttpOnlyGuestCookieWhenRequestHasNoCookie() {
        MockHttpServletRequest request = new MockHttpServletRequest();
        MockHttpServletResponse response = new MockHttpServletResponse();

        CartRequestContext context = resolver.resolve(null, request, response);

        Cookie cookie = response.getCookie(CartRequestContextResolver.GUEST_COOKIE_NAME);
        assertThat(context.user()).isNull();
        assertThat(context.guestToken()).isNotBlank();
        assertThat(cookie).isNotNull();
        assertThat(cookie.getValue()).isEqualTo(context.guestToken());
        assertThat(cookie.isHttpOnly()).isTrue();
        assertThat(cookie.getPath()).isEqualTo("/");
    }

    @Test
    void shouldReuseGuestCookieAndResolveAuthenticatedUser() {
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setCookies(new Cookie(CartRequestContextResolver.GUEST_COOKIE_NAME, "existing-token"));
        MockHttpServletResponse response = new MockHttpServletResponse();
        Authentication authentication = Mockito.mock(Authentication.class);
        User user = new User();
        user.setEmail("user@example.com");

        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("user@example.com");
        when(authentication.getName()).thenReturn("user@example.com");
        when(userService.findByEmail("user@example.com")).thenReturn(Optional.of(user));

        CartRequestContext context = resolver.resolve(authentication, request, response);

        assertThat(context.user()).isSameAs(user);
        assertThat(context.guestToken()).isEqualTo("existing-token");
        assertThat(response.getCookie(CartRequestContextResolver.GUEST_COOKIE_NAME)).isNull();
    }
}
