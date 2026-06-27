-- 1. XÓA SẠCH ĐỐNG BẢNG CŨ (Trừ bảng categories vì V2 đã làm cây danh mục quá đẹp)
DROP TABLE IF EXISTS order_items CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

DROP TABLE IF EXISTS products CASCADE;

-- 2. TẠO LẠI BẢNG PRODUCTS (Đóng vai trò là Product Catalog chung)
CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    isbn_or_jan VARCHAR(50) UNIQUE NOT NULL, -- Mã vạch chuẩn (ISBN của sách, JAN của Game/DVD)
    title_ja VARCHAR(255) NOT NULL, -- Tên tiếng Nhật gốc 
    title_en VARCHAR(255), -- Tên tiếng Anh dịch lại cho hệ thống
    category_id INT REFERENCES categories (id) ON DELETE RESTRICT,
    attributes JSONB NOT NULL DEFAULT '{}'::jsonb, -- Lưu thông tin dynamic (Tác giả, Hệ máy, Studio phim)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. TẠO BẢNG INVENTORY_ITEMS (Quản lý 1 món hàng thực tế trong kho)
CREATE TABLE inventory_items (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT REFERENCES products (id) ON DELETE RESTRICT,
    instore_code VARCHAR(50) UNIQUE NOT NULL, -- Mã định danh riêng biệt của từng món đồ cũ trên kệ
    price DECIMAL(12, 2) NOT NULL, -- Giá bán ra hiện tại (Yên)
    condition_rank VARCHAR(3) NOT NULL, -- S, A, B, C (Hàng NEW thì để là NEW)
    status VARCHAR(20) DEFAULT 'AVAILABLE', -- AVAILABLE, PENDING, SOLD
    item_type VARCHAR(10) DEFAULT 'USED', -- USED (Đồ cũ), NEW (Đồ mới nguyên seal)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. TẠO LẠI BẢNG ORDERS & ORDER_ITEMS (Nối sang bảng Inventory thực tế)
CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users (id) ON DELETE RESTRICT,
    total_price DECIMAL(12, 2) NOT NULL,
    shipping_address TEXT NOT NULL,
    status VARCHAR(24) DEFAULT 'PENDING', -- PENDING, PAID, SHIPPING, DELIVERED, CANCELLED
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES orders (id) ON DELETE CASCADE,
    inventory_item_id BIGINT REFERENCES inventory_items (id) ON DELETE RESTRICT, -- Nối thẳng vào món cụ thể
    price DECIMAL(12, 2) NOT NULL
);

-- 5. TẠO CỤM BẢNG QUẢN LÝ QUY TRÌNH THU MUA (BUYBACK REQUEST)
CREATE TABLE buyback_requests (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users (id) ON DELETE RESTRICT,
    status VARCHAR(20) DEFAULT 'PENDING', -- PENDING, TESTING, PRICED, APPROVED, REJECTED
    total_estimated_price DECIMAL(12, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE buyback_request_items (
    id BIGSERIAL PRIMARY KEY,
    request_id BIGINT REFERENCES buyback_requests (id) ON DELETE CASCADE,
    product_id BIGINT REFERENCES products (id) ON DELETE SET NULL, -- Nối về catalog nếu hệ thống check được mã
    user_declared_title VARCHAR(255) NOT NULL, -- Tên sản phẩm do khách tự gõ/khai báo
    user_declared_condition VARCHAR(50), -- Tình trạng khách tự đánh giá
    final_condition_rank VARCHAR(5), -- Rank chuẩn do chuyên viên test và chốt
    final_buy_price DECIMAL(12, 2) -- Số tiền thực tế sàn trả cho khách
);

-- 6. PHỦ CÁC LỚP INDEX ĐỂ TỐI ƯU TRUY VẤN TÌM KIẾM TỐC ĐỘ CAO
CREATE INDEX idx_products_category ON products (category_id);

CREATE INDEX idx_products_isbn ON products (isbn_or_jan);

CREATE INDEX idx_inventory_product ON inventory_items (product_id);

CREATE INDEX idx_inventory_status_rank ON inventory_items (status, condition_rank);

CREATE INDEX idx_buyback_user ON buyback_requests (user_id);

CREATE INDEX idx_products_catalog_jsonb ON products USING gin (attributes);