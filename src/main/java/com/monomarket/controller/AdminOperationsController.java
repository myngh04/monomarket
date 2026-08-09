package com.monomarket.controller;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.service.AdminOperationsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminOperationsController {

    private final AdminOperationsService adminOperationsService;

    // Hiển thị inventory read-only theo trang, mới cập nhật gần nhất nằm trước.
    @GetMapping("/inventory")
    public String showInventory(
            @RequestParam(value = "page", defaultValue = "0") int page,
            Model model) {
        PageRequest pageable = PageRequest.of(Math.max(page, 0), 25,
                Sort.by(Sort.Direction.DESC, "updatedAt"));
        model.addAttribute("inventoryPage", adminOperationsService.getInventory(pageable));
        return "admin/inventory";
    }

    // Hiển thị order read-only theo trang, đơn mới nhất nằm trước.
    @GetMapping("/orders")
    public String showOrders(
            @RequestParam(value = "page", defaultValue = "0") int page,
            Model model) {
        PageRequest pageable = PageRequest.of(Math.max(page, 0), 20,
                Sort.by(Sort.Direction.DESC, "createdAt"));
        model.addAttribute("orderPage", adminOperationsService.getOrders(pageable));
        return "admin/orders";
    }
}
