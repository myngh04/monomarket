-- ==========================================
-- Flyway Migration V12: Remove Cart Item Quantity
-- ==========================================

-- Mỗi CartItem đã đại diện cho đúng một InventoryItem vật lý duy nhất.
-- Xóa quantity dư thừa để không thể làm sai tổng tiền của serialized inventory.
ALTER TABLE cart_items DROP COLUMN quantity;