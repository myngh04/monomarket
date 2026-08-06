package com.monomarket.entity;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BuybackRequestEntityTest {

    @Test
    @DisplayName("Request mới tạo sẽ có status PENDING và đồng bộ item hai chiều")
    void shouldCreatePendingRequestAndLinkItemBothWays() {
        BuybackRequest request = new BuybackRequest();
        BuybackRequestItem item = new BuybackRequestItem();

        request.addItem(item);

        assertThat(request.getStatus()).isEqualTo(BuybackRequestStatus.PENDING);
        assertThat(request.getItems()).containsExactly(item);
        assertThat(item.getBuybackRequest()).isSameAs(request);
    }

    @Test
    @DisplayName("Có thể đồng bộ history và lưu thông tin final pricing trên item")
    void shouldLinkStatusHistoryAndFinalReviewData() {
        BuybackRequest request = new BuybackRequest();
        BuybackRequestStatusHistory history = new BuybackRequestStatusHistory();
        history.setFromStatus(BuybackRequestStatus.PENDING);
        history.setToStatus(BuybackRequestStatus.RECEIVED);

        BuybackRequestItem item = new BuybackRequestItem();
        item.setFinalConditionRank("A");
        item.setFinalBuyPrice(new BigDecimal("1200.00"));

        request.addStatusHistory(history);
        request.addItem(item);

        assertThat(request.getStatusHistory()).containsExactly(history);
        assertThat(history.getBuybackRequest()).isSameAs(request);
        assertThat(item.getFinalConditionRank()).isEqualTo("A");
        assertThat(item.getFinalBuyPrice()).isEqualByComparingTo("1200.00");
    }
}
