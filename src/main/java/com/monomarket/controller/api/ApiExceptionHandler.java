package com.monomarket.controller.api;

import java.time.Instant;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ResponseStatusException;

import com.monomarket.dto.api.ApiErrorResponse;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;

@RestControllerAdvice(basePackageClasses = ProductApiController.class)
public class ApiExceptionHandler {

    // Chuyển lỗi HTTP có chủ đích từ API thành JSON để client không nhận trang HTML mặc định.
    @ExceptionHandler(ResponseStatusException.class)
    public ResponseEntity<ApiErrorResponse> handleResponseStatus(
            ResponseStatusException exception,
            HttpServletRequest request) {
        return buildResponse(exception.getStatusCode().value(), exception.getReason(), request);
    }

    // Trả lỗi input của request parameter theo cùng một cấu trúc JSON cho API client.
    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ApiErrorResponse> handleConstraintViolation(
            ConstraintViolationException exception,
            HttpServletRequest request) {
        return buildResponse(HttpStatus.BAD_REQUEST.value(), exception.getMessage(), request);
    }

    // Giữ lỗi không dự kiến trong boundary API, không trả stack trace hoặc chi tiết nội bộ ra client.
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiErrorResponse> handleUnexpectedException(
            Exception exception,
            HttpServletRequest request) {
        return buildResponse(HttpStatus.INTERNAL_SERVER_ERROR.value(), "An unexpected error occurred", request);
    }

    // Tạo response lỗi thống nhất cho mọi endpoint REST trong package API.
    private ResponseEntity<ApiErrorResponse> buildResponse(
            int status,
            String message,
            HttpServletRequest request) {
        HttpStatus httpStatus = HttpStatus.valueOf(status);
        ApiErrorResponse body = new ApiErrorResponse(
                Instant.now(),
                status,
                httpStatus.getReasonPhrase(),
                message,
                request.getRequestURI());

        return ResponseEntity.status(httpStatus).body(body);
    }
}
