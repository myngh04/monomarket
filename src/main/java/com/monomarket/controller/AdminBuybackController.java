package com.monomarket.controller;

import java.math.BigDecimal;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.User;
import com.monomarket.service.AdminBuybackService;
import com.monomarket.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/buyback")
public class AdminBuybackController {

    private final AdminBuybackService adminBuybackService;
    private final UserService userService;

    // Hiển thị danh sách Buyback phân trang, có thể lọc theo status và kèm KPI cho dashboard.
    @GetMapping
    public String showDashboard(
            @RequestParam(value = "status", defaultValue = "PENDING") BuybackRequestStatus status,
            @RequestParam(value = "page", defaultValue = "0") int page,
            Model model,
            Authentication authentication) {
        User reviewer = getCurrentUser(authentication);
        if (reviewer == null) {
            return "redirect:/login";
        }
        if (!hasAdminAccess(reviewer)) {
            return "redirect:/";
        }

        PageRequest pageable = PageRequest.of(Math.max(page, 0), 20);
        Page<BuybackRequest> requests = adminBuybackService.getRequests(status, pageable);
        model.addAttribute("requests", requests);
        model.addAttribute("selectedStatus", status);
        model.addAttribute("statuses", BuybackRequestStatus.values());
        model.addAttribute("statusCounts", getStatusCounts());
        Map<Long, BigDecimal> storePrices = adminBuybackService.getStorePrices(requests.getContent());
        storePrices = storePrices == null ? Map.of() : storePrices;
        model.addAttribute("storePrices", storePrices);
        model.addAttribute("storeProfits", getStoreProfits(requests.getContent(), storePrices));
        return "admin/buyback-dashboard";
    }

    // Hiển thị detail request cho staff/admin để xem user, item, estimate và review hiện tại.
    @GetMapping("/{requestId}")
    public String showRequestDetail(
            @PathVariable Long requestId,
            Model model,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        User reviewer = getCurrentUser(authentication);
        if (reviewer == null) {
            return "redirect:/login";
        }
        if (!hasAdminAccess(reviewer)) {
            return "redirect:/";
        }

        try {
            BuybackRequest request = adminBuybackService.getRequestDetails(requestId);
            Map<Long, BigDecimal> storePrices = adminBuybackService.getStorePrices(List.of(request));
            storePrices = storePrices == null ? Map.of() : storePrices;
            model.addAttribute("buybackRequest", request);
            model.addAttribute("statusHistory", adminBuybackService.getStatusHistory(requestId));
            model.addAttribute("nextStatuses", getNextStatuses(request));
            model.addAttribute("statuses", BuybackRequestStatus.values());
            model.addAttribute("storePrice", storePrices.get(requestId));
            model.addAttribute("storeProfit", getStoreProfits(List.of(request), storePrices).get(requestId));
            return "admin/buyback-detail";
        } catch (IllegalArgumentException | IllegalStateException exception) {
            redirectAttributes.addFlashAttribute("errorMessage", exception.getMessage());
            return "redirect:/admin/buyback";
        }
    }

    // Nhận thao tác chuyển status từ dashboard, service sẽ kiểm tra role và state machine.
    @PostMapping("/{requestId}/status")
    public String transitionStatus(
            @PathVariable Long requestId,
            @RequestParam BuybackRequestStatus targetStatus,
            @RequestParam(value = "note", required = false) String note,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        User reviewer = getCurrentUser(authentication);
        if (reviewer == null) {
            return "redirect:/login";
        }
        if (!hasAdminAccess(reviewer)) {
            return "redirect:/";
        }

        try {
            adminBuybackService.transitionStatus(requestId, reviewer, targetStatus, note);
            redirectAttributes.addFlashAttribute("successMessage", "Buyback status updated successfully.");
        } catch (IllegalArgumentException | IllegalStateException exception) {
            redirectAttributes.addFlashAttribute("errorMessage", exception.getMessage());
        }
        return "redirect:/admin/buyback/" + requestId;
    }

