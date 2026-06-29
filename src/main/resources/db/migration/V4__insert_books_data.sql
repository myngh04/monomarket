-- ==========================================
-- Flyway Migration: Seed Book Off books into MonoMarket
-- ==========================================

-- Insert product catalog: 白鳥とコウモリ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019601956', '白鳥とコウモリ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "東野圭吾", "market_price": 2000, "buyback_price": 91, "publisher": "単行本", "saledate": "2021-04-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019601956'), '0019601956-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019601956'), '0019601956-U02', 638, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: コンビニ人間
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018702768', 'コンビニ人間', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "村田沙耶香", "market_price": 1300, "buyback_price": 46, "publisher": "単行本", "saledate": "2016-07-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018702768'), '0018702768-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018702768'), '0018702768-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヨシモトオノ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020598461', 'ヨシモトオノ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "吉本ばなな", "market_price": 1600, "buyback_price": 137, "publisher": "単行本", "saledate": "2025-05-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598461'), '0020598461-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598461'), '0020598461-U02', 638, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598461'), '0020598461-U03', 525, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 舟を編む
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016709473', '舟を編む', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "三浦しをん", "market_price": 1500, "buyback_price": 46, "publisher": "単行本", "saledate": "2011-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016709473'), '0016709473-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016709473'), '0016709473-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016709473'), '0016709473-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アルプス席の母
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020271211', 'アルプス席の母', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "早見和真", "market_price": 1700, "buyback_price": 546, "publisher": "単行本", "saledate": "2024-03-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020271211'), '0020271211-U01', 1350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020271211'), '0020271211-U02', 1148, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020271211'), '0020271211-U03', 945, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: それいけ！平安部
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020556373', 'それいけ！平安部', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "宮島未奈", "market_price": 1600, "buyback_price": 273, "publisher": "単行本", "saledate": "2025-04-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020556373'), '0020556373-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020556373'), '0020556373-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020556373'), '0020556373-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新！　店長がバカすぎて
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019887453', '新！　店長がバカすぎて', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "早見和真", "market_price": 1600, "buyback_price": 91, "publisher": "単行本", "saledate": "2022-08-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019887453'), '0019887453-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019887453'), '0019887453-U02', 510, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: タイム・アフター・タイム
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020838778', 'タイム・アフター・タイム', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "吉田修一", "market_price": 2200, "buyback_price": 819, "publisher": "単行本", "saledate": "2026-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 猫のにゃ温泉　～復讐屋はじめました～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020759018', '猫のにゃ温泉　～復讐屋はじめました～', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "いぬじゅん", "market_price": 1600, "buyback_price": 128, "publisher": "単行本", "saledate": "2025-12-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020759018'), '0020759018-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020759018'), '0020759018-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: まどろみの星たち
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020802420', 'まどろみの星たち', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "菰野江名", "market_price": 1800, "buyback_price": 546, "publisher": "単行本", "saledate": "2026-03-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 宙ごはん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019834566', '宙ごはん', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "町田そのこ", "market_price": 1600, "buyback_price": 46, "publisher": "単行本", "saledate": "2022-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019834566'), '0019834566-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019834566'), '0019834566-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019834566'), '0019834566-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夜に星を放つ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019844454', '夜に星を放つ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "窪美澄", "market_price": 1400, "buyback_price": 46, "publisher": "単行本", "saledate": "2022-05-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019844454'), '0019844454-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019844454'), '0019844454-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019844454'), '0019844454-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ぎんなみ商店街の事件簿　ＢＲＯＴＨＥＲ編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020139922', 'ぎんなみ商店街の事件簿　ＢＲＯＴＨＥＲ編', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "井上真偽", "market_price": 1400, "buyback_price": 91, "publisher": "単行本", "saledate": "2023-09-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139922'), '0020139922-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139922'), '0020139922-U02', 468, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139922'), '0020139922-U03', 385, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 銀翼のイカロス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017195069', '銀翼のイカロス', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "池井戸潤", "market_price": 1500, "buyback_price": 5, "publisher": "単行本", "saledate": "2014-08-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017195069'), '0017195069-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017195069'), '0017195069-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 生きとるわ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020777512', '生きとるわ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "又吉直樹", "market_price": 2000, "buyback_price": 637, "publisher": "単行本", "saledate": "2026-01-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777512'), '0020777512-U01', 1400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777512'), '0020777512-U02', 1190, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777512'), '0020777512-U03', 980, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 失われた貌
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020663529', '失われた貌', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "櫻田智也", "market_price": 1800, "buyback_price": 364, "publisher": "単行本", "saledate": "2025-08-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020663529'), '0020663529-U01', 1050, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020663529'), '0020663529-U02', 892, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020663529'), '0020663529-U03', 735, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: テスカトリポカ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019597828', 'テスカトリポカ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "佐藤究", "market_price": 2100, "buyback_price": 46, "publisher": "単行本", "saledate": "2021-02-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019597828'), '0019597828-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019597828'), '0019597828-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019597828'), '0019597828-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: カット・イン　カット・アウト
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020555551', 'カット・イン　カット・アウト', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "松井玲奈", "market_price": 1700, "buyback_price": 110, "publisher": "単行本", "saledate": "2025-03-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020555551'), '0020555551-U01', 800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020555551'), '0020555551-U02', 680, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: カフネ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020319293', 'カフネ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "阿部暁子", "market_price": 1700, "buyback_price": 364, "publisher": "単行本", "saledate": "2024-05-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020319293'), '0020319293-U01', 1000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020319293'), '0020319293-U02', 850, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020319293'), '0020319293-U03', 700, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: あいにくあんたのためじゃない
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020274017', 'あいにくあんたのためじゃない', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "柚木麻子", "market_price": 1600, "buyback_price": 91, "publisher": "単行本", "saledate": "2024-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020274017'), '0020274017-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020274017'), '0020274017-U02', 510, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020274017'), '0020274017-U03', 420, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 君のクイズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019903025', '君のクイズ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "小川哲", "market_price": 1400, "buyback_price": 219, "publisher": "単行本", "saledate": "2022-10-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903025'), '0019903025-U01', 850, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903025'), '0019903025-U02', 722, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903025'), '0019903025-U03', 595, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 流浪の月
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019307804', '流浪の月', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "凪良ゆう", "market_price": 1500, "buyback_price": 46, "publisher": "単行本", "saledate": "2019-08-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019307804'), '0019307804-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019307804'), '0019307804-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019307804'), '0019307804-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: わたしの美しい庭
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019363053', 'わたしの美しい庭', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "凪良ゆう", "market_price": 1500, "buyback_price": 91, "publisher": "単行本", "saledate": "2019-12-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019363053'), '0019363053-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019363053'), '0019363053-U02', 468, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019363053'), '0019363053-U03', 385, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 皇后の碧
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020603960', '皇后の碧', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "阿部智里", "market_price": 1800, "buyback_price": 182, "publisher": "単行本", "saledate": "2025-05-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020603960'), '0020603960-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020603960'), '0020603960-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020603960'), '0020603960-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: サラバ！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017246556', 'サラバ！', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "西加奈子", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2014-10-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017246556'), '0017246556-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 死んだ山田と教室
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020314522', '死んだ山田と教室', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "金子玲介", "market_price": 1800, "buyback_price": 91, "publisher": "単行本", "saledate": "2024-05-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020314522'), '0020314522-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020314522'), '0020314522-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020314522'), '0020314522-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 黄色い家
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020016204', '黄色い家', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "川上未映子", "market_price": 1900, "buyback_price": 364, "publisher": "単行本", "saledate": "2023-02-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020016204'), '0020016204-U01', 1150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020016204'), '0020016204-U02', 978, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020016204'), '0020016204-U03', 805, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ５２ヘルツのクジラたち
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019456411', '５２ヘルツのクジラたち', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "町田そのこ", "market_price": 1700, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-04-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019456411'), '0019456411-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019456411'), '0019456411-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019456411'), '0019456411-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 変な家
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020198430', '変な家', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "雨穴", "market_price": 1500, "buyback_price": 182, "publisher": "単行本", "saledate": "2023-12-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198430'), '0020198430-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198430'), '0020198430-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198430'), '0020198430-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブティック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020838763', 'ブティック', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "池井戸潤", "market_price": 2000, "buyback_price": 773, "publisher": "単行本", "saledate": "2026-05-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020838763'), '0020838763-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020838763'), '0020838763-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 街とその不確かな壁
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020031427', '街とその不確かな壁', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "村上春樹", "market_price": 2700, "buyback_price": 46, "publisher": "単行本", "saledate": "2023-04-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020031427'), '0020031427-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020031427'), '0020031427-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020031427'), '0020031427-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 青くて痛くて脆い
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018999905', '青くて痛くて脆い', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "住野よる", "market_price": 1400, "buyback_price": 5, "publisher": "単行本", "saledate": "2018-03-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018999905'), '0018999905-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018999905'), '0018999905-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 星を編む
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020172614', '星を編む', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "凪良ゆう", "market_price": 1600, "buyback_price": 455, "publisher": "単行本", "saledate": "2023-11-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172614'), '0020172614-U01', 1450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172614'), '0020172614-U02', 1232, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172614'), '0020172614-U03', 1015, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172614'), '0020172614-N01', 1600, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 同志少女よ、敵を撃て
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019765428', '同志少女よ、敵を撃て', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "逢坂冬馬", "market_price": 1900, "buyback_price": 91, "publisher": "単行本", "saledate": "2021-11-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019765428'), '0019765428-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019765428'), '0019765428-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019765428'), '0019765428-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 少年と犬
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019467518', '少年と犬', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "馳星周", "market_price": 1600, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-05-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 少年と犬
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019467518', '少年と犬', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "馳星周", "market_price": 1600, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-05-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019467518'), '0019467518-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: か「」く「」し「」ご「」と「
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018827460', 'か「」く「」し「」ご「」と「', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "住野よる", "market_price": 1900, "buyback_price": 5, "publisher": "単行本", "saledate": "2017-03-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018827460'), '0018827460-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018827460'), '0018827460-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 君の膵臓をたべたい
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017357604', '君の膵臓をたべたい', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "住野よる", "market_price": 1400, "buyback_price": 5, "publisher": "単行本", "saledate": "2015-06-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017357604'), '0017357604-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017357604'), '0017357604-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017357604'), '0017357604-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スモールワールズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019628958', 'スモールワールズ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "一穂ミチ", "market_price": 1500, "buyback_price": 46, "publisher": "単行本", "saledate": "2021-04-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019628958'), '0019628958-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019628958'), '0019628958-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019628958'), '0019628958-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: とんこつＱ＆Ａ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019860803', 'とんこつＱ＆Ａ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "今村夏子", "market_price": 1500, "buyback_price": 5, "publisher": "単行本", "saledate": "2022-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019860803'), '0019860803-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 世界はきみが思うより
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020719789', '世界はきみが思うより', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "寺地はるな", "market_price": 1600, "buyback_price": 364, "publisher": "単行本", "saledate": "2025-11-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020719789'), '0020719789-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020719789'), '0020719789-U02', 1062, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ごめん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015890512', 'ごめん', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "原田マハ, [{原田マハ}]【著】", "market_price": 1500, "buyback_price": 273, "publisher": "単行本", "saledate": "2008-05-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015890512'), '0015890512-U01', 1350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ゆびさきに魔法
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020441055', 'ゆびさきに魔法', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "三浦しをん", "market_price": 1800, "buyback_price": 182, "publisher": "単行本", "saledate": "2024-11-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020441055'), '0020441055-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020441055'), '0020441055-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020441055'), '0020441055-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 彼方の友へ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018961989', '彼方の友へ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊吹有喜", "market_price": 1700, "buyback_price": 55, "publisher": "単行本", "saledate": "2017-11-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 可燃物
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020091213', '可燃物', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "米澤穂信", "market_price": 1700, "buyback_price": 91, "publisher": "単行本", "saledate": "2023-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020091213'), '0020091213-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020091213'), '0020091213-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020091213'), '0020091213-U03', 455, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鹿の王
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017227847', '鹿の王', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "上橋菜穂子", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2014-09-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017227847'), '0017227847-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017227847'), '0017227847-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 向日葵の咲かない夏
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012813139', '向日葵の咲かない夏', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "道尾秀介", "market_price": 1600, "buyback_price": 273, "publisher": "単行本", "saledate": "2005-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 多類婚姻譚
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020838777', '多類婚姻譚', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "凪良ゆう", "market_price": 1900, "buyback_price": 728, "publisher": "単行本", "saledate": "2026-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020838777'), '0020838777-U01', 1650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 蜜蜂と遠雷
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018747389', '蜜蜂と遠雷', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "恩田陸", "market_price": 2000, "buyback_price": 19, "publisher": "単行本", "saledate": "2016-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018747389'), '0018747389-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018747389'), '0018747389-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 塞王の楯
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019754539', '塞王の楯', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "今村翔吾", "market_price": 2000, "buyback_price": 91, "publisher": "単行本", "saledate": "2021-10-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019754539'), '0019754539-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019754539'), '0019754539-U02', 638, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019754539'), '0019754539-U03', 525, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ７７７　トリプルセブン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020133038', '７７７　トリプルセブン', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1700, "buyback_price": 182, "publisher": "単行本", "saledate": "2023-09-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020133038'), '0020133038-U01', 800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020133038'), '0020133038-U02', 680, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020133038'), '0020133038-U03', 560, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 村上海賊の娘
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017065048', '村上海賊の娘', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "和田竜", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2013-10-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017065048'), '0017065048-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017065048'), '0017065048-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夜のピクニック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012712278', '夜のピクニック', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "恩田陸", "market_price": 1800, "buyback_price": 10, "publisher": "単行本", "saledate": "2004-07-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 嫌いなら呼ぶなよ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019871979', '嫌いなら呼ぶなよ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "綿矢りさ", "market_price": 1400, "buyback_price": 91, "publisher": "単行本", "saledate": "2022-07-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019871979'), '0019871979-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: サンショウウオの四十九日
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020353666', 'サンショウウオの四十九日', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "朝比奈秋", "market_price": 1700, "buyback_price": 46, "publisher": "単行本", "saledate": "2024-07-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020353666'), '0020353666-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020353666'), '0020353666-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020353666'), '0020353666-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 熱源
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019307132', '熱源', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "川越宗一", "market_price": 1850, "buyback_price": 5, "publisher": "単行本", "saledate": "2019-08-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019307132'), '0019307132-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019307132'), '0019307132-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マスカレード・ライフ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020620000', 'マスカレード・ライフ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "東野圭吾", "market_price": 2000, "buyback_price": 455, "publisher": "単行本", "saledate": "2025-07-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020620000'), '0020620000-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020620000'), '0020620000-U02', 1062, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020620000'), '0020620000-U03', 875, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ありか
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020571648', 'ありか', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "瀬尾まいこ", "market_price": 1800, "buyback_price": 591, "publisher": "単行本", "saledate": "2025-04-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020571648'), '0020571648-U01', 1450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020571648'), '0020571648-U02', 1232, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020571648'), '0020571648-U03', 1015, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブレイクショットの軌跡
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020534616', 'ブレイクショットの軌跡', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "逢坂冬馬", "market_price": 2100, "buyback_price": 637, "publisher": "単行本", "saledate": "2025-03-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020534616'), '0020534616-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020534616'), '0020534616-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020534616'), '0020534616-U03', 1050, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 逆ソクラテス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019442069', '逆ソクラテス', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1400, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-04-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019442069'), '0019442069-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019442069'), '0019442069-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019442069'), '0019442069-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ぎんなみ商店街の事件簿　ＳＩＳＴＥＲ編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020139921', 'ぎんなみ商店街の事件簿　ＳＩＳＴＥＲ編', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "井上真偽", "market_price": 1400, "buyback_price": 91, "publisher": "単行本", "saledate": "2023-09-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139921'), '0020139921-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139921'), '0020139921-U02', 468, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020139921'), '0020139921-U03', 385, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クライマーズ・ハイ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012657334', 'クライマーズ・ハイ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "横山秀夫", "market_price": 1571, "buyback_price": 5, "publisher": "単行本", "saledate": "2003-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0012657334'), '0012657334-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 今日未明
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020659380', '今日未明', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "辻堂ゆめ", "market_price": 1800, "buyback_price": 591, "publisher": "単行本", "saledate": "2025-08-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020659380'), '0020659380-U01', 1450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020659380'), '0020659380-U02', 1232, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020659380'), '0020659380-U03', 1015, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 逃亡者は北へ向かう
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020513567', '逃亡者は北へ向かう', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "柚月裕子", "market_price": 1900, "buyback_price": 364, "publisher": "単行本", "saledate": "2025-02-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020513567'), '0020513567-U01', 1150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020513567'), '0020513567-U02', 978, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020513567'), '0020513567-U03', 805, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: かわいそ笑
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019877649', 'かわいそ笑', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "梨", "market_price": 1500, "buyback_price": 28, "publisher": "単行本", "saledate": "2022-08-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019877649'), '0019877649-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019877649'), '0019877649-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019877649'), '0019877649-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ニューワールド
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020255607', 'ニューワールド', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "凪良ゆう", "market_price": 1500, "buyback_price": 137, "publisher": "単行本", "saledate": "2024-02-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020255607'), '0020255607-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 誓いの証言
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020797355', '誓いの証言', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "柚月裕子", "market_price": 1900, "buyback_price": 637, "publisher": "単行本", "saledate": "2026-03-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020797355'), '0020797355-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020797355'), '0020797355-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020797355'), '0020797355-U03', 1050, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クスノキの女神
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020298877', 'クスノキの女神', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "東野圭吾", "market_price": 1800, "buyback_price": 455, "publisher": "単行本", "saledate": "2024-05-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298877'), '0020298877-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298877'), '0020298877-U02', 1062, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298877'), '0020298877-U03', 875, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チョコレート・ピース
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020601179', 'チョコレート・ピース', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "青山美智子", "market_price": 1600, "buyback_price": 273, "publisher": "単行本", "saledate": "2025-06-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601179'), '0020601179-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601179'), '0020601179-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601179'), '0020601179-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アヒルと鴨のコインロッカー
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012653970', 'アヒルと鴨のコインロッカー', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1500, "buyback_price": 137, "publisher": "単行本", "saledate": "2003-11-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0012653970'), '0012653970-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 婚活マエストロ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020409076', '婚活マエストロ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "宮島未奈", "market_price": 1600, "buyback_price": 137, "publisher": "単行本", "saledate": "2024-10-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409076'), '0020409076-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409076'), '0020409076-U02', 638, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409076'), '0020409076-U03', 525, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 帰れない探偵
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020619942', '帰れない探偵', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "柴崎友香", "market_price": 1850, "buyback_price": 728, "publisher": "単行本", "saledate": "2025-06-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020619942'), '0020619942-U01', 1650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020619942'), '0020619942-U02', 1402, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020619942'), '0020619942-U03', 1155, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ジュージュー
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016655891', 'ジュージュー', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "よしもとばなな, [{よしもとばなな}]【著】", "market_price": 1100, "buyback_price": 5, "publisher": "単行本", "saledate": "2011-07-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016655891'), '0016655891-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 恋とか愛とかやさしさなら
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020409081', '恋とか愛とかやさしさなら', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "一穂ミチ", "market_price": 1600, "buyback_price": 182, "publisher": "単行本", "saledate": "2024-10-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409081'), '0020409081-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409081'), '0020409081-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020409081'), '0020409081-U03', 665, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ミトンとふびん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019778846', 'ミトンとふびん', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "吉本ばなな", "market_price": 1700, "buyback_price": 91, "publisher": "単行本", "saledate": "2021-12-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019778846'), '0019778846-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019778846'), '0019778846-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マスカレード・ゲーム
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019821833', 'マスカレード・ゲーム', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "東野圭吾", "market_price": 1650, "buyback_price": 46, "publisher": "単行本", "saledate": "2022-04-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019821833'), '0019821833-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019821833'), '0019821833-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019821833'), '0019821833-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 今日も私は、ひとつの菓子を
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020608384', '今日も私は、ひとつの菓子を', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "髙田充", "market_price": 1800, "buyback_price": 119, "publisher": "単行本", "saledate": "2025-06-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020608384'), '0020608384-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プラナリア
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012499573', 'プラナリア', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "山本文緒", "market_price": 1333, "buyback_price": 5, "publisher": "単行本", "saledate": "2000-10-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 世界９９
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020540345', '世界９９', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "村田沙耶香", "market_price": 2200, "buyback_price": 819, "publisher": "単行本", "saledate": "2025-03-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020540345'), '0020540345-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020540345'), '0020540345-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020540345'), '0020540345-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夜叉の都
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019766301', '夜叉の都', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊東潤", "market_price": 2000, "buyback_price": 5, "publisher": "単行本", "saledate": "2021-11-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019766301'), '0019766301-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019766301'), '0019766301-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 正欲
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019605275', '正欲', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "朝井リョウ", "market_price": 1900, "buyback_price": 91, "publisher": "単行本", "saledate": "2021-03-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019605275'), '0019605275-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019605275'), '0019605275-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019605275'), '0019605275-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: さみしい夜にはペンを持て
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020104612', 'さみしい夜にはペンを持て', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "古賀史健, ならの", "market_price": 1500, "buyback_price": 273, "publisher": "単行本", "saledate": "2023-07-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020104612'), '0020104612-U01', 1050, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020104612'), '0020104612-U02', 892, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020104612'), '0020104612-U03', 735, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＩＺＥ　プライズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020494765', 'ＰＲＩＺＥ　プライズ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "村山由佳", "market_price": 2000, "buyback_price": 682, "publisher": "単行本", "saledate": "2025-01-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020494765'), '0020494765-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020494765'), '0020494765-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020494765'), '0020494765-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ともぐい
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020190313', 'ともぐい', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "河﨑秋子", "market_price": 1750, "buyback_price": 91, "publisher": "単行本", "saledate": "2023-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020190313'), '0020190313-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020190313'), '0020190313-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020190313'), '0020190313-U03', 490, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: のぼうの城
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015703680', 'のぼうの城', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "和田竜, [{和田竜}]【著】", "market_price": 1500, "buyback_price": 5, "publisher": "単行本", "saledate": "2007-12-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015703680'), '0015703680-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夜明けのはざま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020172615', '夜明けのはざま', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "町田そのこ", "market_price": 1700, "buyback_price": 91, "publisher": "単行本", "saledate": "2023-11-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172615'), '0020172615-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172615'), '0020172615-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020172615'), '0020172615-U03', 455, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ノルウェイの森
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015272895', 'ノルウェイの森', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "村上春樹, [{村上春樹}]【著】", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "1987-09-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015272895'), '0015272895-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015272895'), '0015272895-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 食堂かたつむり
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015751518', '食堂かたつむり', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "小川糸, [{小川糸}]【著】", "market_price": 1300, "buyback_price": 5, "publisher": "単行本", "saledate": "2008-01-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: さらば！　店長がバカすぎて
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020655523', 'さらば！　店長がバカすぎて', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "早見和真", "market_price": 1600, "buyback_price": 273, "publisher": "単行本", "saledate": "2025-09-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020655523'), '0020655523-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020655523'), '0020655523-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020655523'), '0020655523-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: この気持ちもいつか忘れる　先行限定版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019514034', 'この気持ちもいつか忘れる　先行限定版', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "住野よる", "market_price": 1700, "buyback_price": 5, "publisher": "単行本", "saledate": "2020-09-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019514034'), '0019514034-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019514034'), '0019514034-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クロエとオオエ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020601156', 'クロエとオオエ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "有川ひろ", "market_price": 2000, "buyback_price": 273, "publisher": "単行本", "saledate": "2025-06-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601156'), '0020601156-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601156'), '0020601156-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601156'), '0020601156-U03', 665, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ペッパーズ・ゴースト
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019729958', 'ペッパーズ・ゴースト', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1700, "buyback_price": 5, "publisher": "単行本", "saledate": "2021-10-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019729958'), '0019729958-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019729958'), '0019729958-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夜明けのすべて
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019521095', '夜明けのすべて', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "瀬尾まいこ", "market_price": 1500, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-10-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019521095'), '0019521095-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 旅猫リポート
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016926277', '旅猫リポート', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "有川浩, [{有川浩}]【著】", "market_price": 1400, "buyback_price": 5, "publisher": "単行本", "saledate": "2012-11-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016926277'), '0016926277-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 秘密結社Ｌａｄｙｂｉｒｄと僕の６日間
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018800016', '秘密結社Ｌａｄｙｂｉｒｄと僕の６日間', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "喜多川泰", "market_price": 1400, "buyback_price": 182, "publisher": "単行本", "saledate": "2017-01-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018800016'), '0018800016-U01', 850, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018800016'), '0018800016-U02', 722, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 春の庭
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017195544', '春の庭', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "柴崎友香", "market_price": 1300, "buyback_price": 5, "publisher": "単行本", "saledate": "2014-07-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 母影
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019571693', '母影', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "尾崎世界観", "market_price": 1300, "buyback_price": 5, "publisher": "単行本", "saledate": "2021-01-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019571693'), '0019571693-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019571693'), '0019571693-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 龍の守る町
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020724220', '龍の守る町', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "砥上裕將", "market_price": 1800, "buyback_price": 91, "publisher": "単行本", "saledate": "2025-11-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020724220'), '0020724220-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020724220'), '0020724220-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: しんせかい
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018764557', 'しんせかい', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "山下澄人", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2016-10-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018764557'), '0018764557-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 九年前の祈り
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017268232', '九年前の祈り', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "小野正嗣", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2014-12-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017268232'), '0017268232-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新　青春の門　第九部
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019333259', '新　青春の門　第九部', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "五木寛之", "market_price": 1800, "buyback_price": 219, "publisher": "単行本", "saledate": "2019-09-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 人質の朗読会
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016514902', '人質の朗読会', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "小川洋子, [{小川洋子}]【著】", "market_price": 1400, "buyback_price": 28, "publisher": "単行本", "saledate": "2011-02-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016514902'), '0016514902-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 極楽征夷大将軍
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020059841', '極楽征夷大将軍', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "垣根涼介", "market_price": 2000, "buyback_price": 273, "publisher": "単行本", "saledate": "2023-05-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020059841'), '0020059841-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020059841'), '0020059841-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020059841'), '0020059841-U03', 665, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: わたしの知る花
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020360180', 'わたしの知る花', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "町田そのこ", "market_price": 1700, "buyback_price": 455, "publisher": "単行本", "saledate": "2024-07-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020360180'), '0020360180-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020360180'), '0020360180-U02', 1062, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020360180'), '0020360180-U03', 875, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ひまわり
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020445138', 'ひまわり', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "新川帆立", "market_price": 1900, "buyback_price": 637, "publisher": "単行本", "saledate": "2024-11-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020445138'), '0020445138-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020445138'), '0020445138-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020445138'), '0020445138-U03', 1050, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 共喰い
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016782667', '共喰い', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "田中慎弥, 田中慎弥", "market_price": 1000, "buyback_price": 10, "publisher": "単行本", "saledate": "2012-01-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016782667'), '0016782667-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016782667'), '0016782667-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: サムライ漂海記
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020663515', 'サムライ漂海記', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "天野純希", "market_price": 2000, "buyback_price": 91, "publisher": "単行本", "saledate": "2025-08-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020663515'), '0020663515-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020663515'), '0020663515-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クジラアタマの王様
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019264960', 'クジラアタマの王様', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1500, "buyback_price": 5, "publisher": "単行本", "saledate": "2019-07-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019264960'), '0019264960-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 木曜日の子ども
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019198043', '木曜日の子ども', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "重松清", "market_price": 1700, "buyback_price": 5, "publisher": "単行本", "saledate": "2019-01-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019198043'), '0019198043-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019198043'), '0019198043-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 潮音
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020504270', '潮音', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "宮本輝", "market_price": 2200, "buyback_price": 455, "publisher": "単行本", "saledate": "2025-01-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020504270'), '0020504270-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020504270'), '0020504270-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020504270'), '0020504270-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ゾンビがいた季節
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020570455', 'ゾンビがいた季節', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "須藤古都離", "market_price": 1950, "buyback_price": 19, "publisher": "単行本", "saledate": "2025-04-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020570455'), '0020570455-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020570455'), '0020570455-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 墓じまいラプソディ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020198435', '墓じまいラプソディ', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "垣谷美雨", "market_price": 1600, "buyback_price": 182, "publisher": "単行本", "saledate": "2023-12-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198435'), '0020198435-U01', 950, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198435'), '0020198435-U02', 808, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020198435'), '0020198435-U03', 665, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 国宝　愛蔵版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020649065', '国宝　愛蔵版', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "吉田修一", "market_price": 2500, "buyback_price": 591, "publisher": "単行本", "saledate": "2025-09-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: バイバイ、ブラックバード
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016399994', 'バイバイ、ブラックバード', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎, [{伊坂幸太郎}]【著】", "market_price": 1400, "buyback_price": 5, "publisher": "単行本", "saledate": "2010-07-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016399994'), '0016399994-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 戀童夢幻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019532447', '戀童夢幻', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "木下昌輝", "market_price": 1900, "buyback_price": 5, "publisher": "単行本", "saledate": "2020-10-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 彼女が好きなものはホモであって僕ではない
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019015566', '彼女が好きなものはホモであって僕ではない', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "浅原ナオト", "market_price": 1200, "buyback_price": 5, "publisher": "単行本", "saledate": "2018-02-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: サブマリン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018647923', 'サブマリン', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "伊坂幸太郎", "market_price": 1500, "buyback_price": 5, "publisher": "単行本", "saledate": "2016-03-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018647923'), '0018647923-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 虫たちの家
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018687094', '虫たちの家', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "原田ひ香", "market_price": 1500, "buyback_price": 364, "publisher": "単行本", "saledate": "2016-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 乙女の密告
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016415871', '乙女の密告', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "赤染晶子", "market_price": 1200, "buyback_price": 28, "publisher": "単行本", "saledate": "2010-07-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016415871'), '0016415871-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016415871'), '0016415871-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チア男子！！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016445077', 'チア男子！！', (SELECT id FROM categories WHERE slug = 'books-novels'), '{"author": "朝井リョウ", "market_price": 1500, "buyback_price": 91, "publisher": "単行本", "saledate": "2010-10-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;


