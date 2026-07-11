-- ==========================================
-- Flyway Migration: Seed Users for RBAC
-- ==========================================

-- 1. Tài khoản ADMIN (Mật khẩu: admin123)
INSERT INTO
    users (
        email,
        password,
        full_name,
        phone,
        role
    )
VALUES (
        'admin@monomarket.com',
        '$2a$10$CyrKQWQEdtYY.737Z7NExueIrsUHtguSfNvRAMLA/10Ke6trTHwfy',
        'Admin MonoMarket',
        '0987654321',
        'ADMIN'
    )
ON CONFLICT (email) DO NOTHING;

-- 2. Tài khoản USER (Mật khẩu: user123)
INSERT INTO
    users (
        email,
        password,
        full_name,
        phone,
        role
    )
VALUES (
        'user@monomarket.com',
        '$2a$10$gWN9lF9EqHqacUTZjhgWreN.QJZOVmVaBHU4z98gGUrNViWsFx9aO',
        'Normal User',
        '0123456789',
        'USER'
    )
ON CONFLICT (email) DO NOTHING;