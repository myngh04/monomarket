package com.monomarket;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.jdbc.core.JdbcTemplate;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import com.monomarket.entity.Cart;
import com.monomarket.entity.CartItem;
import com.monomarket.entity.InventoryItem;
import com.monomarket.entity.User;
import com.monomarket.exception.OutOfStockException;
import com.monomarket.repository.CartRepository;
import com.monomarket.repository.InventoryItemRepository;
import com.monomarket.repository.UserRepository;
import com.monomarket.service.OrderService;

/**
 * Kiểm tra application context và schema trên PostgreSQL thật ở server Docker Image thay vì chỉ dùng H2.
 */
@Testcontainers
@SpringBootTest(properties = {
		"spring.flyway.enabled=true",
		"spring.jpa.hibernate.ddl-auto=none"
})
class PostgresDatabaseIntegrationTest {

	@Container
	@ServiceConnection
	static final PostgreSQLContainer<?> POSTGRES = new PostgreSQLContainer<>("postgres:18.1");

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private InventoryItemRepository inventoryItemRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private OrderService orderService;

	// Test chạy trên PostgreSQL thật, kiểm tra schema và dữ liệu seed.
	@Test
	void shouldRunApplicationAgainstPostgresSchema() {
		assertThat(jdbcTemplate.queryForObject(
				"SELECT to_regclass('public.products')", String.class)).isEqualTo("products");
		assertThat(jdbcTemplate.queryForObject(
				"SELECT to_regclass('public.inventory_items')", String.class)).isEqualTo("inventory_items");
	}

	// Test schema không còn column quantity dư thừa với serialized inventory.
	@Test
	void shouldRemoveQuantityColumnFromSerializedCartItems() {
		Integer quantityColumnCount = jdbcTemplate.queryForObject(
				"SELECT count(*) FROM information_schema.columns "
						+ "WHERE table_schema = 'public' AND table_name = 'cart_items' AND column_name = 'quantity'",
				Integer.class);

		assertThat(quantityColumnCount).isZero();
	}

	// Test kiểm tra tính năng checkout Concurrency đồng thời, đảm bảo chỉ một người dùng có thể checkout thành công cho cùng một item.
	@Test
	void shouldAllowOnlyOneConcurrentCheckoutForTheSameInventoryItem() throws Exception {
		InventoryItem inventoryItem = inventoryItemRepository.findByStatus("AVAILABLE").stream()
				.findFirst()
				.orElseThrow(() -> new AssertionError("Seed data must contain an AVAILABLE inventory item"));

		User firstUser = createUser("concurrency-first@example.com");
		User secondUser = createUser("concurrency-second@example.com");
		createCart(firstUser, inventoryItem);
		createCart(secondUser, inventoryItem);

		CountDownLatch startGate = new CountDownLatch(1);
		ExecutorService executor = Executors.newFixedThreadPool(2);
		try {
			Future<Boolean> firstCheckout = submitCheckout(executor, startGate, firstUser);
			Future<Boolean> secondCheckout = submitCheckout(executor, startGate, secondUser);
			startGate.countDown();

			// Checkout 30s timeout để tránh test bị treo nếu có vấn đề.
			List<Boolean> results = List.of(
					firstCheckout.get(30, TimeUnit.SECONDS),
					secondCheckout.get(30, TimeUnit.SECONDS));

			assertThat(results).containsExactlyInAnyOrder(true, false);
		} finally {
			executor.shutdownNow();
		}

		assertThat(inventoryItemRepository.findById(inventoryItem.getId()).orElseThrow().getStatus())
				.isEqualTo("RESERVED");
	}

	private Future<Boolean> submitCheckout(
			ExecutorService executor, CountDownLatch startGate, User user) {
		return executor.submit(() -> {
			startGate.await();
			try {
				orderService.checkout(user, "Concurrency test address");
				return true;
			} catch (OutOfStockException exception) {
				return false;
			}
		});
	}

	private User createUser(String email) {
		User user = new User();
		user.setEmail(email);
		user.setPassword("test-password");
		user.setFullName("Concurrency Test User");
		return userRepository.saveAndFlush(user);
	}

	private void createCart(User user, InventoryItem inventoryItem) {
		Cart cart = new Cart();
		cart.setUser(user);
		cart.addCartItem(new CartItem(cart, inventoryItem));
		cartRepository.saveAndFlush(cart);
	}
}
