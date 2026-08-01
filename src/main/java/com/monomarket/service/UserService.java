package com.monomarket.service;

import com.monomarket.entity.User;
import com.monomarket.repository.UserRepository;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collections;
import java.util.Optional;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

  private final UserRepository userRepository;

  // Bean mã hóa mật khẩu được cấu hình trong SecurityConfig
  private final PasswordEncoder passwordEncoder;

  // Tìm kiếm người dùng theo email
  public Optional<User> findByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  @Override
  // Method mà Spring Security gọi khi người dùng đăng nhập
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

    // Tìm kiếm người dùng theo email trong DB
    User user = userRepository.findByEmail(email)
        .orElseThrow(() -> new UsernameNotFoundException("Email or password is incorrect"));

    // Trả về đối tượng UserDetails (được Spring Security dựng sẵn)
    return new org.springframework.security.core.userdetails.User(
        user.getEmail(),
        user.getPassword(),
        Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole())));
  }

  // Method đăng ký người dùng mới
  public void registerUser(String fullName, String email, String password) throws Exception {
    // Kiểm tra email đã tồn tại hay chưa
    if (userRepository.findByEmail(email).isPresent()) {
      throw new Exception("Email already exists");
    }

    // Tạo username mới từ email
    User user = new User();
    user.setFullName(fullName);
    user.setEmail(email);

    // Mã hóa mật khẩu trước khi lưu
    user.setPassword(passwordEncoder.encode(password));
    // Gán vai trò mặc định là USER
    user.setRole("USER");

    userRepository.save(user);
  }

  // Cập nhật thông tin cá nhân
  @Transactional
  public User updateProfile(User user, String fullName, String phone) {
    // Load lại entity trong transaction để việc cập nhật profile không phụ thuộc
    // vào Open Session in View giữ entity từ Controller ở trạng thái managed.
    User managedUser = userRepository.findById(user.getId())
        .orElseThrow(() -> new UsernameNotFoundException("User not found"));

    managedUser.setFullName(fullName);
    managedUser.setPhone(phone);
    managedUser.setUpdatedAt(java.time.LocalDateTime.now());
    return managedUser;
  }

}
