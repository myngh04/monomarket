package com.monomarket.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.PageRequest;

import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.Product;

@DataJpaTest
class InventoryItemRepositoryTest {

    @Autowired
    private InventoryItemRepository inventoryItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Test
    void shouldFindInventoryPageWithProduct() {
        Product product = new Product();
        product.setIsbnOrJan("9780000000099");
        product.setTitleJa("Test item");
        product.setTitleEn("Test item");
        product = productRepository.save(product);

        InventoryItem item = new InventoryItem();
        item.setProduct(product);
        item.setInstoreCode("TEST-ITEM-001");
        item.setPrice(new BigDecimal("1200"));
        item.setConditionRank("A");
        inventoryItemRepository.saveAndFlush(item);

        org.springframework.data.domain.Page<InventoryItem> result = inventoryItemRepository
                .findAllWithProduct(PageRequest.of(0, 10));

        assertThat(result.getTotalElements()).isEqualTo(1);
        assertThat(result.getContent().get(0).getProduct().getTitleEn()).isEqualTo("Test item");
    }
}
