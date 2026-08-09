package com.monomarket.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.monomarket.dto.BuybackProductLookupDto;
import com.monomarket.dto.BuybackRequestForm;
import com.monomarket.entity.BuybackRequest;
import com.monomarket.entity.BuybackRequestStatus;
import com.monomarket.entity.Product;
import com.monomarket.entity.User;
import com.monomarket.repository.BuybackRequestRepository;
import com.monomarket.repository.ProductRepository;

@ExtendWith(MockitoExtension.class)
class UserBuybackServiceTest {

  @Mock
  private BuybackRequestRepository buybackRequestRepository;

  @Mock
  private ProductRepository productRepository;

  @InjectMocks
  private UserBuybackService buybackService;

  private User user;
  private Product product;

  @BeforeEach
  void setUp() {
    user = new User();
    user.setId(1L);
    user.setEmail("user@example.com");

    product = new Product();
    product.setId(10L);
    product.setIsbnOrJan("9780000000001");
    product.setTitleEn("Test Product");
    product.setTitleJa("テスト商品");
    product.setAttributes(Map.of("buyback_price", 1250));
  }

  @Test
  @DisplayName("Lookup ISBN/JAN thành công trả về title và giá buyback")
  void shouldLookupProductByIsbnOrJan() {
    when(productRepository.findByIsbnOrJan("9780000000001")).thenReturn(Optional.of(product));

    BuybackProductLookupDto result = buybackService.lookupProduct(" 9780000000001 ");

    assertThat(result.getProductId()).isEqualTo(10L);
    assertThat(result.getIsbnOrJan()).isEqualTo("9780000000001");
    assertThat(result.getTitle()).isEqualTo("Test Product");
    assertThat(result.getEstimatedBuybackPrice()).isEqualByComparingTo("1250");
  }

  @Test
  @DisplayName("Lookup ISBN/JAN không tồn tại thì báo lỗi")
  void shouldRejectUnknownIsbnOrJan() {
    when(productRepository.findByIsbnOrJan("unknown")).thenReturn(Optional.empty());

    assertThatThrownBy(() -> buybackService.lookupProduct("unknown"))
        .isInstanceOf(IllegalArgumentException.class)
        .hasMessageContaining("Product not found");
  }

  @Test
  @DisplayName("Tạo Buyback request lưu đúng user, PENDING, item và giá estimate")
  void shouldCreatePendingRequest() {
    BuybackRequestForm form = validForm();
    when(productRepository.findByIsbnOrJan("9780000000001")).thenReturn(Optional.of(product));
    when(buybackRequestRepository.save(any(BuybackRequest.class)))
        .thenAnswer(invocation -> invocation.getArgument(0));

    BuybackRequest result = buybackService.createRequest(user, form);

    assertThat(result.getUser()).isSameAs(user);
    assertThat(result.getStatus()).isEqualTo(BuybackRequestStatus.PENDING);
    assertThat(result.getDescription()).isEqualTo("Some additional notes");
    assertThat(result.getHandoverAddress()).isEqualTo("123 Test Street");
    assertThat(result.getPreferredHandoverDate()).isEqualTo(LocalDate.of(2026, 8, 10));
    assertThat(result.getTotalEstimatedPrice()).isEqualByComparingTo("1250");
    assertThat(result.getItems()).hasSize(1);
    assertThat(result.getItems().get(0).getProduct()).isSameAs(product);
    assertThat(result.getItems().get(0).getSubmittedIsbnOrJan()).isEqualTo("9780000000001");
    assertThat(result.getItems().get(0).getUserConditionRank()).isEqualTo("A");
    verify(buybackRequestRepository).save(any(BuybackRequest.class));
  }

  @Test
  @DisplayName("Không được tạo request khi ISBN/JAN không có trong catalog")
  void shouldNotCreateRequestForUnknownProduct() {
    BuybackRequestForm form = validForm();
    when(productRepository.findByIsbnOrJan("9780000000001")).thenReturn(Optional.empty());

    assertThatThrownBy(() -> buybackService.createRequest(user, form))
        .isInstanceOf(IllegalArgumentException.class)
        .hasMessageContaining("Product not found");
  }

  @Test
  @DisplayName("Lấy detail chỉ thành công khi request thuộc user hiện tại")
  void shouldGetRequestOnlyForOwner() {
    BuybackRequest request = new BuybackRequest();
    request.setId(50L);
    request.setUser(user);
    when(buybackRequestRepository.findByIdAndUserIdWithItems(50L, 1L))
        .thenReturn(Optional.of(request));

    BuybackRequest result = buybackService.getRequestForUser(50L, user);

    assertThat(result).isSameAs(request);
  }

  @Test
  @DisplayName("Request không thuộc user thì được xem như không tồn tại")
  void shouldRejectRequestOwnedByAnotherUser() {
    when(buybackRequestRepository.findByIdAndUserIdWithItems(50L, 1L))
        .thenReturn(Optional.empty());

    assertThatThrownBy(() -> buybackService.getRequestForUser(50L, user))
        .isInstanceOf(IllegalArgumentException.class)
        .hasMessage("Buyback request not found");
  }

  @Test
  @DisplayName("User cháº¥p nháº­n final price thÃ¬ request chuyá»ƒn USER_ACCEPTED")
  void shouldAcceptFinalPrice() {
    BuybackRequest request = new BuybackRequest();
    request.setId(50L);
    request.setUser(user);
    request.setStatus(BuybackRequestStatus.PRICED);
    var item = new com.monomarket.entity.BuybackRequestItem();
    item.setFinalBuyPrice(new java.math.BigDecimal("850"));
    request.addItem(item);
    when(buybackRequestRepository.findByIdAndUserIdWithItems(50L, 1L))
        .thenReturn(Optional.of(request));
    when(buybackRequestRepository.save(any(BuybackRequest.class)))
        .thenAnswer(invocation -> invocation.getArgument(0));

    BuybackRequest result = buybackService.acceptFinalPrice(50L, user);

    assertThat(result.getStatus()).isEqualTo(BuybackRequestStatus.USER_ACCEPTED);
    assertThat(result.getStatusHistory()).hasSize(1);
    assertThat(result.getStatusHistory().get(0).getToStatus())
        .isEqualTo(BuybackRequestStatus.USER_ACCEPTED);
    verify(buybackRequestRepository).save(request);
  }

  private BuybackRequestForm validForm() {
    BuybackRequestForm form = new BuybackRequestForm();
    form.setSubmittedIsbnOrJan("9780000000001");
    form.setUserConditionRank("a");
    form.setDescription("Some additional notes");
    form.setHandoverAddress("123 Test Street");
    form.setPreferredHandoverDate(LocalDate.of(2026, 8, 10));
    return form;
  }
}
