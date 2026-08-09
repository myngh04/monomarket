package com.monomarket.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monomarket.dto.BuybackProductLookupDto;
import com.monomarket.dto.BuybackRequestForm;
import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestItem;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.BuybackRequestStatusHistory;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;
import com.monomarket.repository.BuybackRequestRepository;
import com.monomarket.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class UserBuybackService {

  private final BuybackRequestRepository buybackRequestRepository;
  private final ProductRepository productRepository;

  // Nhận ISBN/JAN từ form, lookup product trong catalog và trả title cùng giá
  // estimate cho UI.
  @Transactional(readOnly = true)
  public BuybackProductLookupDto lookupProduct(String submittedIsbnOrJan) {
    Product product = findProduct(submittedIsbnOrJan);
    return toLookupDto(product);
  }

  // Validate user, lookup lại product từ DB, tính estimate và tạo một request
  // PENDING
  // kèm đúng một item; không nhận product hoặc giá do UI tự gửi lên.
  public BuybackRequest createRequest(User user, BuybackRequestForm form) {
    if (user == null || user.getId() == null) {
      throw new IllegalArgumentException("Authenticated user is required");
    }

    Product product = findProduct(form.getSubmittedIsbnOrJan());
    BigDecimal estimatedPrice = product.getBuybackPrice();

    BuybackRequest request = new BuybackRequest();
    request.setUser(user);
    request.setDescription(normalizeOptional(form.getDescription()));
    request.setHandoverAddress(form.getHandoverAddress().trim());
    request.setPreferredHandoverDate(form.getPreferredHandoverDate());
    request.setTotalEstimatedPrice(estimatedPrice);

    BuybackRequestItem item = new BuybackRequestItem();
    item.setProduct(product);
    item.setSubmittedIsbnOrJan(product.getIsbnOrJan());
    item.setUserConditionRank(form.getUserConditionRank().trim().toUpperCase());
    request.addItem(item);

    return buybackRequestRepository.save(request);
  }

  // Lấy toàn bộ lịch sử request của user kèm item/product đã fetch để view không
  // phát sinh N+1 query.
  @Transactional(readOnly = true)
  public List<BuybackRequest> getRequestsByUser(User user) {
    requireUser(user);
    return buybackRequestRepository.findByUserIdWithItems(user.getId());
  }

  // Lấy detail kèm item/product và chỉ trả về request thuộc user hiện tại, tránh
  // lộ dữ liệu người khác.
  @Transactional(readOnly = true)
  public BuybackRequest getRequestForUser(Long requestId, User user) {
    requireUser(user);
    return buybackRequestRepository.findByIdAndUserIdWithItems(requestId, user.getId())
        .orElseThrow(() -> new IllegalArgumentException("Buyback request not found"));
  }

  // Kiểm tra ownership và ghi nhận user chấp nhận final price để request chuyển sang USER_ACCEPTED.
  public BuybackRequest acceptFinalPrice(Long requestId, User user) {
    requireUser(user);
    BuybackRequest request = getRequestForUser(requestId, user);
    if (request.getStatus() != BuybackRequestStatus.PRICED) {
      throw new IllegalStateException("Only PRICED requests can be accepted");
    }
    if (request.getItems() == null || request.getItems().size() != 1
        || request.getItems().get(0).getFinalBuyPrice() == null) {
      throw new IllegalStateException("A final Buyback price is required before acceptance");
    }

    BuybackRequestStatusHistory history = new BuybackRequestStatusHistory();
    history.setFromStatus(BuybackRequestStatus.PRICED);
    history.setToStatus(BuybackRequestStatus.USER_ACCEPTED);
    history.setChangedBy(user);
    history.setNote("User accepted the final Buyback price.");
    request.setStatus(BuybackRequestStatus.USER_ACCEPTED);
    request.addStatusHistory(history);
    return buybackRequestRepository.save(request);
  }

  // Chuẩn hóa ISBN/JAN và lookup product; ném lỗi nếu mã trống hoặc không tồn tại
  // trong catalog.
  private Product findProduct(String submittedIsbnOrJan) {
    String normalizedCode = submittedIsbnOrJan == null ? "" : submittedIsbnOrJan.trim();
    if (normalizedCode.isEmpty()) {
      throw new IllegalArgumentException("ISBN/JAN cannot be blank");
    }

    return productRepository.findByIsbnOrJan(normalizedCode)
        .orElseThrow(() -> new IllegalArgumentException("Product not found for ISBN/JAN: " + normalizedCode));
  }

  // Chuyển Product đã lookup thành DTO response cho endpoint autocomplete/lookup.
  private BuybackProductLookupDto toLookupDto(Product product) {
    return new BuybackProductLookupDto(
        product.getId(),
        product.getIsbnOrJan(),
        product.getDisplayTitle(),
        product.getBuybackPrice());
  }

  // Trim description tùy chọn và đổi chuỗi rỗng thành null trước khi lưu.
  private String normalizeOptional(String value) {
    return value == null || value.isBlank() ? null : value.trim();
  }

  // Đảm bảo service chỉ xử lý user đã được authenticate và có id hợp lệ.
  private void requireUser(User user) {
    if (user == null || user.getId() == null) {
      throw new IllegalArgumentException("Authenticated user is required");
    }
  }
}
