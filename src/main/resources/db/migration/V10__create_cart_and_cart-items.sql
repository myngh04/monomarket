-- ==========================================
-- Flyway Migration V10: Create 2 Cart Tables
-- ==========================================

-- 1. Bảng Carts (Quản lý giỏ hàng của User hoặc Guest Session)
CREATE TABLE carts (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    session_token VARCHAR(100) UNIQUE, -- Token định danh cho khách chưa login
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Bảng Cart Items (Chi tiết từng món hàng trong giỏ hàng)
CREATE TABLE cart_items (
    id BIGSERIAL PRIMARY KEY,
    cart_id BIGINT NOT NULL REFERENCES carts (id) ON DELETE CASCADE,
    inventory_item_id BIGINT NOT NULL REFERENCES inventory_items (id) ON DELETE CASCADE,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_cart_inventory_item UNIQUE (cart_id, inventory_item_id)
);

-- 3. Tạo Indexes tối ưu tốc độ truy vấn giỏ hàng
CREATE INDEX idx_carts_user ON carts (user_id);

CREATE INDEX idx_carts_session_token ON carts (session_token);

CREATE INDEX idx_cart_items_cart ON cart_items (cart_id);