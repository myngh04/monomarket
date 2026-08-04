-- ==========================================
-- Flyway Migration V11: Update Buyback Request Form
-- ==========================================

-- 1. Thông tin bàn giao do user cung cấp khi tạo Buyback Request
ALTER TABLE buyback_requests
    ADD COLUMN handover_address VARCHAR(500),
    ADD COLUMN preferred_handover_date DATE,
    ADD COLUMN description VARCHAR(1000);

-- 2. Chỉ nhận sản phẩm đã tồn tại trong catalog bằng ISBN/JAN
ALTER TABLE buyback_request_items
    RENAME COLUMN user_declared_title TO submitted_isbn_or_jan;

ALTER TABLE buyback_request_items
    RENAME COLUMN user_declared_condition TO user_condition_rank;

ALTER TABLE buyback_request_items
    ALTER COLUMN submitted_isbn_or_jan TYPE VARCHAR(50),
    ALTER COLUMN submitted_isbn_or_jan SET NOT NULL,
    ALTER COLUMN product_id SET NOT NULL;

-- 3. Condition rank do user tự đánh giá chỉ nhận các rank hợp lệ
ALTER TABLE buyback_request_items
    ADD CONSTRAINT chk_buyback_user_condition_rank
    CHECK (user_condition_rank IS NULL OR user_condition_rank IN ('S', 'A', 'B', 'C'));

-- 4. Giá estimate vẫn lấy từ Product.attributes.buyback_price và được lưu
--    ở buyback_requests.total_estimated_price tại thời điểm submit.
