-- ==========================================
-- Flyway Migration V13: Add Buyback Review Workflow
-- ==========================================

-- 1. Đổi trạng thái APPROVED cũ sang USER_ACCEPTED để dùng state machine mới.
UPDATE buyback_requests
SET
    status = 'USER_ACCEPTED'
WHERE
    status = 'APPROVED';

-- 2. Bổ sung dữ liệu staff cần khi kiểm định và xử lý request.
ALTER TABLE buyback_requests
ADD COLUMN reviewed_by BIGINT REFERENCES users (id) ON DELETE SET NULL,
ADD COLUMN reviewed_at TIMESTAMP,
ADD COLUMN inspection_notes VARCHAR(2000),
ADD COLUMN rejection_reason VARCHAR(1000);

-- 3. Chỉ cho phép các trạng thái thuộc workflow Buyback hiện tại.
ALTER TABLE buyback_requests
ADD CONSTRAINT chk_buyback_request_status CHECK (
    status IN (
        'PENDING', -- Chờ admin nhận hàng
        'RECEIVED', -- Admin đã nhận hàng, chờ kiểm định
        'TESTING', -- Admin đang kiểm định
        'PRICED', -- Admin đã định giá, chờ user chấp nhận
        'USER_ACCEPTED', -- User đã chấp nhận giá, chờ admin thanh toán
        'USER_DECLINED', -- User đã từ chối giá, chờ admin xử lý
        'PAID', -- Admin đã thanh toán, chờ tạo inventory item mới
        'STOCKED', -- Đã tạo inventory item mới trên hệ thống
        'REJECTED' -- Admin đã từ chối hàng, user lấy hàng về
    )
);

-- 4. Condition và final price do staff chốt phải có giá trị hợp lệ.
ALTER TABLE buyback_request_items
ADD CONSTRAINT chk_buyback_final_condition_rank CHECK (
    final_condition_rank IS NULL
    OR final_condition_rank IN ('S', 'A', 'B', 'C')
),
ADD CONSTRAINT chk_buyback_final_buy_price CHECK (
    final_buy_price IS NULL
    OR final_buy_price >= 0
);

-- 5. Lưu lịch sử chuyển trạng thái để admin biết ai đã xử lý và xử lý lúc nào.
CREATE TABLE buyback_request_status_history (
    id BIGSERIAL PRIMARY KEY,
    request_id BIGINT NOT NULL REFERENCES buyback_requests (id) ON DELETE CASCADE,
    from_status VARCHAR(20),
    to_status VARCHAR(20) NOT NULL,
    changed_by BIGINT REFERENCES users (id) ON DELETE SET NULL,
    note VARCHAR(1000),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_buyback_history_to_status CHECK (
        to_status IN (
            'PENDING',
            'RECEIVED',
            'TESTING',
            'PRICED',
            'USER_ACCEPTED',
            'USER_DECLINED',
            'PAID',
            'STOCKED',
            'REJECTED'
        )
    ),
    CONSTRAINT chk_buyback_history_from_status CHECK (
        from_status IS NULL
        OR from_status IN (
            'PENDING',
            'RECEIVED',
            'TESTING',
            'PRICED',
            'USER_ACCEPTED',
            'USER_DECLINED',
            'PAID',
            'STOCKED',
            'REJECTED'
        )
    )
);

-- 6. Phục vụ danh sách admin: lọc theo status và ưu tiên request cũ trước.
CREATE INDEX idx_buyback_requests_status_created_at ON buyback_requests (status, created_at);

CREATE INDEX idx_buyback_status_history_request_created_at ON buyback_request_status_history (request_id, created_at);