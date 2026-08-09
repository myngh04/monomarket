package com.monomarket.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.monomarket.dto.BuybackProductLookupDto;
import com.monomarket.dto.BuybackRequestForm;
import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.User;
import com.monomarket.service.UserBuybackService;
import com.monomarket.service.UserService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BuybackController {

  private final UserBuybackService buybackService;
  private final UserService userService;

  // Hiển thị form Buyback cho user đã đăng nhập.
  @GetMapping("/buyback")
  public String showBuybackForm(
      @RequestParam(value = "isbnOrJan", required = false) String isbnOrJan,
      Authentication authentication,
      Model model) {
    if (getCurrentUser(authentication) == null) {
      return "redirect:/login";
    }

    if (!model.containsAttribute("buybackForm")) {
      BuybackRequestForm form = new BuybackRequestForm();
      if (isbnOrJan != null && !isbnOrJan.isBlank()) {
        form.setSubmittedIsbnOrJan(isbnOrJan.trim());
        addLookupProduct(form, model);
      }
      model.addAttribute("buybackForm", form);
    }
        return "ecommerce/buyback-form";
  }

  // Lookup ISBN/JAN bằng AJAX và trả title cùng giá estimate cho UI.
  @ResponseBody
  @GetMapping(value = "/buyback/products/lookup", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<?> lookupProduct(
      @RequestParam("submittedIsbnOrJan") String submittedIsbnOrJan,
      Authentication authentication) {

    if (getCurrentUser(authentication) == null) {
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
          .body(Map.of("error", "Authentication is required"));
    }

    try {
      BuybackProductLookupDto result = buybackService.lookupProduct(submittedIsbnOrJan);
      return ResponseEntity.ok(result);
    } catch (IllegalArgumentException | IllegalStateException exception) {
      return ResponseEntity.badRequest().body(Map.of("error", exception.getMessage()));
    }
  }

  // Validate form, tạo request PENDING và chuyển user sang lịch sử Buyback.
  @PostMapping("/buyback")
  public String createBuybackRequest(
      @Valid @ModelAttribute("buybackForm") BuybackRequestForm form,
      BindingResult bindingResult,
      Authentication authentication,
      Model model,
      RedirectAttributes redirectAttributes) {

    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    if (bindingResult.hasErrors()) {
      addLookupProduct(form, model);
            return "ecommerce/buyback-form";
    }

    try {
      buybackService.createRequest(user, form);
      redirectAttributes.addFlashAttribute("successMessage", "Buyback request submitted successfully.");
      return "redirect:/profile#buyback-requests";
    } catch (IllegalArgumentException | IllegalStateException exception) {
      bindingResult.reject("buyback.error", exception.getMessage());
      addLookupProduct(form, model);
            return "ecommerce/buyback-form";
    }
  }

  // Hiển thị lịch sử các Buyback request thuộc user hiện tại.
  @GetMapping("/buyback/history")
  public String showBuybackHistory(Authentication authentication) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    return "redirect:/profile#buyback-requests";
  }

  // Hiển thị chi tiết một request sau khi service đã kiểm tra ownership.
  @GetMapping("/buyback/{requestId}")
  public String showBuybackDetail(
      @PathVariable Long requestId,
      Authentication authentication,
      Model model) {

    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    try {
      BuybackRequest request = buybackService.getRequestForUser(requestId, user);
      model.addAttribute("buybackRequest", request);
        return "ecommerce/buyback-detail";
    } catch (IllegalArgumentException exception) {
      return "redirect:/profile#buyback-requests";
    }
  }

  // Nhận quyết định chấp nhận final price của đúng user sở hữu request và chuyển sang USER_ACCEPTED.
  @PostMapping("/buyback/{requestId}/accept")
  public String acceptFinalPrice(
      @PathVariable Long requestId,
      Authentication authentication,
      RedirectAttributes redirectAttributes) {
    User user = getCurrentUser(authentication);
    if (user == null) {
      return "redirect:/login";
    }

    try {
      buybackService.acceptFinalPrice(requestId, user);
      redirectAttributes.addFlashAttribute("successMessage", "Final Buyback price accepted.");
    } catch (IllegalArgumentException | IllegalStateException exception) {
      redirectAttributes.addFlashAttribute("errorMessage", exception.getMessage());
    }
    return "redirect:/buyback/" + requestId;
  }

  // Lấy User entity từ Authentication để truyền ownership vào service.
  private User getCurrentUser(Authentication authentication) {
    if (authentication != null && authentication.isAuthenticated()
        && !"anonymousUser".equals(authentication.getPrincipal())) {
      return userService.findByEmail(authentication.getName()).orElse(null);
    }
    return null;
  }

  // Lookup lại product khi form lỗi để UI vẫn hiển thị title và giá estimate đã
  // nhận diện.
  private void addLookupProduct(BuybackRequestForm form, Model model) {
    if (form.getSubmittedIsbnOrJan() == null || form.getSubmittedIsbnOrJan().isBlank()) {
      return;
    }

    try {
      model.addAttribute("lookupProduct", buybackService.lookupProduct(form.getSubmittedIsbnOrJan()));
    } catch (IllegalArgumentException | IllegalStateException ignored) {
      // Lỗi lookup đã được hiển thị qua BindingResult hoặc validation của form.
    }
  }
}
