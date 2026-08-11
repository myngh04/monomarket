package com.monomarket.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http,
      GuestCartAuthenticationSuccessHandler guestCartSuccessHandler) throws Exception {
    http
        // Cấu hình quyền truy cập cho storefront, authentication và khu vực admin.
        .authorizeHttpRequests(auth -> auth
            .requestMatchers("/", "/product/**", "/api/v1/products/**", "/api/v1/cart/**", "/css/**", "/js/**", "/images/**", "/login", "/register",
                "/cart", "/cart/add", "/cart/remove", "/cart/clear")
            .permitAll()
            // Chỉ staff/admin được truy cập khu vực vận hành Buyback.
            .requestMatchers("/admin/**").hasAnyRole("STAFF", "ADMIN")
            .anyRequest().authenticated())

        // Dùng form login và merge guest cart sau khi đăng nhập thành công.
        .formLogin(form -> form
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .successHandler(guestCartSuccessHandler)
            .permitAll())

        // Đăng xuất xong quay về trang login.
        .logout(logout -> logout
            .logoutUrl("/logout")
            .logoutSuccessUrl("/login?logout")
            .permitAll());

    return http.build();
  }

  // Bean mã hóa mật khẩu dùng khi đăng ký và xác thực tài khoản.
  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }
}
