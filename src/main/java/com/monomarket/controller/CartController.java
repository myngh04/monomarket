package com.monomarket.controller;

import java.util.UUID;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.monomarket.entity.User;
import com.monomarket.service.CartService;
import com.monomarket.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {
  // Dùng để lưu trữ session token của guest user
  public static final String GUEST_COOKIE_NAME = "MONO_GUEST_TOKEN";

  private final CartService cartService;
  private final UserService userService;

  // 1. Helper method: Lấy hoặc tạo mới guest token
  private String getOrCreateGuestToken(HttpServletRequest request, HttpServletResponse response) {
    if (request.getCookies() != null) {
      for (Cookie cookie : request.getCookies()) {
        if (GUEST_COOKIE_NAME.equals(cookie.getName())) {
          return cookie.getValue();
        }
      }
    }

    // Nếu không tìm thấy cookie, tạo mới guest token
    String newToken = UUID.randomUUID().toString();
    Cookie cookie = new Cookie(GUEST_COOKIE_NAME, newToken);
    // Đảm bảo cookie có thể truy cập từ mọi endpoint
    cookie.setPath("/");
    cookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
    cookie.setHttpOnly(true); // Bảo mật cookie
    cookie.setSecure(request.isSecure()); // Chỉ gửi cookie qua HTTPS nếu request là HTTPS

    // Thêm cookie vừa tạo vào response
    response.addCookie(cookie);
    return newToken;
  }

  // 2. Helper method: Lấy user đã đăng nhập qua userService
  private User getCurrentUser(Authentication authentication) {
    // Nếu user đã đăng nhập hợp lệ, lấy thông tin user từ authentication
    if (authentication != null && authentication.isAuthenticated()
        && !"anonymousUser".equals(authentication.getPrincipal())) {
      String email = authentication.getName();
      // Gọi userService để tìm user theo email
      return userService.findByEmail(email).orElse(null);
    }
    return null;
  }

  // 3. GET /cart: Hiển thị trang giỏ hàng
  @GetMapping
  public String showCartPage(Authentication authentication, HttpServletRequest request, HttpServletResponse response,
      Model model) {
    // Lấy thông tin user hiện tại (nếu đã đăng nhập)
    User currentUser = getCurrentUser(authentication);

    // Nếu là guest user, lấy hoặc tạo guest token
    String guestToken = getOrCreateGuestToken(request, response);

    // Gọi cartService để lấy danh sách sản phẩm trong giỏ hàng dựa trên user hoặc
    // guest token
    var cartItems = cartService.getCartDtoList(currentUser, guestToken);
    // Thêm danh sách sản phẩm vào model để hiển thị trên view
    model.addAttribute("cartItems", cartItems);

    // Trả về view cart.html ra giao diện
    return "cart";
  }

  // 4. POST /cart/add: Thêm sản phẩm vào giỏ hàng
  @PostMapping("/add")
  public String addToCart(@RequestParam("inventoryItemId") Long inventoryItemId, Authentication authentication,
      HttpServletRequest request, HttpServletResponse response, Model model) {
    // Lấy thông tin user hiện tại (nếu đã đăng nhập)
    User currentUser = getCurrentUser(authentication);

    // Nếu là guest user, lấy hoặc tạo guest token
    String guestToken = getOrCreateGuestToken(request, response);

    // Gọi cartService để thêm sản phẩm vào giỏ hàng dựa trên user hoặc guest token
    cartService.addToCart(inventoryItemId, currentUser, guestToken);

    // Load lại trang giỏ hàng sau khi thêm sản phẩm
    return "redirect:/cart";
  }

  // 5. POST /cart/remove: Xóa sản phẩm khỏi giỏ hàng
  @PostMapping("/remove")
  public String removeFromCart(@RequestParam("inventoryItemId") Long inventoryItemId, Authentication authentication,
      HttpServletRequest request, HttpServletResponse response) {
    // Lấy thông tin user hiện tại (nếu đã đăng nhập)
    User currentUser = getCurrentUser(authentication);

    // Nếu là guest user, lấy hoặc tạo guest token
    String guestToken = getOrCreateGuestToken(request, response);

    // Gọi cartService để xóa sản phẩm khỏi giỏ hàng dựa trên user hoặc guest token
    cartService.removeFromCart(inventoryItemId, currentUser, guestToken);

    // Load lại trang giỏ hàng sau khi xóa sản phẩm
    return "redirect:/cart";
  }

  // 6. POST /cart/clear: Clear giỏ hàng rỗng
  @PostMapping("/clear")
  public String clearCart(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
    // Lấy thông tin user hiện tại (nếu đã đăng nhập)
    User currentUser = getCurrentUser(authentication);

    // Nếu là guest user, lấy hoặc tạo guest token
    String guestToken = getOrCreateGuestToken(request, response);

    // Gọi cartService để clear giỏ hàng dựa trên user hoặc guest token
    cartService.clearCart(currentUser, guestToken);

    // Load lại trang giỏ hàng sau khi clear
    return "redirect:/cart";
  }

  // 7. POST /cart/update: Cập nhật số lượng sản phẩm
  @PostMapping("/update")
  public String updateQuantity(@RequestParam("inventoryItemId") Long inventoryItemId,
      @RequestParam("quantity") int quantity, Authentication authentication,
      HttpServletRequest request, HttpServletResponse response) {

        // Lấy thông tin user hiện tại (nếu đã đăng nhập)
    User currentUser = getCurrentUser(authentication);
    // Nếu là guest user, lấy hoặc tạo guest token
    String guestToken = getOrCreateGuestToken(request, response);

    // Gọi cartService để cập nhật số lượng sản phẩm trong giỏ hàng
    cartService.updateQuantity(inventoryItemId, quantity, currentUser, guestToken);

    // Load lại trang giỏ hàng sau khi cập nhật số lượng
    return "redirect:/cart";
  }
}
