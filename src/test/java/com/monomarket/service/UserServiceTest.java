package com.monomarket.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.monomarket.entity.User;
import com.monomarket.repository.UserRepository;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

  @Mock
  private UserRepository userRepository;

  @Mock
  private PasswordEncoder passwordEncoder;

  @InjectMocks
  private UserService userService;

  @Test
  void updateProfileReloadsManagedUserBeforeApplyingChanges() {
    User detachedUser = new User();
    detachedUser.setId(10L);

    User managedUser = new User();
    managedUser.setId(10L);
    managedUser.setFullName("Old Name");
    managedUser.setPhone("0900000000");
    when(userRepository.findById(10L)).thenReturn(Optional.of(managedUser));

    User result = userService.updateProfile(detachedUser, "New Name", "0911111111");

    assertThat(result).isSameAs(managedUser);
    assertThat(managedUser.getFullName()).isEqualTo("New Name");
    assertThat(managedUser.getPhone()).isEqualTo("0911111111");
    assertThat(managedUser.getUpdatedAt()).isNotNull();
    verify(userRepository).findById(10L);
  }

  @Test
  void updateProfileFailsWhenUserNoLongerExists() {
    User user = new User();
    user.setId(10L);
    when(userRepository.findById(10L)).thenReturn(Optional.empty());

    assertThatThrownBy(() -> userService.updateProfile(user, "New Name", "0911111111"))
        .isInstanceOf(UsernameNotFoundException.class)
        .hasMessage("User not found");
  }
}
