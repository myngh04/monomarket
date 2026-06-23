CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) DEFAULT 'USER', -- USER, ADMIN, STAFF
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name_en VARCHAR(100) NOT NULL, -- Tên danh mục tiếng Anh
    name_ja VARCHAR(100) NOT NULL, -- Tên danh mục tiếng Nhật
    slug VARCHAR(100) UNIQUE NOT NULL, -- Ví dụ: 'do-dien-tu', 'game-console'
    parent_id INT REFERENCES categories (id) ON DELETE SET NULL
);

CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    instore_code VARCHAR(50) UNIQUE, -- Lưu mã instorecode cào từ Book Off để đối chiếu
    price DECIMAL(12, 2) NOT NULL, -- Giá bán ra hiện tại (Yên)
    condition_rank VARCHAR(5) NOT NULL, -- S, A, B, C (Chuẩn Rank đồ cũ của Nhật)
    stock INT DEFAULT 1, -- Đồ cũ độc bản nên mặc định thường là 1
    status VARCHAR(20) DEFAULT 'AVAILABLE', -- AVAILABLE, PENDING (đang check-out), SOLD
    category_id INT REFERENCES categories (id) ON DELETE RESTRICT,
    seller_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    attributes JSONB NOT NULL, -- Lưu cấu trúc JSON đa ngôn ngữ + cấu hình máy
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
    product_id BIGINT REFERENCES products (id) ON DELETE RESTRICT,
    price DECIMAL(12, 2) NOT NULL, -- Lưu lại giá tại đúng thời điểm bấm nút mua
    quantity INT DEFAULT 1
);
-- Lớp 1: Ưu tiên Khóa ngoại để tối ưu phép JOIN từ bảng con lên bảng cha
CREATE INDEX idx_products_category ON products (category_id);

CREATE INDEX idx_products_seller ON products (seller_id);

CREATE INDEX idx_orders_user ON orders (user_id);

CREATE INDEX idx_order_items_order ON order_items (order_id);

CREATE INDEX idx_order_items_product ON order_items (product_id);

-- Lớp 2: Tối ưu cho bộ lọc sản phẩm ngoài giao diện (Danh mục -> Giá tăng dần -> Hàng mới về trước)
CREATE INDEX idx_products_shop_filter ON products (
    category_id,
    price ASC,
    created_at DESC
);

-- Lớp 3: GIN Index để bới dữ liệu cực nhanh bên trong trường JSONB đa ngôn ngữ
CREATE INDEX idx_products_jsonb_attrs ON products USING gin (attributes);

-- Chèn danh mục mẫu
INSERT INTO
    categories (name_en, name_ja, slug)
VALUES (
        'Games / Consoles',
        'ゲーム',
        'game-consoles'
    );

-- Chèn sản phẩm Splatoon 3 mẫu
INSERT INTO
    products (
        instore_code,
        price,
        condition_rank,
        stock,
        status,
        category_id,
        attributes
    )
VALUES (
        '0019877475',
        4800.00, -- sale_pr_used
        'A',
        53, -- stock_used
        'AVAILABLE',
        1,
        '{
        "title_ja": "スプラトゥーン３",
        "title_en": "Splatoon 3",
        "desc_ja": "中古のNintendo Switchゲーム、完品です。",
        "desc_en": "Used Nintendo Switch game, fully boxed with cartridge.",
        "platform": "Nintendo Switch",
        "market_price": 5980,
        "buyback_price": 2546
    }'::jsonb
    );