package com.monomarket.controller.support;

import com.monomarket.entity.User;

public record CartRequestContext(User user, String guestToken) {
}
