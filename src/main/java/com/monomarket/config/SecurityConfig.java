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
        // 1. Cấu hình phân quyền truy cập
        .authorizeHttpRequests(auth -> auth
            // Cho phép tất cả mọi người truy cập trang chủ, xem chi tiết sản phẩm, các file
            // static (css, js) và trang login...
            .requestMatchers("/", "/product/**", "/css/**", "/js/**", "/images/**", "/login", "/register",
                "/cart", "/cart/add", "/cart/remove", "/cart/clear")
            .permitAll()
            // Tất cả các request khác (ví dụ thanh toán, thông tin cá nhân) bắt
            // buộc phải đăng nhập
            .anyRequest().authenticated())

        // 2. Cấu hình sử dụng Form Login
        .formLogin(form -> form
            .loginPage("/login") // Khai báo đường dẫn trang login
            .loginProcessingUrl("/login") // Nơi xử lý hành động submit form POST
            .successHandler(guestCartSuccessHandler) // Merge guest cart trước khi chuyển về trang chủ
            .permitAll())

        // 3. Cấu hình Đăng xuất
        .logout(logout -> logout
            .logoutUrl("/logout")
            .logoutSuccessUrl("/login?logout") // Đăng xuất xong chuyển về login kèm thông báo
            .permitAll());

    return http.build();
  }

  // 4. Khai báo Bean mã hóa mật khẩu dùng để so khớp mật khẩu trong database sau
  // này
  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }
}
