package com.monomarket.controller.api;

import org.springframework.http.MediaType;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping(path = "/api/v1/csrf", produces = MediaType.APPLICATION_JSON_VALUE)
@Tag(name = "Security", description = "Obtain the CSRF token required for cart write operations.")
public class CsrfApiController {

    // Cấp CSRF token cho REST client dùng session; client phải gửi lại token trong
    // header của các request thay đổi dữ liệu.
    @GetMapping
    @Operation(summary = "Get CSRF token", description = "Dán field token vào Swagger Authorize trước khi gọi POST hoặc DELETE.")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "CSRF token returned")
    })
    public CsrfToken getCsrfToken(CsrfToken csrfToken) {
        return csrfToken;
    }
}
