package com.monomarket;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class MonomarketApplicationTests {

	@Test
	void contextLoads() {
	}

	@Test
	void generateBcrypt() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// Mã hóa mật khẩu "admin123" để tạo tài khoản mẫu ADMIN
		System.out.println("--- GENERATED BCRYPT HASH: " + encoder.encode("admin123") + " ---");

		// Mã hóa mật khẩu "user123" để tạo tài khoản mẫu USER
		System.out.println("--- GENERATED BCRYPT HASH: " + encoder.encode("user123") + " ---");
	}

}
