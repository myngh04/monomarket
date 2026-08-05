package com.monomarket.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.dto.CartItemDto;
import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.User;
import com.monomarket.repository.CartRepository;
import com.monomarket.repository.InventoryItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CartService {

  private final CartRepository cartRepository;
  private final InventoryItemRepository inventoryItemRepository;

  // 1. Tìm hoặc tạo mới Cart Entity cho người dùng
  public Cart getOrCreateCart(User user, String guestToken) {
    if (user != null) {
      // Nếu người dùng đã đăng nhập, tìm giỏ hàng theo User ID
      return cartRepository.findByUserIdWithItems(user.getId())
          // Nếu không tìm thấy giỏ hàng, tạo mới một giỏ hàng cho người dùng
          .orElseGet(() -> {
            Cart newCart = new Cart();
            newCart.setUser(user);
            return cartRepository.save(newCart);
          });
      // Nếu người dùng chưa đăng nhập, tìm giỏ hàng theo session token
    } else if (guestToken != null && !guestToken.isEmpty()) {
      return cartRepository.findBySessionTokenWithItems(guestToken)
          // Nếu không tìm thấy giỏ hàng, tạo mới một giỏ hàng cho guest
          .orElseGet(() -> {
            Cart newCart = new Cart();
            newCart.setSessionToken(guestToken);
            return cartRepository.save(newCart);
          });
    }
    // Nếu cả user và guestToken đều null, ném ra lỗi
    throw new IllegalArgumentException("User or guest token must be provided");
  }

  // 2. Thêm một InventoryItem vào giỏ hàng
  public boolean addToCart(Long inventoryItemId, User user, String guestToken) {
    Optional<InventoryItem> inventoryItemOpt = inventoryItemRepository.findById(inventoryItemId);

    if (inventoryItemOpt.isEmpty() || !"AVAILABLE".equals(inventoryItemOpt.get().getStatus()))
      return false; // Item không tồn tại hoặc không còn hàng

    InventoryItem inventoryItem = inventoryItemOpt.get();
    Cart cart = getOrCreateCart(user, guestToken);

    Optional<CartItem> existingItem = cart.getItems().stream()
        .filter(item -> item.getInventoryItem().getId().equals(inventoryItemId))
        .findFirst();

    if (existingItem.isPresent()) {
      // Serialized inventory đã có trong cart thì không thêm trùng.
    } else {
      CartItem newItem = new CartItem(cart, inventoryItem);
      cart.addCartItem(newItem);
    }

    cartRepository.save(cart);
    return true;
  }

  // 3. Xóa một InventoryItem khỏi giỏ hàng
  public void removeFromCart(Long inventoryItemId, User user, String guestToken) {
    Optional<Cart> cartOpt = (user != null)
        // Nếu người dùng đã đăng nhập, tìm giỏ hàng theo User ID
        ? cartRepository.findByUserIdWithItems(user.getId())
        // Nếu người dùng chưa đăng nhập, tìm giỏ hàng theo session token
        : (guestToken != null
            ? cartRepository.findBySessionTokenWithItems(guestToken)
            // Nếu cả user và guestToken đều null, trả về Optional rỗng
            : Optional.empty());

    // Nếu tìm thấy giỏ hàng, xóa item khỏi giỏ hàng
    if (cartOpt.isPresent()) {
      Cart cart = cartOpt.get();
      cart.getItems().removeIf(item -> item.getInventoryItem().getId().equals(inventoryItemId));
      cartRepository.save(cart);
    }
  }

  // 4. Lấy danh sách DTO để hiển thị ra giao diện người dùng
  @Transactional(readOnly = true)
  public List<CartItemDto> getCartDtoList(User user, String guestToken) {
    // Tìm giỏ hàng dựa trên user hoặc guestToken
    Optional<Cart> cartOpt = (user != null)
        ? cartRepository.findByUserIdWithItems(user.getId())
        : (guestToken != null
            ? cartRepository.findBySessionTokenWithItems(guestToken)
            : Optional.empty());

    if (cartOpt.isEmpty() || cartOpt.get().getItems().isEmpty()) {
      // Trả về danh sách rỗng nếu không có giỏ hàng hoặc giỏ hàng trống
      return new ArrayList<>();
    }

    // Nếu có giỏ hàng, chuyển đổi danh sách CartItem sang CartItemDto để hiển thị
    return cartOpt.get().getItems().stream()
        .map(entity -> {
          // Lấy thông tin từ InventoryItem và Product để tạo CartItemDto
          InventoryItem ii = entity.getInventoryItem();
          String titleJa = (ii.getProduct() != null) ? ii.getProduct().getTitleJa() : "Product";
          String isbnOrJan = (ii.getProduct() != null) ? ii.getProduct().getIsbnOrJan() : "N/A";
          Long productId = (ii.getProduct() != null) ? ii.getProduct().getId() : null;

          // Tạo và trả về CartItemDto với các thông tin cần thiết
          return new CartItemDto(
              ii.getId(),
              productId,
              titleJa,
              isbnOrJan,
              ii.getConditionRank(),
              ii.getPrice());
        }).toList();
  }

  // 5. Clear giỏ hàng sau khi thanh toán thành công
  public void clearCart(User user, String guestToken) {
    Optional<Cart> cartOpt = (user != null)
        // Nếu người dùng đã đăng nhập, tìm giỏ hàng theo User ID
        ? cartRepository.findByUserIdWithItems(user.getId())
        : (guestToken != null
            // Nếu người dùng chưa đăng nhập, tìm giỏ hàng theo session token
            ? cartRepository.findBySessionTokenWithItems(guestToken)
            // Nếu cả user và guestToken đều null, trả về Optional rỗng
            : Optional.empty());

    // Nếu tìm thấy giỏ hàng
    if (cartOpt.isPresent()) {
      Cart cart = cartOpt.get();
      cart.getItems().clear(); // Xóa tất cả khỏi giỏ hàng
      cartRepository.save(cart); // Lưu lại giỏ hàng đã được xóa
    }
  }

  // 6. Merge giỏ hàng của guest vào giỏ hàng của user sau khi người dùng đăng
  // nhập
  public void mergeGuestCartToUserCart(User user, String guestToken) {
    if (user == null || guestToken == null || guestToken.isEmpty())
      // Nếu user hoặc guestToken không hợp lệ, không thực hiện merge
      return;

    // Lấy giỏ hàng của guest
    Optional<Cart> guestCartOpt = cartRepository.findBySessionTokenWithItems(guestToken);
    // Nếu Guest không có giỏ hàng hoặc giỏ hàng trống, không thực hiện merge
    if (guestCartOpt.isEmpty() || guestCartOpt.get().getItems().isEmpty())
      return;

    Cart guestCart = guestCartOpt.get();
    // Lấy hoặc tạo giỏ hàng của user
    Cart userCart = getOrCreateCart(user, null);

    // Tiến hành merge từng item từ giỏ hàng của guest vào giỏ hàng của user
    for (CartItem guestItem : guestCart.getItems()) {
      // Kiểm tra xem item đã tồn tại trong giỏ hàng của user chưa
      Optional<CartItem> userItemOpt = userCart.getItems().stream()
          .filter(ui -> ui.getInventoryItem().getId().equals(guestItem.getInventoryItem().getId()))
          .findFirst();

      if (userItemOpt.isPresent()) {
        // Item đã có trong cart của user thì bỏ qua bản trùng từ guest.
      } else {
        // Nếu item chưa tồn tại trong giỏ hàng của user, thêm mới item vào giỏ hàng của
        // user
        CartItem newItem = new CartItem(userCart, guestItem.getInventoryItem());
        userCart.addCartItem(newItem);
      }
    }

    // Xóa tất cả item trong giỏ hàng của guest
    guestCart.getItems().clear();

    // Lưu giỏ hàng của user sau khi merge
    cartRepository.save(userCart);

    // Xóa giỏ hàng của guest sau khi merge
    cartRepository.delete(guestCart);
  }

}
