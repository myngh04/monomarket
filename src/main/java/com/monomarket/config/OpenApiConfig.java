package com.monomarket.config;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeIn;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.security.SecurityScheme;

@Configuration
@OpenAPIDefinition(info = @Info(title = "MonoMarket REST API", version = "v1", description = "Public product endpoints and session-based guest cart endpoints."))
@SecurityScheme(name = "csrfToken", type = SecuritySchemeType.APIKEY, in = SecuritySchemeIn.HEADER, paramName = "X-CSRF-TOKEN", description = "Lấy token từ GET /api/v1/csrf rồi dán vào đây trước khi gọi POST hoặc DELETE.")
public class OpenApiConfig {

    // Chỉ đưa REST API v1 vào Swagger UI để tách tài liệu JSON khỏi các route
    // Thymeleaf hiện có.
    @Bean
    public GroupedOpenApi monomarketApi() {
        return GroupedOpenApi.builder()
                .group("monomarket-api")
                .pathsToMatch("/api/v1/**")
                .build();
    }
}
