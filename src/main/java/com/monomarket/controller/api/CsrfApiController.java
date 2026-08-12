package com.monomarket.controller.api;

import org.springframework.http.MediaType;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/v1/csrf", produces = MediaType.APPLICATION_JSON_VALUE)
public class CsrfApiController {

    // Cấp CSRF token cho REST client dùng session; client phải gửi lại token trong header của các request thay đổi dữ liệu.
    @GetMapping
    public CsrfToken getCsrfToken(CsrfToken csrfToken) {
        return csrfToken;
    }
}