    // Nhận condition và final buy price sau kiểm định, service sẽ chuyển TESTING sang PRICED.
    @PostMapping("/{requestId}/price")
    public String reviewAndPrice(
            @PathVariable Long requestId,
            @RequestParam String finalConditionRank,
            @RequestParam BigDecimal finalBuyPrice,
            @RequestParam(value = "inspectionNotes", required = false) String inspectionNotes,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        User reviewer = getCurrentUser(authentication);
        if (reviewer == null) {
            return "redirect:/login";
        }
        if (!hasAdminAccess(reviewer)) {
            return "redirect:/";
        }

        try {
            adminBuybackService.reviewAndPrice(
                    requestId, reviewer, finalConditionRank, finalBuyPrice, inspectionNotes);
            redirectAttributes.addFlashAttribute("successMessage", "Buyback price saved successfully.");
        } catch (IllegalArgumentException | IllegalStateException exception) {
            redirectAttributes.addFlashAttribute("errorMessage", exception.getMessage());
        }
        return "redirect:/admin/buyback/" + requestId;
    }

    // Nhận selling price sau khi đã PAID và chỉ khi hợp lệ mới tạo inventory AVAILABLE trên storefront.
    @PostMapping("/{requestId}/stock")
    public String stockRequest(
            @PathVariable Long requestId,
            @RequestParam BigDecimal sellingPrice,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        User reviewer = getCurrentUser(authentication);
        if (reviewer == null) {
            return "redirect:/login";
        }
        if (!hasAdminAccess(reviewer)) {
            return "redirect:/";
        }

        try {
            adminBuybackService.stockRequest(requestId, reviewer, sellingPrice);
            redirectAttributes.addFlashAttribute("successMessage", "Item listed on the storefront successfully.");
        } catch (IllegalArgumentException | IllegalStateException exception) {
            redirectAttributes.addFlashAttribute("errorMessage", exception.getMessage());
        }
        return "redirect:/admin/buyback/" + requestId;
    }

    // Lấy User entity từ Authentication để service kiểm tra role và ghi reviewer vào audit history.
    private User getCurrentUser(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()
                && !"anonymousUser".equals(authentication.getPrincipal())) {
            return userService.findByEmail(authentication.getName()).orElse(null);
        }
        return null;
    }

    // Chặn user thường ở controller trước khi gọi service hoặc truy xuất dữ liệu dashboard.
    private boolean hasAdminAccess(User user) {
        return "STAFF".equalsIgnoreCase(user.getRole()) || "ADMIN".equalsIgnoreCase(user.getRole());
    }

    // Đếm từng status để dashboard hiển thị số request đang chờ xử lý ở mỗi hàng đợi.
    private Map<BuybackRequestStatus, Long> getStatusCounts() {
        Map<BuybackRequestStatus, Long> counts = new EnumMap<>(BuybackRequestStatus.class);
        for (BuybackRequestStatus status : BuybackRequestStatus.values()) {
            counts.put(status, adminBuybackService.countByStatus(status));
        }
        return counts;
    }

    // Chuyển danh sách transition hợp lệ thành model attribute cho form status của detail view.
    private List<BuybackRequestStatus> getNextStatuses(BuybackRequest request) {
        return adminBuybackService.getAllowedNextStatuses(request.getStatus());
    }

    // Tính phần chênh lệch giữa giá bán storefront và giá cuối đã mua lại cho bảng STOCKED.
    private Map<Long, BigDecimal> getStoreProfits(List<BuybackRequest> requests,
            Map<Long, BigDecimal> storePrices) {
        Map<Long, BigDecimal> profits = new HashMap<>();
        for (BuybackRequest request : requests) {
            if (request.getId() == null || request.getItems() == null || request.getItems().size() != 1) {
                continue;
            }
            BigDecimal storePrice = storePrices.get(request.getId());
            BigDecimal finalBuyPrice = request.getItems().get(0).getFinalBuyPrice();
            if (storePrice != null && finalBuyPrice != null) {
                profits.put(request.getId(), storePrice.subtract(finalBuyPrice));
            }
        }
        return profits;
    }
}
