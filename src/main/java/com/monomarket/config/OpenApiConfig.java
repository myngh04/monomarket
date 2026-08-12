package com.monomarket.config;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@Configuration
@OpenAPIDefinition(info = @Info(title = "MonoMarket REST API", version = "v1", description = "Public product endpoints and session-based guest cart endpoints."))
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