-- ==========================================
-- Seed Book Off IT & Computers books
-- ==========================================

-- Insert product catalog: Ｇｏｏｄ　Ｃｏｄｅ，Ｂａｄ　Ｃｏｄｅ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019947069', 'Ｇｏｏｄ　Ｃｏｄｅ，Ｂａｄ　Ｃｏｄｅ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "Ｔｏｍ　Ｌｏｎｇ, 秋勇紀, 高田新山, 山本大祐", "market_price": 3600, "buyback_price": 1091, "publisher": "単行本", "saledate": "2023-01-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019947069'), '0019947069-U01', 3200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スッキリわかる　Ｐｙｔｈｏｎ入門　第２版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020178893', 'スッキリわかる　Ｐｙｔｈｏｎ入門　第２版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "国本大悟, 須藤秋良, フレアリンク", "market_price": 2500, "buyback_price": 637, "publisher": "単行本", "saledate": "2023-11-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178893'), '0020178893-U01', 2050, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178893'), '0020178893-U02', 1742, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178893'), '0020178893-U03', 1435, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マスタリングＡＰＩアーキテクチャ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020424945', 'マスタリングＡＰＩアーキテクチャ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "Ｊａｍｅｓ　Ｇｏｕｇｈ, Ｄａｎｉｅｌ　Ｂｒｙａｎｔ, Ｍａｔｔｈｅｗ　Ａｕｂｕｒｎ, 石川朝久", "market_price": 3400, "buyback_price": 546, "publisher": "単行本", "saledate": "2024-10-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ｗｅｂ　ＡＰＩの設計
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019510282', 'Ｗｅｂ　ＡＰＩの設計', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "アルノー・ロレ, クイープ", "market_price": 3800, "buyback_price": 182, "publisher": "単行本", "saledate": "2020-08-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: まんがでわかるＬｉｎｕｘ　シス管系女子
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017299182', 'まんがでわかるＬｉｎｕｘ　シス管系女子', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "Ｐｉｒｏ, 日経Ｌｉｎｕｘ", "market_price": 1600, "buyback_price": 10, "publisher": "単行本", "saledate": "2015-02-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017299182'), '0017299182-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スッキリわかるＰｙｔｈｏｎ入門
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019259915', 'スッキリわかるＰｙｔｈｏｎ入門', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "フレアリンク, 国本大悟, 須藤秋良", "market_price": 2400, "buyback_price": 10, "publisher": "単行本", "saledate": "2019-06-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019259915'), '0019259915-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019259915'), '0019259915-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019259915'), '0019259915-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＩに負けない子どもを育てる
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019305367', 'ＡＩに負けない子どもを育てる', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "新井紀子", "market_price": 1600, "buyback_price": 46, "publisher": "単行本", "saledate": "2019-09-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019305367'), '0019305367-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019305367'), '0019305367-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 体系的に学ぶ安全なＷｅｂアプリケーションの作り方
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016514660', '体系的に学ぶ安全なＷｅｂアプリケーションの作り方', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "徳丸浩, [{徳丸浩}]【著】", "market_price": 3200, "buyback_price": 10, "publisher": "単行本", "saledate": "2011-03-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016514660'), '0016514660-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016514660'), '0016514660-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｐｙｔｈｏｎ　１年生
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018994860', 'Ｐｙｔｈｏｎ　１年生', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "森巧尚", "market_price": 1980, "buyback_price": 10, "publisher": "単行本", "saledate": "2017-12-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018994860'), '0018994860-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018994860'), '0018994860-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018994860'), '0018994860-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ　Ｗｏｒｄ３６５　対策テキスト＆問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020344932', 'ＭＯＳ　Ｗｏｒｄ３６５　対策テキスト＆問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "富士通ラーニングメディア", "market_price": 2100, "buyback_price": 110, "publisher": "単行本", "saledate": "2024-01-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020344932'), '0020344932-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暗号技術のすべて
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018916471', '暗号技術のすべて', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ＩＰＵＳＩＲＯＮ", "market_price": 3500, "buyback_price": 273, "publisher": "単行本", "saledate": "2017-08-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018916471'), '0018916471-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018916471'), '0018916471-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マスタリングＴＣＰ／ＩＰ　入門編　第６版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019365485', 'マスタリングＴＣＰ／ＩＰ　入門編　第６版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "井上直也, 村山公保, 竹下隆史, 荒井透, 苅田幸雄", "market_price": 2200, "buyback_price": 364, "publisher": "単行本", "saledate": "2019-12-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019365485'), '0019365485-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019365485'), '0019365485-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019365485'), '0019365485-U03', 1050, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ　Ｗｏｒｄ　３６５＆２０１９　Ｅｘｐｅｒｔ対策テキスト＆問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019616977', 'ＭＯＳ　Ｗｏｒｄ　３６５＆２０１９　Ｅｘｐｅｒｔ対策テキスト＆問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "富士通エフ・オー・エム", "market_price": 3100, "buyback_price": 46, "publisher": "単行本", "saledate": "2021-03-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019616977'), '0019616977-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019616977'), '0019616977-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019616977'), '0019616977-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ　ＰｏｗｅｒＰｏｉｎｔ　３６５＆２０１９　対策テキスト＆問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019561538', 'ＭＯＳ　ＰｏｗｅｒＰｏｉｎｔ　３６５＆２０１９　対策テキスト＆問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "富士通エフ・オー・エム", "market_price": 2300, "buyback_price": 10, "publisher": "単行本", "saledate": "2020-12-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019561538'), '0019561538-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019561538'), '0019561538-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019561538'), '0019561538-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ　Ｅｘｃｅｌ　３６５　Ｅｘｐｅｒｔ　対策テキスト＆問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020342440', 'ＭＯＳ　Ｅｘｃｅｌ　３６５　Ｅｘｐｅｒｔ　対策テキスト＆問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "富士通ラーニングメディア", "market_price": 3100, "buyback_price": 637, "publisher": "単行本", "saledate": "2024-06-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ｐｙｔｈｏｎではじめる機械学習
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018877106', 'Ｐｙｔｈｏｎではじめる機械学習', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "アンドレアス・Ｃ．ミュラー, サラ・グイド, 中田秀基", "market_price": 3400, "buyback_price": 19, "publisher": "単行本", "saledate": "2017-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018877106'), '0018877106-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018877106'), '0018877106-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018877106'), '0018877106-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マスタリングＴＣＰ／ＩＰ　入門編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016797565', 'マスタリングＴＣＰ／ＩＰ　入門編', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "村山公保, 竹下隆史, 村山公保, 荒井透, 苅田幸雄, [{竹下隆史}]，[{村山公保}]，[{荒井透}]，[{苅田幸雄}]【共著】", "market_price": 2200, "buyback_price": 5, "publisher": "単行本", "saledate": "2012-02-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 人工知能は人間を超えるか
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017307640', '人工知能は人間を超えるか', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "松尾豊", "market_price": 1400, "buyback_price": 5, "publisher": "単行本", "saledate": "2015-03-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ネットワークはなぜつながるのか　第２版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015511036', 'ネットワークはなぜつながるのか　第２版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "戸根勤, 日経ＮＥＴＷＯＲＫ", "market_price": 2700, "buyback_price": 546, "publisher": "単行本", "saledate": "2007-04-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015511036'), '0015511036-U01', 1650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015511036'), '0015511036-U02', 1402, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 独習Ｐｙｔｈｏｎ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019485787', '独習Ｐｙｔｈｏｎ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "山田祥寛", "market_price": 3000, "buyback_price": 46, "publisher": "単行本", "saledate": "2020-06-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485787'), '0019485787-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485787'), '0019485787-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485787'), '0019485787-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＩのしくみと活用がこれ１冊でしっかりわかる教科書
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019938967', 'ＡＩのしくみと活用がこれ１冊でしっかりわかる教科書', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "高橋海渡, 立川裕之, 小西功記, 小林寛子, 石井大輔", "market_price": 2000, "buyback_price": 328, "publisher": "単行本", "saledate": "2023-01-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019938967'), '0019938967-U01', 1400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 努力革命
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020319203', '努力革命', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "伊藤羊一, 尾原和啓", "market_price": 1500, "buyback_price": 28, "publisher": "単行本", "saledate": "2024-05-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020319203'), '0020319203-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: リーダブルコード
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016863629', 'リーダブルコード', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ダスティン・ボズウェル, トレバー・フォシェ, 角征典, ダスティンボズウェル, トレバーフォシェ, 角征典, [{ダスティンボズウェル}]，[{トレバーフォシェ}]【著】，[{角征典}]【訳】", "market_price": 2400, "buyback_price": 546, "publisher": "単行本", "saledate": "2012-06-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016863629'), '0016863629-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016863629'), '0016863629-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016863629'), '0016863629-U03', 1050, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ３分間ネットワーク基礎講座
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016437247', '３分間ネットワーク基礎講座', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "網野衛二, [{網野衛二}]【著】", "market_price": 1780, "buyback_price": 37, "publisher": "単行本", "saledate": "2010-09-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016437247'), '0016437247-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016437247'), '0016437247-U02', 595, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プロになるためのＷｅｂ技術入門　改訂新版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020471085', 'プロになるためのＷｅｂ技術入門　改訂新版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "小森裕介", "market_price": 3600, "buyback_price": 1091, "publisher": "単行本", "saledate": "2024-11-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020471085'), '0020471085-U01', 3200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020471085'), '0020471085-U02', 2720, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 大規模言語モデルは新たな知能か
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020086184', '大規模言語モデルは新たな知能か', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "岡野原大輔", "market_price": 1400, "buyback_price": 55, "publisher": "単行本", "saledate": "2023-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020086184'), '0020086184-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020086184'), '0020086184-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ３分間ＨＴＴＰ＆メールプロトコル基礎講座
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016286976', '３分間ＨＴＴＰ＆メールプロトコル基礎講座', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "網野衛二, [{網野衛二}]【著】", "market_price": 2280, "buyback_price": 46, "publisher": "単行本", "saledate": "2010-01-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 体験しながら学ぶネットワーク技術入門
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020228397', '体験しながら学ぶネットワーク技術入門', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "みやたひろし", "market_price": 3200, "buyback_price": 637, "publisher": "単行本", "saledate": "2024-01-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020228397'), '0020228397-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020228397'), '0020228397-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マイクロサービスアーキテクチャ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018618909', 'マイクロサービスアーキテクチャ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "サム・ニューマン, 佐藤直生, 木下哲也", "market_price": 3400, "buyback_price": 5, "publisher": "単行本", "saledate": "2016-02-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018618909'), '0018618909-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018618909'), '0018618909-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スッキリわかるＰｙｔｈｏｎによる機械学習入門
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019531894', 'スッキリわかるＰｙｔｈｏｎによる機械学習入門', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "フレアリンク, 須藤秋良", "market_price": 3000, "buyback_price": 10, "publisher": "単行本", "saledate": "2020-10-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019531894'), '0019531894-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019531894'), '0019531894-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: パケットキャプチャの教科書
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018971587', 'パケットキャプチャの教科書', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "みやたひろし", "market_price": 3300, "buyback_price": 64, "publisher": "単行本", "saledate": "2017-10-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 図解まるわかり　クラウドのしくみ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019513691', '図解まるわかり　クラウドのしくみ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "西村泰洋", "market_price": 1680, "buyback_price": 19, "publisher": "単行本", "saledate": "2020-09-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019513691'), '0019513691-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: この１冊で合格！西尾パソコン教室のＭＯＳ　Ｗｏｒｄ３６５　テキスト＆問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020658016', 'この１冊で合格！西尾パソコン教室のＭＯＳ　Ｗｏｒｄ３６５　テキスト＆問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "黒野克典", "market_price": 2200, "buyback_price": 364, "publisher": "単行本", "saledate": "2025-08-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 達人に学ぶＤＢ設計徹底指南書　第２版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020384376', '達人に学ぶＤＢ設計徹底指南書　第２版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ミック", "market_price": 2800, "buyback_price": 773, "publisher": "単行本", "saledate": "2024-08-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020384376'), '0020384376-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020384376'), '0020384376-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ビジネスパーソンのためのＣｈａｔＧＰＴ活用大全
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020192948', 'ビジネスパーソンのためのＣｈａｔＧＰＴ活用大全', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "國本知里", "market_price": 1800, "buyback_price": 5, "publisher": "単行本", "saledate": "2023-11-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020192948'), '0020192948-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ７日間でハッキングをはじめる本　ＴｒｙＨａｃｋＭｅを使って身体で覚える攻撃手法と脆弱性
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020384379', '７日間でハッキングをはじめる本　ＴｒｙＨａｃｋＭｅを使って身体で覚える攻撃手法と脆弱性', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "野溝のみぞう", "market_price": 2600, "buyback_price": 637, "publisher": "単行本", "saledate": "2024-08-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020384379'), '0020384379-U01', 2250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020384379'), '0020384379-U02', 1912, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＩ技術の最前線　これからのＡＩを読み解く先端技術７３
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019876313', 'ＡＩ技術の最前線　これからのＡＩを読み解く先端技術７３', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "岡野原大輔", "market_price": 3500, "buyback_price": 46, "publisher": "単行本", "saledate": "2022-08-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: １冊ですべて身につくＪａｖａＳｃｒｉｐｔ入門講座
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020043991', '１冊ですべて身につくＪａｖａＳｃｒｉｐｔ入門講座', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "Ｍａｎａ", "market_price": 2540, "buyback_price": 182, "publisher": "単行本", "saledate": "2023-03-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020043991'), '0020043991-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020043991'), '0020043991-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020043991'), '0020043991-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 図解でスッキリ　クラウドのきほんとしくみ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020685951', '図解でスッキリ　クラウドのきほんとしくみ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "大澤文孝", "market_price": 1700, "buyback_price": 73, "publisher": "単行本", "saledate": "2025-09-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ｅｘｅｒｃｉｓｅ　Ｐｙｔｈｏｎ　プログラマ脳を鍛える至高の問題集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020704444', 'Ｅｘｅｒｃｉｓｅ　Ｐｙｔｈｏｎ　プログラマ脳を鍛える至高の問題集', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "Ｍｉｋｉ　Ｔｅｂｅｋａ, 株式会社クイープ", "market_price": 2280, "buyback_price": 364, "publisher": "単行本", "saledate": "2025-10-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020704444'), '0020704444-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＩＴインフラのしくみと技術がこれ１冊でしっかりわかる教科書
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020447420', 'ＩＴインフラのしくみと技術がこれ１冊でしっかりわかる教科書', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "鶴長鎮一, 山本尚明, 山根武信, 北崎恵凡", "market_price": 2200, "buyback_price": 328, "publisher": "単行本", "saledate": "2024-11-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020447420'), '0020447420-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＴＭＬ＆ＣＳＳ　Ｗｅｂデザイン　現場レベルのコーディング・スキルが身につく実践入門
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020498456', 'ＨＴＭＬ＆ＣＳＳ　Ｗｅｂデザイン　現場レベルのコーディング・スキルが身につく実践入門', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "小豆沢健", "market_price": 3200, "buyback_price": 682, "publisher": "単行本", "saledate": "2025-01-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020498456'), '0020498456-U01', 2850, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020498456'), '0020498456-U02', 2422, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ攻略問題集Ｅｘｃｅｌ３６５エキスパート
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020366636', 'ＭＯＳ攻略問題集Ｅｘｃｅｌ３６５エキスパート', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "土岐順子", "market_price": 3000, "buyback_price": 146, "publisher": "単行本", "saledate": "2024-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: コンピュータの構成と設計　第５版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017266090', 'コンピュータの構成と設計　第５版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "デーヴィド・Ａ．パターソン, ジョン・Ｌ．ヘネシ, 成田光彰", "market_price": 4200, "buyback_price": 46, "publisher": "単行本", "saledate": "2014-12-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017266090'), '0017266090-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017266090'), '0017266090-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＩＴインフラの基礎知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019011617', 'ＩＴインフラの基礎知識', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "中村親里, 川畑裕行, 黒崎優太, 小林巧, 伊勢幸一", "market_price": 1980, "buyback_price": 5, "publisher": "単行本", "saledate": "2018-02-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019011617'), '0019011617-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 創るためのＡＩ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019581948', '創るためのＡＩ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "徳井直生", "market_price": 2600, "buyback_price": 273, "publisher": "単行本", "saledate": "2021-01-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019581948'), '0019581948-U01', 1500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019581948'), '0019581948-U02', 1275, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: キタミ式イラストＩＴ塾　基本情報技術者
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019926365', 'キタミ式イラストＩＴ塾　基本情報技術者', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "きたみりゅうじ", "market_price": 2100, "buyback_price": 19, "publisher": "単行本", "saledate": "2022-12-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019926365'), '0019926365-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019926365'), '0019926365-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新人エンジニアのためのインフラ入門
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019025572', '新人エンジニアのためのインフラ入門', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ＢＦＴ", "market_price": 1800, "buyback_price": 55, "publisher": "単行本", "saledate": "2018-03-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019025572'), '0019025572-U01', 700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｈａｃｋｉｎｇ：美しき策謀
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016727189', 'Ｈａｃｋｉｎｇ：美しき策謀', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ＪｏｎＥｒｉｃｋｓｏｎ, 村上雅章, ジョンエリクソン, 村上雅章", "market_price": 4200, "buyback_price": 137, "publisher": "単行本", "saledate": "2011-10-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016727189'), '0016727189-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016727189'), '0016727189-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＯＳ対策テキスト　Ｅｘｃｅｌ３６５
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019946124', 'ＭＯＳ対策テキスト　Ｅｘｃｅｌ３６５', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "土岐順子", "market_price": 1400, "buyback_price": 19, "publisher": "単行本", "saledate": "2023-01-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: プログラミングコンテスト攻略のためのアルゴリズムとデータ構造
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017291624', 'プログラミングコンテスト攻略のためのアルゴリズムとデータ構造', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "渡部有隆, 秋葉拓哉", "market_price": 3580, "buyback_price": 46, "publisher": "単行本", "saledate": "2015-01-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017291624'), '0017291624-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017291624'), '0017291624-U02', 1062, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017291624'), '0017291624-U03', 875, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スクラム実践者が知るべき９７のこと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019613979', 'スクラム実践者が知るべき９７のこと', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ギュンター・ヴァーヘイエン, 吉羽龍太郎, 原田騎郎, 永瀬美穂", "market_price": 2400, "buyback_price": 10, "publisher": "単行本", "saledate": "2021-03-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019613979'), '0019613979-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019613979'), '0019613979-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: できるＣｈａｔＧＰＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020108522', 'できるＣｈａｔＧＰＴ', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "清水理史, できるシリーズ編集部, 越塚登", "market_price": 1600, "buyback_price": 10, "publisher": "単行本", "saledate": "2023-07-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020108522'), '0020108522-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ｎｏｔｅではじめる新しいアウトプットの教室
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019306311', 'ｎｏｔｅではじめる新しいアウトプットの教室', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "コグレマサト, まつゆう＊", "market_price": 1600, "buyback_price": 5, "publisher": "単行本", "saledate": "2019-08-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019306311'), '0019306311-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マイクロインタラクション
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017129974', 'マイクロインタラクション', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ダン・サファー, 武舎広幸, 武舎るみ, ダンサファー, 武舎広幸, 武舎るみ", "market_price": 2400, "buyback_price": 137, "publisher": "単行本", "saledate": "2014-03-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017129974'), '0017129974-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 初めてのＧｏ言語　第２版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020656884', '初めてのＧｏ言語　第２版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "ジョン・ボドナー, 武舎広幸", "market_price": 4500, "buyback_price": 637, "publisher": "単行本", "saledate": "2025-08-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: フィジカルＡＩの衝撃
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020886262', 'フィジカルＡＩの衝撃', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "田中道昭", "market_price": 1800, "buyback_price": 546, "publisher": "単行本", "saledate": "2026-05-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＡＩを使って考えるための全技術
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020611500', 'ＡＩを使って考えるための全技術', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "石井力重, 加藤昌治", "market_price": 2700, "buyback_price": 910, "publisher": "単行本", "saledate": "2025-06-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020611500'), '0020611500-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020611500'), '0020611500-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020611500'), '0020611500-U03', 1750, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020611500'), '0020611500-N01', 2700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スッキリわかるＪａｖａ入門　第４版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020178892', 'スッキリわかるＪａｖａ入門　第４版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "中山清喬, 国本大悟, フレアリンク", "market_price": 2700, "buyback_price": 546, "publisher": "単行本", "saledate": "2023-11-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178892'), '0020178892-U01', 1650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178892'), '0020178892-U02', 1402, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020178892'), '0020178892-U03', 1155, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 絵で見てわかるＩＴインフラの仕組み　新装版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019261974', '絵で見てわかるＩＴインフラの仕組み　新装版', (SELECT id FROM categories WHERE slug = 'books-it-computers'), '{"author": "山崎泰史, 三縄慶子, 畔勝洋平, 佐藤貴彦, 小田圭二", "market_price": 2380, "buyback_price": 119, "publisher": "単行本", "saledate": "2019-06-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019261974'), '0019261974-U01', 1250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;


-- ==========================================
-- Seed Book Off Magazines
-- ==========================================

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020507284', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 891, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-01-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020507284'), '0020507284-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020445638', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-11-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020445638'), '0020445638-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020522979', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-02-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020522979'), '0020522979-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020817405', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1100, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-03-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020817405'), '0020817405-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020690310', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1200, "buyback_price": 19, "publisher": "雑誌", "saledate": "2025-09-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020690310'), '0020690310-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020690310'), '0020690310-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020601278', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1000, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-05-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601278'), '0020601278-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020601278'), '0020601278-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019330393', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 907, "buyback_price": 5, "publisher": "雑誌", "saledate": "2019-09-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020739588', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-11-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739588'), '0020739588-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739588'), '0020739588-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020654201', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1000, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020654201'), '0020654201-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020654201'), '0020654201-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020575283', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 19, "publisher": "雑誌", "saledate": "2025-04-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020575283'), '0020575283-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 文藝春秋
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020786274', '文藝春秋', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "文藝春秋", "market_price": 1500, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-02-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020786274'), '0020786274-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020816466', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 900, "buyback_price": 5, "publisher": "雑誌", "saledate": "2026-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020806722', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2026-03-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019114563', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1556, "buyback_price": 19, "publisher": "雑誌", "saledate": "2018-08-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020307956', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 764, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-05-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020307956'), '0020307956-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020322802', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1000, "buyback_price": 10, "publisher": "雑誌", "saledate": "2024-05-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020322802'), '0020322802-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020322802'), '0020322802-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020798902', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-02-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020798902'), '0020798902-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020798902'), '0020798902-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019522794', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 907, "buyback_price": 5, "publisher": "雑誌", "saledate": "2020-09-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020435683', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-10-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020435683'), '0020435683-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020435683'), '0020435683-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 文藝春秋
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020568352', '文藝春秋', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "文藝春秋", "market_price": 1091, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-04-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020568352'), '0020568352-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020758549', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 46, "publisher": "雑誌", "saledate": "2025-12-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020785066', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 10, "publisher": "雑誌", "saledate": "2026-02-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020765890', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2026-01-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020362787', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-07-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020708407', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 891, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-10-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020708407'), '0020708407-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020708407'), '0020708407-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020848181', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 10, "publisher": "雑誌", "saledate": "2026-05-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020773146', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 891, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-01-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020773146'), '0020773146-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020372667', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-08-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020281080', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1000, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-03-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020745198', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-12-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020839482', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 864, "buyback_price": 10, "publisher": "雑誌", "saledate": "2026-04-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020161611', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 709, "buyback_price": 5, "publisher": "雑誌", "saledate": "2023-10-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019327756', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1564, "buyback_price": 10, "publisher": "雑誌", "saledate": "2019-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020892103', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1200, "buyback_price": 46, "publisher": "雑誌", "saledate": "2026-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: チルチンびと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020748775', 'チルチンびと', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "風土社", "market_price": 1100, "buyback_price": 19, "publisher": "雑誌", "saledate": "2025-12-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: チルチンびと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020612290', 'チルチンびと', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "風土社", "market_price": 1100, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-06-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020201882', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 709, "buyback_price": 5, "publisher": "雑誌", "saledate": "2023-12-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020177772', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 764, "buyback_price": 5, "publisher": "雑誌", "saledate": "2023-10-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020177772'), '0020177772-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｈａｒｖａｒｄ　Ｂｕｓｉｎｅｓｓ　Ｒｅｖｉｅｗ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020355361', 'Ｈａｒｖａｒｄ　Ｂｕｓｉｎｅｓｓ　Ｒｅｖｉｅｗ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 2182, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-07-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020355361'), '0020355361-U01', 90, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020355361'), '0020355361-U02', 76, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新電気
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020518466', '新電気', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "オーム社", "market_price": 1700, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-01-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020688039', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 900, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688039'), '0020688039-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 週刊　東洋経済
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020723664', '週刊　東洋経済', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "東洋経済新報社", "market_price": 864, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-11-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 月刊Ｈａｎａｄａ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020892701', '月刊Ｈａｎａｄａ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "飛鳥新社", "market_price": 1182, "buyback_price": 46, "publisher": "雑誌", "saledate": "2026-05-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020355386', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-07-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020648435', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 91, "publisher": "雑誌", "saledate": "2025-07-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020337854', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 273, "publisher": "雑誌", "saledate": "2024-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020744487', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 800, "buyback_price": 10, "publisher": "雑誌", "saledate": "2025-12-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020365758', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 1000, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020365758'), '0020365758-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019131199', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 857, "buyback_price": 5, "publisher": "雑誌", "saledate": "2017-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019131199'), '0019131199-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020804835', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 800, "buyback_price": 5, "publisher": "雑誌", "saledate": "2026-03-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020678290', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 800, "buyback_price": 19, "publisher": "雑誌", "saledate": "2025-09-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020275393', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 364, "publisher": "雑誌", "saledate": "2024-03-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020889449', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 900, "buyback_price": 10, "publisher": "雑誌", "saledate": "2026-05-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019766968', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1564, "buyback_price": 273, "publisher": "雑誌", "saledate": "2021-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020898993', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 800, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-06-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 週刊　東洋経済
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020355384', '週刊　東洋経済', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "東洋経済新報社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-07-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020355384'), '0020355384-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020554333', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 900, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019377389', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1564, "buyback_price": 137, "publisher": "雑誌", "saledate": "2019-12-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019377389'), '0019377389-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020709124', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 864, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-10-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020709124'), '0020709124-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＥＲＡ　ｗｉｔｈ　Ｋｉｄｓ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020899000', 'ＡＥＲＡ　ｗｉｔｈ　Ｋｉｄｓ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "朝日新聞出版", "market_price": 1000, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-06-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019249908', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 907, "buyback_price": 5, "publisher": "雑誌", "saledate": "2019-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019249908'), '0019249908-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020487533', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 364, "publisher": "雑誌", "saledate": "2024-12-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 商店建築
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020671570', '商店建築', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "商店建築社", "market_price": 2500, "buyback_price": 91, "publisher": "雑誌", "saledate": "2025-08-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019055247', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 743, "buyback_price": 46, "publisher": "雑誌", "saledate": "2016-12-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020489201', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-12-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020489201'), '0020489201-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 文藝春秋
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020905350', '文藝春秋', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "文藝春秋", "market_price": 1136, "buyback_price": 46, "publisher": "雑誌", "saledate": "2026-06-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019472118', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 907, "buyback_price": 5, "publisher": "雑誌", "saledate": "2020-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020136106', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 709, "buyback_price": 5, "publisher": "雑誌", "saledate": "2023-09-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 新建築
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020494496', '新建築', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "新建築社", "market_price": 2600, "buyback_price": 46, "publisher": "雑誌", "saledate": "2024-12-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020494496'), '0020494496-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 週刊　東洋経済
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020671549', '週刊　東洋経済', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "東洋経済新報社", "market_price": 864, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＥＬＬＥ　ＤＥＣＯＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020543517', 'ＥＬＬＥ　ＤＥＣＯＲ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "講談社", "market_price": 1500, "buyback_price": 19, "publisher": "雑誌", "saledate": "2025-03-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020457620', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 91, "publisher": "雑誌", "saledate": "2024-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: チルチンびと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019177050', 'チルチンびと', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "風土社", "market_price": 917, "buyback_price": 5, "publisher": "雑誌", "saledate": "2018-12-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019177050'), '0019177050-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 建築知識
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019870581', '建築知識', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "エクスナレッジ", "market_price": 1800, "buyback_price": 455, "publisher": "雑誌", "saledate": "2022-07-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うかたま
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019055252', 'うかたま', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "農山漁村文化協会", "market_price": 743, "buyback_price": 19, "publisher": "雑誌", "saledate": "2018-03-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020393511', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 5, "publisher": "雑誌", "saledate": "2024-09-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020393511'), '0020393511-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 暮しの手帖
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019845488', '暮しの手帖', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "暮しの手帖社", "market_price": 907, "buyback_price": 5, "publisher": "雑誌", "saledate": "2022-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019845488'), '0019845488-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チルチンびと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020905357', 'チルチンびと', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "風土社", "market_price": 1100, "buyback_price": 46, "publisher": "雑誌", "saledate": "2026-06-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905357'), '0020905357-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＰＲＥＳＩＤＥＮＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020816505', 'ＰＲＥＳＩＤＥＮＴ', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "プレジデント社", "market_price": 836, "buyback_price": 19, "publisher": "雑誌", "saledate": "2026-03-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816505'), '0020816505-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダイヤモンドＺＡｉ（ザイ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020575285', 'ダイヤモンドＺＡｉ（ザイ）', (SELECT id FROM categories WHERE slug = 'books-magazines'), '{"author": "ダイヤモンド社", "market_price": 864, "buyback_price": 5, "publisher": "雑誌", "saledate": "2025-04-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020575285'), '0020575285-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
