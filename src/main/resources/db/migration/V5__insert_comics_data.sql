-- ==========================================
-- Flyway Migration: Seed Manga into MonoMarket
-- ==========================================

-- ==========================================
-- Seed Shonen Manga (manga-shonen)
-- ==========================================

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020428416', 'ＯＮＥ　ＰＩＥＣＥ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 520, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2024-11-01", "volume": "巻百十", "volume_no": 110, "group_name": "【コミック】ＯＮＥ　ＰＩＥＣＥ（ワンピース）（１～１１４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-U03', 175, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N02', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N03', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N04', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N05', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N06', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N07', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N08', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N09', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N10', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020428416'), '0020428416-N11', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＵＮＴＥＲ×ＨＵＮＴＥＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020379916', 'ＨＵＮＴＥＲ×ＨＵＮＴＥＲ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "冨樫義博", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2024-09-04", "volume": "３８", "volume_no": 38, "group_name": "【コミック】ＨＵＮＴＥＲ×ＨＵＮＴＥＲ（ハンターハンター）（１～３８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020379916'), '0020379916-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 進撃の巨人
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019632868', '進撃の巨人', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "諫山創", "market_price": 620, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2021-06-09", "volume": "３４", "volume_no": 34, "group_name": "【コミック】進撃の巨人（全３４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019632868'), '0019632868-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019632868'), '0019632868-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019632868'), '0019632868-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016501118', 'ＯＮＥ　ＰＩＥＣＥ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2011-02-04", "volume": "巻六十一", "volume_no": 61, "group_name": "【コミック】ＯＮＥ　ＰＩＥＣＥ（１～７０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016501118'), '0016501118-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016501118'), '0016501118-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016501118'), '0016501118-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ワンパンマン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016930503', 'ワンパンマン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "村田雄介", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2012-12-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】ワンパンマン（１～３６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016930503'), '0016930503-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016930503'), '0016930503-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016930503'), '0016930503-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ルリドラゴン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019899976', 'ルリドラゴン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "眞藤雅興", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2022-10-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】ルリドラゴン（１～５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019899976'), '0019899976-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019899976'), '0019899976-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019899976'), '0019899976-U03', 175, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＢＬＥＡＣＨ－ブリーチ－
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011410479', 'ＢＬＥＡＣＨ－ブリーチ－', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "久保帯人", "market_price": 520, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2002-01-05", "volume": "１", "volume_no": 1, "group_name": "【コミック】ＢＬＥＡＣＨ－ブリーチ－（全７４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＳＬＡＭ　ＤＵＮＫ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011411851', 'ＳＬＡＭ　ＤＵＮＫ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "井上雄彦", "market_price": 390, "buyback_price": 46, "publisher": "少年コミック", "saledate": "1991-02-08", "volume": "１", "volume_no": 1, "group_name": "【コミック】スラムダンク（全３１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011411851'), '0011411851-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011411851'), '0011411851-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011411851'), '0011411851-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＷＡＮＴＥＤ！尾田栄一郎短編集
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011403970', 'ＷＡＮＴＥＤ！尾田栄一郎短編集', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 440, "buyback_price": 46, "publisher": "少年コミック", "saledate": "1998-11-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011403970'), '0011403970-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: いちご１００％
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011404037', 'いちご１００％', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "河下水希", "market_price": 390, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2002-08-02", "volume": "１", "volume_no": 1, "group_name": "【コミック】いちご１００％（全１９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011404037'), '0011404037-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】劇場版　鬼滅の刃　無限城編　第一章　猗窩座再来　ノベライズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020645155', '【小説】劇場版　鬼滅の刃　無限城編　第一章　猗窩座再来　ノベライズ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 吾峠呼世晴, 近藤光（ｕｆｏｔａｂｌｅ）", "market_price": 780, "buyback_price": 19, "publisher": "少年コミック", "saledate": "2025-07-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020645155'), '0020645155-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【新装】ＤＲＡＧＯＮ　ＢＡＬＬ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016174317', '【新装】ＤＲＡＧＯＮ　ＢＡＬＬ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "鳥山明", "market_price": 440, "buyback_price": 137, "publisher": "少年コミック", "saledate": "1990-04-10", "volume": "２１", "volume_no": 21, "group_name": "【コミック】【新装】ＤＲＡＧＯＮ　ＢＡＬＬ（ドラゴンボール）（全４２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016174317'), '0016174317-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016174317'), '0016174317-N01', 440, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シャーマンキング
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417326', 'シャーマンキング', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "武井宏之", "market_price": 390, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2004-04-30", "volume": "２９", "volume_no": 29, "group_name": "【コミック】シャーマンキング（全３２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417326'), '0011417326-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417326'), '0011417326-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＳＴＯＮＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019767811', 'Ｄｒ．ＳＴＯＮＥ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "Ｂｏｉｃｈｉ, 稲垣理一郎", "market_price": 440, "buyback_price": 164, "publisher": "少年コミック", "saledate": "2022-01-04", "volume": "２４", "volume_no": 24, "group_name": "【コミック】Ｄｒ．ＳＴＯＮＥ（全２７巻）＋外伝"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019767811'), '0019767811-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラえもん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011425273', 'ドラえもん', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "藤子・Ｆ・不二雄", "market_price": 540, "buyback_price": 91, "publisher": "少年コミック", "saledate": "1996-04-26", "volume": "４５", "volume_no": 45, "group_name": "【コミック】ドラえもん（全４５巻＋０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011425273'), '0011425273-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011425273'), '0011425273-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011425273'), '0011425273-N01', 540, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ワンピースパーティー
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019589069', 'ワンピースパーティー', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "安藤英, 尾田栄一郎", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2021-02-04", "volume": "７", "volume_no": 7, "group_name": "【コミック】ワンピースパーティー（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019589069'), '0019589069-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 大長編ドラえもん　のび太の恐竜
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011427502', '大長編ドラえもん　のび太の恐竜', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "藤子・Ｆ・不二雄", "market_price": 540, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1983-11-28", "volume": "１", "volume_no": 1, "group_name": "【コミック】大長編ドラえもん（全２４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011427502'), '0011427502-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 虚構推理
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020847471', '虚構推理', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "片瀬茶柴, 城平京", "market_price": 570, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-05-15", "volume": "２５", "volume_no": 25, "group_name": "【コミック】虚構推理（１～２５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N01', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N02', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N03', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N04', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N05', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020847471'), '0020847471-N06', 570, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 戦隊大失格
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020137140', '戦隊大失格', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "春場ねぎ", "market_price": 540, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2023-09-14", "volume": "１１", "volume_no": 11, "group_name": "【コミック】戦隊大失格（１～２２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020137140'), '0020137140-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020137140'), '0020137140-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020137140'), '0020137140-U03', 175, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: るろうに剣心
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011420620', 'るろうに剣心', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "和月伸宏", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1994-09-02", "volume": "１", "volume_no": 1, "group_name": "【コミック】るろうに剣心（全２８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011420620'), '0011420620-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011420620'), '0011420620-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＵＮＴＥＲ×ＨＵＮＴＥＲ　ハンターズ・ガイド
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011419781', 'ＨＵＮＴＥＲ×ＨＵＮＴＥＲ　ハンターズ・ガイド', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "冨樫義博", "market_price": 700, "buyback_price": 228, "publisher": "少年コミック", "saledate": "2008-02-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011419781'), '0011419781-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 北斗の拳
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011413995', '北斗の拳', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "原哲夫", "market_price": 390, "buyback_price": 137, "publisher": "少年コミック", "saledate": "1984-03-09", "volume": "１", "volume_no": 1, "group_name": "【コミック】北斗の拳（全２７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ｄｒ．スランプ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417430', 'Ｄｒ．スランプ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "鳥山明", "market_price": 440, "buyback_price": 164, "publisher": "少年コミック", "saledate": "1980-08-09", "volume": "１", "volume_no": 1, "group_name": "【コミック】ドクタースランプ（全１８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417430'), '0011417430-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417430'), '0011417430-N01', 440, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鋼の錬金術師
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015065797', '鋼の錬金術師', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "荒川弘", "market_price": 536, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2002-01-22", "volume": "１", "volume_no": 1, "group_name": "【コミック】鋼の錬金術師（通常版）（全２７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 鬼滅の刃
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018675573', '鬼滅の刃', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "吾峠呼世晴", "market_price": 440, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2016-06-03", "volume": "１", "volume_no": 1, "group_name": "【コミック】鬼滅の刃（一部特装版）（全２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018675573'), '0018675573-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018675573'), '0018675573-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018675573'), '0018675573-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔男のイチ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020487434', '魔男のイチ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "宇佐崎しろ, 西修", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-01-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】魔男のイチ（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020487434'), '0020487434-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チェンソーマン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019212346', 'チェンソーマン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "藤本タツキ", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2019-03-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】チェンソーマン（全２４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019212346'), '0019212346-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019212346'), '0019212346-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019212346'), '0019212346-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鬼滅の刃
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019540575', '鬼滅の刃', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "吾峠呼世晴", "market_price": 460, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2020-12-04", "volume": "２３", "volume_no": 23, "group_name": "【コミック】鬼滅の刃（全２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540575'), '0019540575-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540575'), '0019540575-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540575'), '0019540575-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 呪術廻戦
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019090493', '呪術廻戦', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "芥見下々", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2018-07-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】呪術廻戦（全３０巻）＋０巻"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090493'), '0019090493-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090493'), '0019090493-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090493'), '0019090493-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＡＲＵＴＯ－ナルト－
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011407453', 'ＮＡＲＵＴＯ－ナルト－', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "岸本斉史", "market_price": 520, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2000-06-02", "volume": "２", "volume_no": 2, "group_name": "【コミック】ＮＡＲＵＴＯ－ナルト－（全７２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011407453'), '0011407453-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011407453'), '0011407453-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011407453'), '0011407453-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 極楽街
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020027200', '極楽街', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "佐乃夕斗", "market_price": 520, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2023-04-04", "volume": "２", "volume_no": 2, "group_name": "【コミック】極楽街（１～６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020027200'), '0020027200-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020027200'), '0020027200-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020027200'), '0020027200-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: カグラバチ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020298488', 'カグラバチ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "外薗健", "market_price": 480, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2024-05-02", "volume": "０２", "volume_no": 2, "group_name": "【コミック】カグラバチ（１～１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298488'), '0020298488-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298488'), '0020298488-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298488'), '0020298488-U03', 315, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: バクマン。
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016860627', 'バクマン。', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "小畑健", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2012-07-04", "volume": "２０", "volume_no": 20, "group_name": "【コミック】バクマン。（全２０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016860627'), '0016860627-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016860627'), '0016860627-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016860627'), '0016860627-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　サスケ真伝　来光篇
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017430789', '【小説】ＮＡＲＵＴＯ－ナルト－　サスケ真伝　来光篇', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "十和田シン, 岸本斉史", "market_price": 810, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-11-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017430789'), '0017430789-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017430789'), '0017430789-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 黒子のバスケ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017259216', '黒子のバスケ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "藤巻忠俊", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2014-12-04", "volume": "３０", "volume_no": 30, "group_name": "【コミック】黒子のバスケ（全３０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017259216'), '0017259216-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017259216'), '0017259216-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　第一部ＥＰ３　ＢＯＸ・空の島
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019508593', 'ＯＮＥ　ＰＩＥＣＥ　第一部ＥＰ３　ＢＯＸ・空の島', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 3960, "buyback_price": 455, "publisher": "少年コミック", "saledate": "2020-09-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　第三部ＥＰ８　ＢＯＸ・情熱の国
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019618119', 'ＯＮＥ　ＰＩＥＣＥ　第三部ＥＰ８　ＢＯＸ・情熱の国', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 4400, "buyback_price": 728, "publisher": "少年コミック", "saledate": "2021-04-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ソウルイーター
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015039829', 'ソウルイーター', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "大久保篤", "market_price": 400, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2004-06-22", "volume": "１", "volume_no": 1, "group_name": "【コミック】ソウルイーター（全２５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015039829'), '0015039829-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015039829'), '0015039829-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鋼の錬金術師（初回限定特装版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015349487', '鋼の錬金術師（初回限定特装版）', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "荒川弘", "market_price": 571, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2006-08-22", "volume": "１４", "volume_no": 14}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 鋼の錬金術師（初回限定特装版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015349485', '鋼の錬金術師（初回限定特装版）', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "荒川弘", "market_price": 571, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2005-12-22", "volume": "１２", "volume_no": 12}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: はじめの一歩
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011391312', 'はじめの一歩', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "森川ジョージ", "market_price": 540, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1990-02-09", "volume": "１", "volume_no": 1, "group_name": "【コミック】はじめの一歩（１～１４５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011391312'), '0011391312-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔都精兵のスレイブ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019210828', '魔都精兵のスレイブ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "竹村洋平, タカヒロ", "market_price": 480, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2019-03-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】魔都精兵のスレイブ（１～２１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019210828'), '0019210828-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019210828'), '0019210828-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019210828'), '0019210828-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＤＥＡＴＨ　ＮＯＴＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417352', 'ＤＥＡＴＨ　ＮＯＴＥ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "小畑健", "market_price": 520, "buyback_price": 110, "publisher": "少年コミック", "saledate": "2004-04-02", "volume": "１", "volume_no": 1, "group_name": "【コミック】ＤＥＡＴＨ　ＮＯＴＥ（デスノート）（全１３巻）＋短編集"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＳＰＹ×ＦＡＭＩＬＹ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020519421', 'ＳＰＹ×ＦＡＭＩＬＹ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "遠藤達哉", "market_price": 560, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-03-04", "volume": "１５", "volume_no": 15, "group_name": "【コミック】ＳＰＹ×ＦＡＭＩＬＹ（スパイファミリー）（１～１７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-N01', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-N02', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-N03', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-N04', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020519421'), '0020519421-N05', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【赤表紙】ＯＮＥ　ＰＩＥＣＥ　巻四十億　アンコール
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019892347', '【赤表紙】ＯＮＥ　ＰＩＥＣＥ　巻四十億　アンコール', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": -2, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2022-09-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019892347'), '0019892347-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019892347'), '0019892347-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＡＲＵＴＯ－ナルト－　外伝　七代目火影と緋色の花つ月
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017383445', 'ＮＡＲＵＴＯ－ナルト－　外伝　七代目火影と緋色の花つ月', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "岸本斉史", "market_price": 540, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-08-04", "group_name": "【コミック】ＮＡＲＵＴＯ－ナルト－（全７２巻）＋外伝"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017383445'), '0017383445-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017383445'), '0017383445-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017383445'), '0017383445-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　暁秘伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017365981', '【小説】ＮＡＲＵＴＯ－ナルト－　暁秘伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "十和田シン, 岸本斉史", "market_price": 650, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-07-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017365981'), '0017365981-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017365981'), '0017365981-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: キン肉マン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020802961', 'キン肉マン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "ゆでたまご", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-04-03", "volume": "９２", "volume_no": 92, "group_name": "【コミック】キン肉マン（１～９２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N02', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N03', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N04', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N05', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802961'), '0020802961-N06', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　５００　ＱＵＩＺ　ＢＯＯＫ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017124897', 'ＯＮＥ　ＰＩＥＣＥ　５００　ＱＵＩＺ　ＢＯＯＫ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 600, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2014-03-04", "group_name": "【コミック】ＯＮＥ　ＰＩＥＣＥ　５００　ＱＵＩＺ　ＢＯＯＫ（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017124897'), '0017124897-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダンダダン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019717009', 'ダンダダン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "龍幸伸", "market_price": 480, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2021-08-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】ダンダダン（１～２４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019717009'), '0019717009-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019717009'), '0019717009-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019717009'), '0019717009-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019717009'), '0019717009-N01', 480, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＤＲＡＧＯＮ　ＢＡＬＬ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011416944', 'ＤＲＡＧＯＮ　ＢＡＬＬ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "鳥山明", "market_price": 390, "buyback_price": 137, "publisher": "少年コミック", "saledate": "1986-01-10", "volume": "２", "volume_no": 2, "group_name": "【コミック】ＤＲＡＧＯＮ　ＢＡＬＬ（ドラゴンボール）（全４２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ドラゴンボール超
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018648613', 'ドラゴンボール超', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "とよたろう, 鳥山明", "market_price": 440, "buyback_price": 91, "publisher": "少年コミック", "saledate": "2016-04-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】ドラゴンボール超（１～２４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018648613'), '0018648613-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018648613'), '0018648613-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018648613'), '0018648613-U03', 280, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 僕のヒーローアカデミア
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020339886', '僕のヒーローアカデミア', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "堀越耕平", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2024-08-02", "volume": "Ｖｏｌ．４１", "volume_no": 41, "group_name": "【コミック】僕のヒーローアカデミア（全４２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N02', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N03', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N04', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N05', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N06', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N07', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N08', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N09', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N10', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N11', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N12', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N13', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N14', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N15', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N16', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020339886'), '0020339886-N17', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＡＫＡＭＯＴＯ　ＤＡＹＳ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020777544', 'ＳＡＫＡＭＯＴＯ　ＤＡＹＳ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "鈴木祐斗", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-03-04", "volume": "ｖｏｌ．２６", "volume_no": 26, "group_name": "【コミック】ＳＡＫＡＭＯＴＯ　ＤＡＹＳ（１～２７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N02', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N03', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N04', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N05', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N06', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N07', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N08', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N09', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N10', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N11', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N12', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N13', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N14', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N15', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N16', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N17', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N18', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N19', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N20', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N21', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020777544'), '0020777544-N22', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 青の祓魔師
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020823814', '青の祓魔師', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "加藤和恵", "market_price": 560, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-05-01", "volume": "３４", "volume_no": 34, "group_name": "【コミック】青の祓魔師（１～３４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N01', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N02', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N03', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N04', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N05', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N06', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N07', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N08', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N09', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N10', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N11', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N12', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N13', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N14', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N15', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020823814'), '0020823814-N16', 560, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: あかね噺
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020580303', 'あかね噺', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "馬上鷹将, 末永裕樹", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-06-04", "volume": "十七", "volume_no": 17, "group_name": "【コミック】あかね噺（１～２２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＢＯＲＵＴＯ―ＴＷＯ　ＢＬＵＥ　ＶＯＲＴＥＸ―
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020489354', 'ＢＯＲＵＴＯ―ＴＷＯ　ＢＬＵＥ　ＶＯＲＴＥＸ―', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "池本幹雄, 岸本斉史", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-02-04", "volume": "４", "volume_no": 4, "group_name": "【コミック】ＢＯＲＵＴＯ―ＴＷＯ　ＢＬＵＥ　ＶＯＲＴＥＸ―（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: レベルＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417788', 'レベルＥ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "冨樫義博", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1996-03-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】レベルＥ（全３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417788'), '0011417788-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417788'), '0011417788-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 黒子のバスケ　公式ビジュアルブック　ＢＲＩＧＨＴ　ＣＯＬＯＲＳ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018659672', '黒子のバスケ　公式ビジュアルブック　ＢＲＩＧＨＴ　ＣＯＬＯＲＳ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "藤巻忠俊", "market_price": 950, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2016-05-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ヒカルの碁
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011416200', 'ヒカルの碁', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "小畑健", "market_price": 440, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2003-09-04", "volume": "２３", "volume_no": 23, "group_name": "【コミック】ヒカルの碁（全２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011416200'), '0011416200-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011416200'), '0011416200-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 幽☆遊☆白書
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011420644', '幽☆遊☆白書', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "冨樫義博", "market_price": 440, "buyback_price": 5, "publisher": "少年コミック", "saledate": "1994-06-03", "volume": "１７", "volume_no": 17, "group_name": "【コミック】幽☆遊☆白書（全１９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011420644'), '0011420644-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011420644'), '0011420644-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011420644'), '0011420644-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 僕のヒーローアカデミア　チームアップミッション
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020576035', '僕のヒーローアカデミア　チームアップミッション', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "あきやま陽光", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-05-02", "volume": "８", "volume_no": 8, "group_name": "【コミック】僕のヒーローアカデミア　チームアップミッション（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020576035'), '0020576035-N01', 520, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　サクラ秘伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017323285', '【小説】ＮＡＲＵＴＯ－ナルト－　サクラ秘伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "大崎知仁, 岸本斉史", "market_price": 650, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2015-04-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017323285'), '0017323285-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017323285'), '0017323285-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: カラダ探し
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018998001', 'カラダ探し', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "村瀬克俊, ウェルザード", "market_price": 400, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2018-02-02", "volume": "１７", "volume_no": 17, "group_name": "【コミック】カラダ探し（全１７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018998001'), '0018998001-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018998001'), '0018998001-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＤＲＡＧＯＮ　ＱＵＥＳＴダイの大冒険
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417861', 'ＤＲＡＧＯＮ　ＱＵＥＳＴダイの大冒険', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "稲田浩司", "market_price": 390, "buyback_price": 5, "publisher": "少年コミック", "saledate": "1997-02-04", "volume": "３５", "volume_no": 35, "group_name": "【コミック】ＤＲＡＧＯＮ　ＱＵＥＳＴダイの大冒険（全３７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417861'), '0011417861-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 銀魂～ぎんたま～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018781660', '銀魂～ぎんたま～', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "空知英秋", "market_price": 440, "buyback_price": 19, "publisher": "少年コミック", "saledate": "2016-12-31", "volume": "六十七", "volume_no": 67, "group_name": "【コミック】銀魂～ぎんたま～（全７７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018781660'), '0018781660-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018781660'), '0018781660-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018781660'), '0018781660-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　イタチ真伝　光明篇
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017398287', '【小説】ＮＡＲＵＴＯ－ナルト－　イタチ真伝　光明篇', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢野隆, 岸本斉史", "market_price": 890, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-09-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017398287'), '0017398287-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017398287'), '0017398287-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: こちら葛飾区亀有公園前派出所
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011415973', 'こちら葛飾区亀有公園前派出所', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "秋本治", "market_price": 440, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1983-03-15", "volume": "２５", "volume_no": 25, "group_name": "【コミック】こちら葛飾区亀有公園前派出所（こち亀）（全２０１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011415973'), '0011415973-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＨＵＮＴＥＲ×ＨＵＮＴＥＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0012866648', '【小説】ＨＵＮＴＥＲ×ＨＵＮＴＥＲ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "岸間信明, 冨樫義博", "market_price": 743, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1999-12-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 【小説】劇場版　ＨＵＮＴＥＲ×ＨＵＮＴＥＲ　Ｔｈｅ　ＬＡＳＴ　ＭＩＳＳＩＯＮ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017094866', '【小説】劇場版　ＨＵＮＴＥＲ×ＨＵＮＴＥＲ　Ｔｈｅ　ＬＡＳＴ　ＭＩＳＳＩＯＮ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "田中創, 冨樫義博, 岸間信明", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2013-12-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017094866'), '0017094866-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　巻千
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016944432', 'ＯＮＥ　ＰＩＥＣＥ　巻千', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": -2, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2012-12-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016944432'), '0016944432-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016944432'), '0016944432-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 聖闘士星矢
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011416902', '聖闘士星矢', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "車田正美", "market_price": 390, "buyback_price": 46, "publisher": "少年コミック", "saledate": "1991-04-10", "volume": "２８", "volume_no": 28, "group_name": "【コミック】聖闘士星矢（全２８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　第二部ＥＰ５　ＢＯＸ・死者の館
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019569013', 'ＯＮＥ　ＰＩＥＣＥ　第二部ＥＰ５　ＢＯＸ・死者の館', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "尾田栄一郎", "market_price": 3520, "buyback_price": 455, "publisher": "少年コミック", "saledate": "2020-12-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019569013'), '0019569013-U01', 2200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: トリコ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017245568', 'トリコ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "島袋光年", "market_price": 520, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2014-11-04", "volume": "３２", "volume_no": 32, "group_name": "【コミック】トリコ（全４３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017245568'), '0017245568-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017245568'), '0017245568-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 桃源暗鬼
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020713251', '桃源暗鬼', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "漆原侑来", "market_price": 590, "buyback_price": 228, "publisher": "少年コミック", "saledate": "2025-12-08", "volume": "２７", "volume_no": 27, "group_name": "【コミック】桃源暗鬼（１～２９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: キメツ学園！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019923595', 'キメツ学園！', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "帆上夏希, 吾峠呼世晴", "market_price": 480, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2022-12-02", "volume": "３", "volume_no": 3, "group_name": "【コミック】キメツ学園！（全６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019923595'), '0019923595-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019923595'), '0019923595-N01', 480, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＩＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019771671', 'ＭＩＸ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "あだち充", "market_price": 527, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2021-12-10", "volume": "１８", "volume_no": 18, "group_name": "【コミック】ＭＩＸ（１～２４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019771671'), '0019771671-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019771671'), '0019771671-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: トモダチゲーム
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019820683', 'トモダチゲーム', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "佐藤友生, 山口ミコト", "market_price": 480, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2022-04-08", "volume": "ｖｏｌ．２０", "volume_no": 20, "group_name": "【コミック】トモダチゲーム（全２６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019820683'), '0019820683-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019820683'), '0019820683-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 金田一少年の事件簿外伝　犯人たちの事件簿
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019338751', '金田一少年の事件簿外伝　犯人たちの事件簿', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "船津紳平, さとうふみや, 天樹征丸, 金成陽三郎", "market_price": 450, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2019-10-17", "volume": "７", "volume_no": 7, "group_name": "【コミック】金田一少年の事件簿外伝　犯人たちの事件簿（１～１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019338751'), '0019338751-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019338751'), '0019338751-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: だがしかし
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018665992', 'だがしかし', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "コトヤマ", "market_price": 500, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2016-05-18", "volume": "５", "volume_no": 5, "group_name": "【コミック】だがしかし（全１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018665992'), '0018665992-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018665992'), '0018665992-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 七つの大罪
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019253322', '七つの大罪', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "鈴木央", "market_price": 480, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2019-06-17", "volume": "３７", "volume_no": 37, "group_name": "【コミック】七つの大罪（全４１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019253322'), '0019253322-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019253322'), '0019253322-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019253322'), '0019253322-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 炎炎ノ消防隊
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019747804', '炎炎ノ消防隊', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "大久保篤", "market_price": 570, "buyback_price": 91, "publisher": "少年コミック", "saledate": "2021-10-15", "volume": "３１", "volume_no": 31, "group_name": "【コミック】炎炎ノ消防隊（全３４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019747804'), '0019747804-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019747804'), '0019747804-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019747804'), '0019747804-U03', 315, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: とある魔術の禁書目録
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019747336', 'とある魔術の禁書目録', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "近木野中哉, 鎌池和馬, はいむらきよたか", "market_price": 445, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2021-10-12", "volume": "２６", "volume_no": 26, "group_name": "【コミック】とある魔術の禁書目録（１～３３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019747336'), '0019747336-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドカベン・プロ野球編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015013805', 'ドカベン・プロ野球編', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "水島新司", "market_price": 419, "buyback_price": 5, "publisher": "少年コミック", "saledate": "1998-11-12", "volume": "２１", "volume_no": 21, "group_name": "【コミック】ドカベン・プロ野球編（全５２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015013805'), '0015013805-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015013805'), '0015013805-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 浦安鉄筋家族
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015021391', '浦安鉄筋家族', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "浜岡賢次", "market_price": 454, "buyback_price": 10, "publisher": "少年コミック", "saledate": "1998-05-22", "volume": "１", "volume_no": 1, "group_name": "【コミック】浦安鉄筋家族（全３１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015021391'), '0015021391-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔法先生ネギま！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016789561', '魔法先生ネギま！', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "赤松健", "market_price": 419, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2012-02-17", "volume": "３７", "volume_no": 37, "group_name": "【コミック】魔法先生ネギま！（全３８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016789561'), '0016789561-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016789561'), '0016789561-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｃ．Ｍ．Ｂ．　森羅博物館の事件目録
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019479018', 'Ｃ．Ｍ．Ｂ．　森羅博物館の事件目録', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "加藤元浩", "market_price": 450, "buyback_price": 19, "publisher": "少年コミック", "saledate": "2020-06-17", "volume": "４４", "volume_no": 44, "group_name": "【コミック】Ｃ．Ｍ．Ｂ．　森羅博物館の事件目録（全４５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019479018'), '0019479018-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＭＡＪＯＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016364551', 'ＭＡＪＯＲ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "満田拓也", "market_price": 500, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2010-05-18", "volume": "７６", "volume_no": 76, "group_name": "【コミック】ＭＡＪＯＲ（メジャー）（全７８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016364551'), '0016364551-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＴＶアニメ『鬼滅の刃』　公式キャラクターズブック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020133748', 'ＴＶアニメ『鬼滅の刃』　公式キャラクターズブック', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "吾峠呼世晴", "market_price": 500, "buyback_price": 19, "publisher": "少年コミック", "saledate": "2023-09-04", "volume": "伍ノ巻", "volume_no": 5}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 青空ラバー
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018601603', '青空ラバー', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "三浦糀", "market_price": 429, "buyback_price": 46, "publisher": "少年コミック", "saledate": "2016-02-09", "volume": "１", "volume_no": 1, "group_name": "【コミック】青空ラバー（全２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: えるのわ！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019825581', 'えるのわ！', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "スズモトコウ", "market_price": 480, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2022-04-15", "volume": "２", "volume_no": 2, "group_name": "【コミック】えるのわ！（全３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019825581'), '0019825581-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 金田一少年の事件簿
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011387673', '金田一少年の事件簿', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "さとうふみや", "market_price": 379, "buyback_price": 5, "publisher": "少年コミック", "saledate": "1993-06-11", "volume": "３", "volume_no": 3, "group_name": "【コミック】金田一少年の事件簿（全２７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011387673'), '0011387673-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: あきら翔ぶ！！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011375163', 'あきら翔ぶ！！', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "とだ勝之", "market_price": 379, "buyback_price": 5, "publisher": "少年コミック", "saledate": "1993-09-01", "volume": "１２", "volume_no": 12, "group_name": "【コミック】あきら翔ぶ！！（全１９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ジョジョの奇妙な冒険
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011417008', 'ジョジョの奇妙な冒険', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "荒木飛呂彦", "market_price": 520, "buyback_price": 46, "publisher": "少年コミック", "saledate": "1996-03-04", "volume": "４６", "volume_no": 46, "group_name": "【コミック】ジョジョの奇妙な冒険（全６３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417008'), '0011417008-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417008'), '0011417008-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011417008'), '0011417008-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＦＡＩＲＹ　ＴＡＩＬ　１００　ＹＥＡＲＳ　ＱＵＥＳＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020821318', 'ＦＡＩＲＹ　ＴＡＩＬ　１００　ＹＥＡＲＳ　ＱＵＥＳＴ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "上田敦夫, 真島ヒロ", "market_price": 540, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-04-09", "volume": "２３", "volume_no": 23, "group_name": "【コミック】ＦＡＩＲＹ　ＴＡＩＬ　１００　ＹＥＡＲＳ　ＱＵＥＳＴ（１～２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: キングダムハーツ　チェインオブメモリーズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015041827', 'キングダムハーツ　チェインオブメモリーズ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "天野シロ", "market_price": 390, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2005-10-22", "volume": "１", "volume_no": 1}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 【小説】鬼滅の刃　片羽の蝶
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019333386', '【小説】鬼滅の刃　片羽の蝶', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 吾峠呼世晴", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2019-10-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019333386'), '0019333386-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019333386'), '0019333386-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019333386'), '0019333386-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】鬼滅の刃　しあわせの花
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019199134', '【小説】鬼滅の刃　しあわせの花', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 吾峠呼世晴", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2019-02-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019199134'), '0019199134-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019199134'), '0019199134-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019199134'), '0019199134-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】鬼滅の刃　風の道しるべ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019485912', '【小説】鬼滅の刃　風の道しるべ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 吾峠呼世晴", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2020-07-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485912'), '0019485912-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485912'), '0019485912-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019485912'), '0019485912-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＳＰＹ×ＦＡＭＩＬＹ　家族の肖像
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019700141', '【小説】ＳＰＹ×ＦＡＭＩＬＹ　家族の肖像', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 遠藤達哉", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2021-07-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019700141'), '0019700141-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019700141'), '0019700141-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019700141'), '0019700141-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】劇場版　ＳＰＹ×ＦＡＭＩＬＹ　ＣＯＤＥ：Ｗｈｉｔｅ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020213106', '【小説】劇場版　ＳＰＹ×ＦＡＭＩＬＹ　ＣＯＤＥ：Ｗｈｉｔｅ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 遠藤達哉, 大河内一楼", "market_price": 740, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2023-12-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020213106'), '0020213106-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】劇場版　鬼滅の刃　無限列車編　ノベライズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019528120', '【小説】劇場版　鬼滅の刃　無限列車編　ノベライズ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢島綾, 吾峠呼世晴, ｕｆｏｔａｂｌｅ", "market_price": 700, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2020-10-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019528120'), '0019528120-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019528120'), '0019528120-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019528120'), '0019528120-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 探偵学園Ｑ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011387442', '探偵学園Ｑ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "さとうふみや", "market_price": 419, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2005-07-15", "volume": "２１", "volume_no": 21, "group_name": "【コミック】探偵学園Ｑ（全２２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011387442'), '0011387442-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シャーマンキング（ＫＣ完結版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019482709', 'シャーマンキング（ＫＣ完結版）', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "武井宏之", "market_price": 600, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2020-06-17", "volume": "５", "volume_no": 5, "group_name": "【コミック】シャーマンキング（ＫＣ完結版）（１～３５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019482709'), '0019482709-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019482709'), '0019482709-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 僕の心のヤバイやつ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020598530', '僕の心のヤバイやつ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "桜井のりお", "market_price": 590, "buyback_price": 91, "publisher": "少年コミック", "saledate": "2025-06-06", "volume": "１２", "volume_no": 12, "group_name": "【コミック】僕の心のヤバイやつ（１～１３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598530'), '0020598530-N01', 590, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598530'), '0020598530-N02', 590, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: メタファー：リファンタジオ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020600129', 'メタファー：リファンタジオ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "天野洋一, アトラス", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2025-06-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】メタファー：リファンタジオ（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020600129'), '0020600129-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020600129'), '0020600129-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ジョジョリオン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018900900', 'ジョジョリオン', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "荒木飛呂彦", "market_price": 520, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2017-07-19", "volume": "ｖｏｌｕｍｅ１５", "volume_no": 15, "group_name": "【コミック】ジョジョの奇妙な冒険第８部ジョジョリオン（全２７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018900900'), '0018900900-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018900900'), '0018900900-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＵＮＴＥＲ×ＨＵＮＴＥＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020897000', 'ＨＵＮＴＥＲ×ＨＵＮＴＥＲ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "冨樫義博", "market_price": 520, "buyback_price": 137, "publisher": "少年コミック", "saledate": "2026-07-03", "volume": "３９", "volume_no": 39}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＵＮＤＥＲ　ＤＯＣＴＯＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020891165', 'ＵＮＤＥＲ　ＤＯＣＴＯＲ', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "谷本今日", "market_price": 520, "buyback_price": 110, "publisher": "少年コミック", "saledate": "2026-06-04", "volume": "０１", "volume_no": 1, "group_name": "【コミック】ＵＮＤＥＲ　ＤＯＣＴＯＲ（１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　ナルト烈伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019333387', '【小説】ＮＡＲＵＴＯ－ナルト－　ナルト烈伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "江坂純, 岸本斉史", "market_price": 870, "buyback_price": 10, "publisher": "少年コミック", "saledate": "2019-10-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　我愛羅秘伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017352525', '【小説】ＮＡＲＵＴＯ－ナルト－　我愛羅秘伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "小太刀右京, 岸本斉史", "market_price": 650, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-06-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017352525'), '0017352525-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017352525'), '0017352525-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　木ノ葉秘伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017334834', '【小説】ＮＡＲＵＴＯ－ナルト－　木ノ葉秘伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "ひなたしょう, 岸本斉史", "market_price": 650, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-05-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017334834'), '0017334834-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　カカシ秘伝　氷天の雷
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017289670', '【小説】ＮＡＲＵＴＯ－ナルト－　カカシ秘伝　氷天の雷', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "東山彰良, 岸本斉史", "market_price": 650, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-02-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017289670'), '0017289670-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017289670'), '0017289670-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【小説】ＮＡＲＵＴＯ－ナルト－　シカマル秘伝
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017303194', '【小説】ＮＡＲＵＴＯ－ナルト－　シカマル秘伝', (SELECT id FROM categories WHERE slug = 'manga-shonen'), '{"author": "矢野隆, 岸本斉史", "market_price": 650, "buyback_price": 5, "publisher": "少年コミック", "saledate": "2015-02-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017303194'), '0017303194-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017303194'), '0017303194-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- ==========================================
-- Seed Seinen Manga (manga-seinen)
-- ==========================================

-- Insert product catalog: 薬屋のひとりごと
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019756863', '薬屋のひとりごと', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ねこクラゲ, 七緒一綺, 日向夏, しのとうこ", "market_price": 700, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2021-11-25", "volume": "９", "volume_no": 9, "group_name": "【コミック】薬屋のひとりごと（１～１６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019756863'), '0019756863-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019756863'), '0019756863-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019756863'), '0019756863-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新世紀エヴァンゲリオン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011403083', '新世紀エヴァンゲリオン', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "貞本義行", "market_price": 580, "buyback_price": 91, "publisher": "大人コミック", "saledate": "1995-08-31", "volume": "１", "volume_no": 1, "group_name": "【コミック】新世紀エヴァンゲリオン（全１４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 教えてください、藤縞さん！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019002934', '教えてください、藤縞さん！', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "なえ・淡路", "market_price": 630, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2018-02-17", "volume": "１", "volume_no": 1, "group_name": "【コミック】教えてください、藤縞さん！（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019002934'), '0019002934-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019002934'), '0019002934-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019002934'), '0019002934-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 針子の乙女
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020803740', '針子の乙女', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "雪村ゆに, ゼロキ, 竹岡美穂", "market_price": 760, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-10", "volume": "６", "volume_no": 6, "group_name": "【コミック】針子の乙女（１～６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020803740'), '0020803740-N01', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: （Ｋ）ＮＩＧＨＴ　＆　ＤＡＹ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020423341', '（Ｋ）ＮＩＧＨＴ　＆　ＤＡＹ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ラカ", "market_price": 750, "buyback_price": 110, "publisher": "大人コミック", "saledate": "2024-10-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020423341'), '0020423341-N01', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 軍神と偽りの花嫁
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020710804', '軍神と偽りの花嫁', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "涼子", "market_price": 673, "buyback_price": 19, "publisher": "大人コミック", "saledate": "2025-11-07", "volume": "３", "volume_no": 3}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 舞妓さんちのまかないさん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019706614', '舞妓さんちのまかないさん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "小山愛子", "market_price": 700, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2021-07-12", "volume": "１７", "volume_no": 17, "group_name": "【コミック】舞妓さんちのまかないさん（全３０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019706614'), '0019706614-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019706614'), '0019706614-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 超少女明日香
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015095709', '超少女明日香', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "和田慎二", "market_price": 650, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2000-04-24", "volume": "３", "volume_no": 3, "group_name": "【コミック】超少女明日香（全７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 薬屋のひとりごと～猫猫の後宮謎解き手帳～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019125077', '薬屋のひとりごと～猫猫の後宮謎解き手帳～', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "倉田三ノ路, 日向夏, しのとうこ", "market_price": 700, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2018-09-19", "volume": "３", "volume_no": 3, "group_name": "【コミック】薬屋のひとりごと～猫猫の後宮謎解き手帳～（１～２２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019125077'), '0019125077-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019125077'), '0019125077-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019125077'), '0019125077-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019125077'), '0019125077-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鬼の花嫁
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020813539', '鬼の花嫁', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "富樫じゅん, クレハ", "market_price": 710, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-27", "volume": "９", "volume_no": 9, "group_name": "【コミック】鬼の花嫁（１～９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N01', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N02', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N03', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N04', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N05', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N06', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N07', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N08', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N09', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020813539'), '0020813539-N10', 710, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スーパーの裏でヤニ吸うふたり
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019933038', 'スーパーの裏でヤニ吸うふたり', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "地主", "market_price": 700, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2023-01-25", "volume": "２", "volume_no": 2, "group_name": "【コミック】スーパーの裏でヤニ吸うふたり（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019933038'), '0019933038-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019933038'), '0019933038-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019933038'), '0019933038-U03', 315, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 元カノたちとヤＲｅなおし！？
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020472487', '元カノたちとヤＲｅなおし！？', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "東雲龍", "market_price": 720, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2024-12-10", "volume": "１", "volume_no": 1, "group_name": "【コミック】元カノたちとヤＲｅなおし！？（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020472487'), '0020472487-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020472487'), '0020472487-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 正反対な君と僕
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019945265', '正反対な君と僕', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "阿賀沢紅茶", "market_price": 650, "buyback_price": 228, "publisher": "大人コミック", "saledate": "2023-03-03", "volume": "３", "volume_no": 3, "group_name": "【コミック】正反対な君と僕（全８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 攻殻機動隊（デラックス版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011383702', '攻殻機動隊（デラックス版）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "士郎正宗", "market_price": 2000, "buyback_price": 591, "publisher": "大人コミック", "saledate": "1991-10-05", "volume": "２", "volume_no": 2, "group_name": "【コミック】攻殻機動隊（１～２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011383702'), '0011383702-U01', 1650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ベル・プペーのスパダリ婚約
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020515501', 'ベル・プペーのスパダリ婚約', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "セレン, 朝霧あさき", "market_price": 700, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2025-02-06", "volume": "１", "volume_no": 1, "group_name": "【コミック】ベル・プペーのスパダリ婚約（１～２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020515501'), '0020515501-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020515501'), '0020515501-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020515501'), '0020515501-U03', 280, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アルテ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019916510', 'アルテ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "大久保圭", "market_price": 660, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2022-11-18", "volume": "１７", "volume_no": 17, "group_name": "【コミック】アルテ（コアミックス）（１～２２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019916510'), '0019916510-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019916510'), '0019916510-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブルーピリオド
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020095654', 'ブルーピリオド', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "山口つばさ", "market_price": 720, "buyback_price": 19, "publisher": "大人コミック", "saledate": "2023-07-21", "volume": "１４", "volume_no": 14, "group_name": "【コミック】ブルーピリオド（１～１９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020095654'), '0020095654-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020095654'), '0020095654-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020095654'), '0020095654-U03', 315, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 攻殻機動隊１．５　ＨＵＭＡＮ　ＥＲＲＯＲ　ＰＲＯＣＥＳＳＥＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015783006', '攻殻機動隊１．５　ＨＵＭＡＮ　ＥＲＲＯＲ　ＰＲＯＣＥＳＳＥＲ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "士郎正宗", "market_price": 2200, "buyback_price": 364, "publisher": "大人コミック", "saledate": "2008-03-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015783006'), '0015783006-N01', 2200, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: とんがり帽子のアトリエ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019825046', 'とんがり帽子のアトリエ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "白浜鴎", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2022-04-21", "volume": "１０", "volume_no": 10, "group_name": "【コミック】とんがり帽子のアトリエ（１～１６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019825046'), '0019825046-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019825046'), '0019825046-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019825046'), '0019825046-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 盾の勇者の成り上がり
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020080205', '盾の勇者の成り上がり', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "藍屋球, アネコユサギ, 弥南せいら", "market_price": 680, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2023-06-22", "volume": "２３", "volume_no": 23, "group_name": "【コミック】盾の勇者の成り上がり（１～３０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020080205'), '0020080205-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020080205'), '0020080205-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 転生賢者の異世界ライフ　～第二の職業を得て、世界最強になりました～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020782052', '転生賢者の異世界ライフ　～第二の職業を得て、世界最強になりました～', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "彭傑（Ｆｒｉｅｎｄｌｙ　Ｌａｎｄ）, 進行諸島, 風花風花", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-02-12", "volume": "３１", "volume_no": 31, "group_name": "【コミック】転生賢者の異世界ライフ　～第二の職業を得て、世界最強になりました～（１～３２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N02', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N03', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N04', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N05', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N06', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N07', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N08', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N09', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N10', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N11', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N12', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N13', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782052'), '0020782052-N14', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ねこに転生したおじさん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020549938', 'ねこに転生したおじさん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "やじま", "market_price": 1250, "buyback_price": 364, "publisher": "大人コミック", "saledate": "2025-03-19", "volume": "４", "volume_no": 4, "group_name": "【コミック】ねこに転生したおじさん（１～６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549938'), '0020549938-U01', 1000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 邪魔な初級職を追放したら、大変なことになっちゃったんですけど！？
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020511113', '邪魔な初級職を追放したら、大変なことになっちゃったんですけど！？', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "吉田屋敷, 真波潜, ひづきみや", "market_price": 720, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-02-07", "volume": "２", "volume_no": 2, "group_name": "【コミック】邪魔な初級職を追放したら、大変なことになっちゃったんですけど！？（全２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020511113'), '0020511113-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020511113'), '0020511113-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 幽霊さんと不良Ａ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020654118', '幽霊さんと不良Ａ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "鴉月ルイ", "market_price": 800, "buyback_price": 19, "publisher": "大人コミック", "saledate": "2025-08-04", "volume": "３", "volume_no": 3, "group_name": "【コミック】幽霊さんと不良Ａ（全３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 運送屋のおっさんがなぜか副業で絶対無敵剣士を務めることに
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020613581', '運送屋のおっさんがなぜか副業で絶対無敵剣士を務めることに', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "星野倖一郎, 朔夜コノハ", "market_price": 720, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-06-26", "volume": "２", "volume_no": 2, "group_name": "【コミック】運送屋のおっさんがなぜか副業で絶対無敵剣士を務めることに（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020613581'), '0020613581-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020613581'), '0020613581-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020613581'), '0020613581-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シグルイ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015007799', 'シグルイ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "山口貴由", "market_price": 552, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2004-01-22", "volume": "１", "volume_no": 1, "group_name": "【コミック】シグルイ（全１５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 誇り高い女騎士が堕ちていくアンソロジーコミック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019237054', '誇り高い女騎士が堕ちていくアンソロジーコミック', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "アンソロジー", "market_price": 750, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2019-04-26", "volume": "２", "volume_no": 2}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019237054'), '0019237054-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: テンガ転生
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020607685', 'テンガ転生', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "大見武士", "market_price": 720, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-06-16", "volume": "２", "volume_no": 2, "group_name": "【コミック】テンガ転生（全３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ａランクパーティを離脱した俺は、元教え子たちと迷宮深部を目指す。
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020801524', 'Ａランクパーティを離脱した俺は、元教え子たちと迷宮深部を目指す。', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ユーリ, 右薙光介, すーぱーぞんび", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-09", "volume": "１２", "volume_no": 12, "group_name": "【コミック】Ａランクパーティを離脱した俺は、元教え子たちと迷宮深部を目指す。（１～１２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020801524'), '0020801524-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020801524'), '0020801524-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 幼稚園ＷＡＲＳ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020816640', '幼稚園ＷＡＲＳ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "千葉侑生", "market_price": 760, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-04-03", "volume": "１７", "volume_no": 17, "group_name": "【コミック】幼稚園ＷＡＲＳ（１～１７巻）＋特別編"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816640'), '0020816640-N01', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816640'), '0020816640-N02', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816640'), '0020816640-N03', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816640'), '0020816640-N04', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020816640'), '0020816640-N05', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 【急募】猜疑王の契約王妃（※短期のお仕事です）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020564556', '【急募】猜疑王の契約王妃（※短期のお仕事です）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "新矢りん, 乙川れい, 三浦ひらく", "market_price": 760, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2025-04-15", "volume": "７", "volume_no": 7, "group_name": "【コミック】【急募】猜疑王の契約王妃（※短期のお仕事です）（全７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020564556'), '0020564556-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020564556'), '0020564556-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヤクザにお風呂で働かされてます。
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020660929', 'ヤクザにお風呂で働かされてます。', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "たかし♂", "market_price": 720, "buyback_price": 19, "publisher": "大人コミック", "saledate": "2025-08-18", "volume": "３", "volume_no": 3, "group_name": "【コミック】ヤクザにお風呂で働かされてます。（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020660929'), '0020660929-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: まじめだけど、したいんです！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020829511', 'まじめだけど、したいんです！', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "嘉村朗", "market_price": 720, "buyback_price": 164, "publisher": "大人コミック", "saledate": "2026-04-16", "volume": "８", "volume_no": 8, "group_name": "【コミック】まじめだけど、したいんです！（全８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020829511'), '0020829511-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020829511'), '0020829511-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020829511'), '0020829511-N03', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 異世界チート開拓記
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020507006', '異世界チート開拓記', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "中村モリス, ファースト, 冬空実", "market_price": 680, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-01-30", "volume": "６", "volume_no": 6, "group_name": "【コミック】異世界チート開拓記（全７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020507006'), '0020507006-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020507006'), '0020507006-N01', 680, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: わたしの幸せな結婚
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020802951', 'わたしの幸せな結婚', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "高坂りと, 顎木あくみ, 月岡月穂", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-12", "volume": "六", "volume_no": 6, "group_name": "【コミック】わたしの幸せな結婚（１～６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N02', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N03', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N04', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N05', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N06', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N07', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N08', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N09', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N10', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N11', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N12', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N13', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N14', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N15', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N16', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N17', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N18', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N19', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N20', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N21', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N22', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N23', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N24', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N25', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N26', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N27', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N28', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N29', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N30', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N31', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N32', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020802951'), '0020802951-N33', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ハイスコアガール
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016791076', 'ハイスコアガール', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "押切蓮介", "market_price": 581, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2012-02-25", "volume": "１", "volume_no": 1, "group_name": "【コミック】ハイスコアガール（全１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016791076'), '0016791076-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016791076'), '0016791076-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ホタルの嫁入り
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020600756', 'ホタルの嫁入り', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "橘オレコ", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-06-18", "volume": "８", "volume_no": 8, "group_name": "【コミック】ホタルの嫁入り（１～１２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020600756'), '0020600756-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020600756'), '0020600756-N02', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 男装騎士は王太子のお気に入り
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020765237', '男装騎士は王太子のお気に入り', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ヤマダモカ, 吉桜美貴", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2026-01-14", "volume": "２", "volume_no": 2, "group_name": "【コミック】男装騎士は王太子のお気に入り（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020765237'), '0020765237-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: バガボンド
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011380673', 'バガボンド', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "井上雄彦", "market_price": 870, "buyback_price": 5, "publisher": "大人コミック", "saledate": "1999-03-23", "volume": "１", "volume_no": 1, "group_name": "【コミック】バガボンド（１～３７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011380673'), '0011380673-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011380673'), '0011380673-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: はたらく細胞ＢＬＡＣＫ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019093322', 'はたらく細胞ＢＬＡＣＫ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "初嘉屋一生, 原田重光, 清水茜", "market_price": 690, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2018-07-09", "volume": "１", "volume_no": 1, "group_name": "【コミック】はたらく細胞ＢＬＡＣＫ（全８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019093322'), '0019093322-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019093322'), '0019093322-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019093322'), '0019093322-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: いぬやしき
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017160276', 'いぬやしき', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "奥浩哉", "market_price": 590, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2014-05-23", "volume": "１", "volume_no": 1, "group_name": "【コミック】いぬやしき（全１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017160276'), '0017160276-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017160276'), '0017160276-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 闇金ウシジマくん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015020792', '闇金ウシジマくん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "真鍋昌平", "market_price": 750, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2004-07-30", "volume": "１", "volume_no": 1, "group_name": "【コミック】闇金ウシジマくん（全４６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015020792'), '0015020792-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015020792'), '0015020792-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: お兄ちゃんはおしまい！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019088445', 'お兄ちゃんはおしまい！', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ねことうふ", "market_price": 680, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2018-06-27", "group_name": "【コミック】お兄ちゃんはおしまい！（１～１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019088445'), '0019088445-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019088445'), '0019088445-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 俺の死亡フラグが留まるところを知らない
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020769152', '俺の死亡フラグが留まるところを知らない', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "乙須ミツヤ, 泉, Ａちき", "market_price": 800, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2026-01-23", "volume": "８", "volume_no": 8}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 狼と香辛料
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015784345', '狼と香辛料', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "小梅けいと", "market_price": 570, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2008-03-27", "volume": "Ⅰ", "volume_no": 1, "group_name": "【コミック】狼と香辛料（全１６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015784345'), '0015784345-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015784345'), '0015784345-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 東京喰種　トーキョーグール
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017235132', '東京喰種　トーキョーグール', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "石田スイ", "market_price": 720, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2014-10-17", "volume": "１４", "volume_no": 14, "group_name": "【コミック】東京喰種　トーキョーグール（全１４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017235132'), '0017235132-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017235132'), '0017235132-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017235132'), '0017235132-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 転生したらスライムだった件
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019486599', '転生したらスライムだった件', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "川上泰樹, みっつばー, 伏瀬", "market_price": 680, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2020-07-09", "volume": "１５", "volume_no": 15, "group_name": "【コミック】転生したらスライムだった件（１～３２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019486599'), '0019486599-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019486599'), '0019486599-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019486599'), '0019486599-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: コードギアス　復活のルルーシュ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020412923', 'コードギアス　復活のルルーシュ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "小笠原智史, 谷口廣次朗（サンライズ）, 「コードギアス　復活のルルーシュ」より", "market_price": 840, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2024-10-10", "volume": "Ｖｏｌ．５", "volume_no": 5, "group_name": "【コミック】コードギアス　復活のルルーシュ（全６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020412923'), '0020412923-N01', 840, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 薬屋のひとりごと～猫猫の後宮謎解き手帳～（特装版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020478927', '薬屋のひとりごと～猫猫の後宮謎解き手帳～（特装版）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "倉田三ノ路, 日向夏, しのとうこ", "market_price": 1500, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2024-12-19", "volume": "１９", "volume_no": 19}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020478927'), '0020478927-U01', 750, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: もう興味がないと離婚された令嬢の意外と楽しい新生活
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020747435', 'もう興味がないと離婚された令嬢の意外と楽しい新生活', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "さびのぶち, 和泉杏花", "market_price": 700, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2025-12-19", "volume": "５", "volume_no": 5, "group_name": "【コミック】もう興味がないと離婚された令嬢の意外と楽しい新生活（１～５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020747435'), '0020747435-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 雨と君と
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019602212', '雨と君と', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "二階堂幸", "market_price": 900, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2021-03-05", "volume": "１", "volume_no": 1, "group_name": "【コミック】雨と君と（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019602212'), '0019602212-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019602212'), '0019602212-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019602212'), '0019602212-U03', 105, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: キングダム
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020688025', 'キングダム', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "原泰久", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-10-17", "volume": "７７", "volume_no": 77, "group_name": "【コミック】キングダム（１～７９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N02', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N03', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N04', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N05', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N06', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020688025'), '0020688025-N07', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: その着せ替え人形は恋をする
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019804689', 'その着せ替え人形は恋をする', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "福田晋一", "market_price": 700, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2022-03-25", "volume": "９", "volume_no": 9, "group_name": "【コミック】その着せ替え人形は恋をする（全１５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019804689'), '0019804689-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019804689'), '0019804689-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019804689'), '0019804689-U03', 175, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 地縛少年　花子くん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018670339', '地縛少年　花子くん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "あいだいろ", "market_price": 700, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2016-05-27", "volume": "３", "volume_no": 3, "group_name": "【コミック】地縛少年　花子くん（１～２５巻）＋０巻"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018670339'), '0018670339-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018670339'), '0018670339-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018670339'), '0018670339-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ホストと社畜
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020803309', 'ホストと社畜', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "河尻みつる", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-26", "volume": "ｖｏｌ．４", "volume_no": 4, "group_name": "【コミック】ホストと社畜（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＨＥＬＬＳＩＮＧ（ヘルシング）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015068042', 'ＨＥＬＬＳＩＮＧ（ヘルシング）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "平野耕太", "market_price": 720, "buyback_price": 10, "publisher": "大人コミック", "saledate": "1998-09-24", "volume": "１", "volume_no": 1, "group_name": "【コミック】ＨＥＬＬＳＩＮＧ（ヘルシング）（全１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015068042'), '0015068042-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: １０８Ｐ！　～１年後に絶対１０８Ｐする話～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020806931', '１０８Ｐ！　～１年後に絶対１０８Ｐする話～', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ｚｅｎｓｏｒｉ", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2026-03-18", "volume": "０２", "volume_no": 2, "group_name": "【コミック】１０８Ｐ！　～１年後に絶対１０８Ｐする話～（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020806931'), '0020806931-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020806931'), '0020806931-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ばっどがーる
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019790050', 'ばっどがーる', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "肉丸", "market_price": 850, "buyback_price": 137, "publisher": "大人コミック", "saledate": "2022-01-26", "volume": "１", "volume_no": 1, "group_name": "【コミック】ばっどがーる（１～５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019790050'), '0019790050-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019790050'), '0019790050-U02', 510, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019790050'), '0019790050-U03', 420, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ボーイッシュ彼女が可愛すぎる
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020724565', 'ボーイッシュ彼女が可愛すぎる', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "牛乳麦ご飯", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-11-20", "volume": "４", "volume_no": 4, "group_name": "【コミック】ボーイッシュ彼女が可愛すぎる（１～５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020724565'), '0020724565-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 違国日記
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018956021', '違国日記', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ヤマシタトモコ", "market_price": 680, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2017-11-08", "volume": "１", "volume_no": 1, "group_name": "【コミック】違国日記（全１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018956021'), '0018956021-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018956021'), '0018956021-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018956021'), '0018956021-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アズラエル家の次男は半魔
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020846023', 'アズラエル家の次男は半魔', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "藤村綾生, 伊達きよ", "market_price": 800, "buyback_price": 164, "publisher": "大人コミック", "saledate": "2026-05-11", "volume": "２", "volume_no": 2, "group_name": "【コミック】アズラエル家の次男は半魔（１～２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 日本三國
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020442665', '日本三國', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "松木いっか", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2024-11-12", "volume": "６", "volume_no": 6, "group_name": "【コミック】日本三國（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020442665'), '0020442665-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020442665'), '0020442665-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020442665'), '0020442665-N03', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020442665'), '0020442665-N04', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020442665'), '0020442665-N05', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: きのう何食べた？
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020782338', 'きのう何食べた？', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "よしながふみ", "market_price": 750, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-02-20", "volume": "２５", "volume_no": 25, "group_name": "【コミック】きのう何食べた？（１～２５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N01', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N02', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N03', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N04', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N05', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N06', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N07', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N08', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N09', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N10', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N11', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N12', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N13', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N14', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N15', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N16', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N17', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N18', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N19', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N20', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N21', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N22', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N23', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020782338'), '0020782338-N24', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇画　ヒットラー（文庫版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015023734', '劇画　ヒットラー（文庫版）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "水木しげる", "market_price": 540, "buyback_price": 5, "publisher": "大人コミック", "saledate": "1990-07-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: Ｃｈａｒｌｏｔｔｅ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017394042', 'Ｃｈａｒｌｏｔｔｅ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "池澤真, 津留崎優, 麻枝准, Ｎａ－Ｇａ", "market_price": 570, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2015-08-27", "volume": "１", "volume_no": 1, "group_name": "【コミック】Ｃｈａｒｌｏｔｔｅ（全６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017394042'), '0017394042-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ファイブスター物語
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020845580', 'ファイブスター物語', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "永野護", "market_price": 1500, "buyback_price": 364, "publisher": "大人コミック", "saledate": "2026-05-09", "volume": "ⅩⅤⅠⅠⅠⅠ", "volume_no": 19, "group_name": "【コミック】ファイブスター物語（１～１９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020845580'), '0020845580-N01', 1500, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: はたらく細胞
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017438036', 'はたらく細胞', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "清水茜", "market_price": 680, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2015-11-20", "volume": "０２", "volume_no": 2, "group_name": "【コミック】はたらく細胞（全６巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017438036'), '0017438036-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017438036'), '0017438036-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017438036'), '0017438036-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブラック・ラグーン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015956356', 'ブラック・ラグーン', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "広江礼威", "market_price": 630, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2008-07-18", "volume": "００８", "volume_no": 8, "group_name": "【コミック】ブラック・ラグーン（１～１３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015956356'), '0015956356-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015956356'), '0015956356-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔術師クノンは見えている
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020896760', '魔術師クノンは見えている', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "Ｌａ－ｎａ, 南野海風, Ｌａｒｕｈａ", "market_price": 820, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-06-23", "volume": "８", "volume_no": 8, "group_name": "【コミック】魔術師クノンは見えている（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N01', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N02', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N03', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N04', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N05', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N06', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N07', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N08', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020896760'), '0020896760-N09', 820, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 可愛いだけじゃない式守さん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019701875', '可愛いだけじゃない式守さん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "真木蛍五", "market_price": 690, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2021-07-09", "volume": "９", "volume_no": 9, "group_name": "【コミック】可愛いだけじゃない式守さん（全２０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701875'), '0019701875-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701875'), '0019701875-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701875'), '0019701875-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: からかい上手の高木さん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020218990', 'からかい上手の高木さん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "山本崇一朗", "market_price": 700, "buyback_price": 228, "publisher": "大人コミック", "saledate": "2024-01-12", "volume": "２０", "volume_no": 20, "group_name": "【コミック】からかい上手の高木さん（全２０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020218990'), '0020218990-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 悪役令嬢転生おじさん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020844748', '悪役令嬢転生おじさん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "上山道郎", "market_price": 750, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-05-08", "volume": "１０", "volume_no": 10, "group_name": "【コミック】悪役令嬢転生おじさん（１～１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020844748'), '0020844748-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020844748'), '0020844748-N01', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020844748'), '0020844748-N02', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020844748'), '0020844748-N03', 750, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｒｅ：ゼロから始める異世界生活　第一章　王都の一日編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017243643', 'Ｒｅ：ゼロから始める異世界生活　第一章　王都の一日編', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "マツセダイチ, 長月達平, 大塚真一郎", "market_price": 740, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2014-10-23", "volume": "１", "volume_no": 1, "group_name": "【コミック】Ｒｅ：ゼロから始める異世界生活　第一章　王都の一日編（全２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017243643'), '0017243643-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017243643'), '0017243643-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 金田一３７歳の事件簿
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020496052', '金田一３７歳の事件簿', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "さとうふみや, 天樹征丸", "market_price": 720, "buyback_price": 182, "publisher": "大人コミック", "saledate": "2025-01-22", "volume": "１８", "volume_no": 18, "group_name": "【コミック】金田一３７歳の事件簿（全１８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020496052'), '0020496052-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020496052'), '0020496052-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドロヘドロ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015013778', 'ドロヘドロ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "林田球", "market_price": 1250, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2002-01-30", "volume": "１", "volume_no": 1, "group_name": "【コミック】ドロヘドロ（全２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015013778'), '0015013778-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015013778'), '0015013778-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒａｇｏｎｂａｌｌ（完全版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011404633', 'Ｄｒａｇｏｎｂａｌｌ（完全版）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "鳥山明", "market_price": 980, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2003-08-04", "volume": "１８", "volume_no": 18, "group_name": "【コミック】ＤＲＡＧＯＮ　ＢＡＬＬ（ドラゴンボール）完全版　（全３４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011404633'), '0011404633-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011404633'), '0011404633-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011404633'), '0011404633-U03', 280, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 片田舎のおっさん、剣聖になる外伝　はじまりの魔法剣士
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020751679', '片田舎のおっさん、剣聖になる外伝　はじまりの魔法剣士', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "空路恵, 佐賀崎しげる, 鍋島テツヒロ, 渡辺樹", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-12-25", "volume": "２", "volume_no": 2, "group_name": "【コミック】片田舎のおっさん、剣聖になる外伝　はじまりの魔法剣士（１～２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751679'), '0020751679-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751679'), '0020751679-U02', 510, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751679'), '0020751679-U03', 420, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＧＡＮＴＺ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015674507', 'ＧＡＮＴＺ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "奥浩哉", "market_price": 619, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2007-11-19", "volume": "２２", "volume_no": 22, "group_name": "【コミック】ＧＡＮＴＺ（ガンツ）（全３７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015674507'), '0015674507-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015674507'), '0015674507-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015674507'), '0015674507-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 異世界居酒屋「のぶ」
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019510873', '異世界居酒屋「のぶ」', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ヴァージニア二等兵, 蝉川夏哉, 転", "market_price": 680, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2020-10-02", "volume": "十一", "volume_no": 11, "group_name": "【コミック】異世界居酒屋「のぶ」（１～２１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019510873'), '0019510873-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019510873'), '0019510873-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019510873'), '0019510873-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 片田舎のおっさん、剣聖になる外伝　竜双剣の軌跡
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020751689', '片田舎のおっさん、剣聖になる外伝　竜双剣の軌跡', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ハザマササミ, 佐賀崎しげる, 鍋島テツヒロ, 四谷ゼンジ", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-12-25", "volume": "２", "volume_no": 2, "group_name": "【コミック】片田舎のおっさん、剣聖になる外伝　竜双剣の軌跡（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751689'), '0020751689-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751689'), '0020751689-U02', 510, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020751689'), '0020751689-U03', 420, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 陰の実力者になりたくて！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019883010', '陰の実力者になりたくて！', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "坂野杏梨, 逢沢大介, 東西", "market_price": 680, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2022-09-26", "volume": "８", "volume_no": 8, "group_name": "【コミック】陰の実力者になりたくて！（１～１８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019883010'), '0019883010-U01', 400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019883010'), '0019883010-U02', 340, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｒｅ：ゼロから始める異世界生活　第二章　屋敷の一週間編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018838135', 'Ｒｅ：ゼロから始める異世界生活　第二章　屋敷の一週間編', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "楓月誠, 長月達平, 大塚真一郎", "market_price": 571, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2017-03-22", "volume": "４", "volume_no": 4, "group_name": "【コミック】Ｒｅ：ゼロから始める異世界生活　第二章　屋敷の一週間編（全５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018838135'), '0018838135-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 科学的に存在しうるクリーチャー娘の観察日誌
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020903858', '科学的に存在しうるクリーチャー娘の観察日誌', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "ＫＡＫＥＲＵ", "market_price": 800, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2026-06-19", "volume": "１８", "volume_no": 18, "group_name": "【コミック】科学的に存在しうるクリーチャー娘の観察日誌（１～１８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N01', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N02', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N03', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N04', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N05', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N06', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N07', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N08', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020903858'), '0020903858-N09', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: メダリスト
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019517379', 'メダリスト', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "つるまいかだ", "market_price": 680, "buyback_price": 228, "publisher": "大人コミック", "saledate": "2020-09-23", "volume": "ｖｏｌ．１", "volume_no": 1, "group_name": "【コミック】メダリスト（１～１４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019517379'), '0019517379-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019517379'), '0019517379-U02', 468, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019517379'), '0019517379-U03', 385, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019517379'), '0019517379-N01', 680, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 死ぬ運命にある悪役令嬢の兄に転生したので、妹を育てて未来を変えたいと思います
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020903909', '死ぬ運命にある悪役令嬢の兄に転生したので、妹を育てて未来を変えたいと思います', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "岩見翔子, 泉里侑希, タムラヨウ", "market_price": 690, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2026-06-20", "volume": "３", "volume_no": 3, "group_name": "【コミック】死ぬ運命にある悪役令嬢の兄に転生したので、妹を育てて未来を変えたいと思います（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: アイツノカノジョ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020328247', 'アイツノカノジョ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "肉丸", "market_price": 700, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2024-06-11", "volume": "ｖｏｌ．４", "volume_no": 4, "group_name": "【コミック】アイツノカノジョ（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020328247'), '0020328247-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020328247'), '0020328247-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 幼女戦記
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020803302', '幼女戦記', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "東條チカ, カルロ・ゼン, 篠月しのぶ", "market_price": 760, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-03-26", "volume": "３４", "volume_no": 34, "group_name": "【コミック】幼女戦記（１～３４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 近畿地方のある場所について
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020812744', '近畿地方のある場所について', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "碓井ツカサ, 背筋", "market_price": 780, "buyback_price": 164, "publisher": "大人コミック", "saledate": "2026-03-27", "volume": "第３巻", "volume_no": 3, "group_name": "【コミック】近畿地方のある場所について（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020812744'), '0020812744-N01', 780, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ポケットモンスタースペシャル
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011422015', 'ポケットモンスタースペシャル', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "真斗", "market_price": 700, "buyback_price": 46, "publisher": "大人コミック", "saledate": "1997-12-16", "volume": "２", "volume_no": 2, "group_name": "【コミック】ポケットモンスタースペシャル（１～６４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: スノウボールアース
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020009492', 'スノウボールアース', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "辻次夕日郎", "market_price": 700, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2023-02-28", "volume": "５", "volume_no": 5, "group_name": "【コミック】スノウボールアース（１～１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020009492'), '0020009492-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020009492'), '0020009492-N01', 700, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｒｅ：ゼロから始める異世界生活　第三章　Ｔｒｕｔｈ　ｏｆ　Ｚｅｒｏ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018840514', 'Ｒｅ：ゼロから始める異世界生活　第三章　Ｔｒｕｔｈ　ｏｆ　Ｚｅｒｏ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "マツセダイチ, 長月達平, 大塚真一郎", "market_price": 740, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2017-03-23", "volume": "５", "volume_no": 5, "group_name": "【コミック】Ｒｅ：ゼロから始める異世界生活　第三章　Ｔｒｕｔｈ　ｏｆ　Ｚｅｒｏ（全１１巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018840514'), '0018840514-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018840514'), '0018840514-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018840514'), '0018840514-U03', 245, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 本能寺から始める信長との天下統一
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020503088', '本能寺から始める信長との天下統一', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "村橋リョウ, 常陸之介寛浩, 茨乃", "market_price": 690, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-01-27", "volume": "６", "volume_no": 6, "group_name": "【コミック】本能寺から始める信長との天下統一（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020503088'), '0020503088-N01', 690, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: やがて君になる
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019225580', 'やがて君になる', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "仲谷鳰", "market_price": 740, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2019-04-26", "volume": "７", "volume_no": 7, "group_name": "【コミック】やがて君になる（全８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019225580'), '0019225580-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: かぐや様は告らせたい
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019540692', 'かぐや様は告らせたい', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "赤坂アカ", "market_price": 700, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2020-11-19", "volume": "２０", "volume_no": 20, "group_name": "【コミック】かぐや様は告らせたい（全２８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540692'), '0019540692-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540692'), '0019540692-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019540692'), '0019540692-U03', 140, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 片田舎のおっさん、剣聖になる
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020013369', '片田舎のおっさん、剣聖になる', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "乍藤和樹, 佐賀崎しげる, 鍋島テツヒロ", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2023-03-20", "volume": "３", "volume_no": 3, "group_name": "【コミック】片田舎のおっさん、剣聖になる（１～９巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-U03', 315, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N03', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N04', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N05', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020013369'), '0020013369-N06', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 開花アパートメント
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020828217', '開花アパートメント', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "飴石", "market_price": 850, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2026-04-15", "volume": "４", "volume_no": 4, "group_name": "【コミック】開花アパートメント（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020828217'), '0020828217-N01', 850, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020828217'), '0020828217-N02', 850, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 紫雲寺家の子供たち
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020897952', '紫雲寺家の子供たち', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "宮島礼吏, 雪野れいじ", "market_price": 690, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-06-17", "volume": "１０", "volume_no": 10, "group_name": "【コミック】紫雲寺家の子供たち（１～１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020897952'), '0020897952-N01', 690, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020897952'), '0020897952-N02', 690, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020897952'), '0020897952-N03', 690, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020897952'), '0020897952-N04', 690, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｒｅ：ゼロから始める異世界生活　第四章　聖域と強欲の魔女
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019399029', 'Ｒｅ：ゼロから始める異世界生活　第四章　聖域と強欲の魔女', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "花鶏ハルノ, 相川有, 長月達平, 大塚真一郎", "market_price": 740, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2020-02-21", "volume": "１", "volume_no": 1, "group_name": "【コミック】Ｒｅ：ゼロから始める異世界生活　第四章　聖域と強欲の魔女（１～１３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019399029'), '0019399029-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019399029'), '0019399029-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 悶えてよ、アダムくん
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020810756', '悶えてよ、アダムくん', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "トヨ", "market_price": 780, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2026-03-18", "volume": "７", "volume_no": 7, "group_name": "【コミック】悶えてよ、アダムくん（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ビブリア古書堂の事件手帖　扉子と虚ろな夢
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020494216', 'ビブリア古書堂の事件手帖　扉子と虚ろな夢', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "庭春樹, 三上延, 越島はぐ", "market_price": 680, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2025-01-10", "volume": "２", "volume_no": 2, "group_name": "【コミック】ビブリア古書堂の事件手帖　扉子と虚ろな夢（全３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 監獄学園（プリズンスクール）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016580249', '監獄学園（プリズンスクール）', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "平本アキラ", "market_price": 552, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2011-06-06", "volume": "００１", "volume_no": 1, "group_name": "【コミック】監獄学園（プリズンスクール）（全２８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016580249'), '0016580249-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016580249'), '0016580249-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016580249'), '0016580249-U03', 70, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クールドジ男子
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019899222', 'クールドジ男子', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "那多ここね", "market_price": 1100, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2022-10-21", "volume": "ｖｏｌ．５", "volume_no": 5, "group_name": "【コミック】クールドジ男子（１～５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019899222'), '0019899222-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019899222'), '0019899222-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 二階堂地獄ゴルフ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020905491', '二階堂地獄ゴルフ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "福本伸行", "market_price": 720, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2026-06-23", "volume": "１３", "volume_no": 13, "group_name": "【コミック】二階堂地獄ゴルフ（１～１３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N03', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N04', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N05', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N06', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N07', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020905491'), '0020905491-N08', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 罰
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020768444', '罰', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "柳内大樹", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2026-01-19", "volume": "２", "volume_no": 2, "group_name": "【コミック】罰（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: アンゴルモア　元寇合戦記　博多編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020767964', 'アンゴルモア　元寇合戦記　博多編', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "たかぎ七彦", "market_price": 760, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2026-01-22", "volume": "第十二巻", "volume_no": 12, "group_name": "【コミック】アンゴルモア　元寇合戦記　博多編（１～１２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020767964'), '0020767964-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020767964'), '0020767964-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020767964'), '0020767964-N01', 760, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: タヌキとキツネ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019061773', 'タヌキとキツネ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "アタモト", "market_price": 880, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2018-05-15", "volume": "４", "volume_no": 4, "group_name": "【コミック】タヌキとキツネ（１～１０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019061773'), '0019061773-U01', 250, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019061773'), '0019061773-U02', 212, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 大人大戦
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020598014', '大人大戦', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "都築真佐秋, かっぴー", "market_price": 700, "buyback_price": 228, "publisher": "大人コミック", "saledate": "2025-06-04", "volume": "１", "volume_no": 1, "group_name": "【コミック】大人大戦（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598014'), '0020598014-U01', 550, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020598014'), '0020598014-U02', 468, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 音盤紀行
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020161591', '音盤紀行', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "毛塚了一郎", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2023-10-20", "volume": "２", "volume_no": 2, "group_name": "【コミック】音盤紀行（１～３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020161591'), '0020161591-U01', 450, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020161591'), '0020161591-U02', 382, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020161591'), '0020161591-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔道具師リゼ、開業します
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020704710', '魔道具師リゼ、開業します', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "たかのかな, くまだ乙夜", "market_price": 690, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-10-25", "volume": "４", "volume_no": 4, "group_name": "【コミック】魔道具師リゼ、開業します（１～４巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020704710'), '0020704710-U01', 600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クズレス・オブリージュ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020703305', 'クズレス・オブリージュ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "大崎ペコ丸, アバタロー, ｋｏｄａｍａｚｏｎ", "market_price": 720, "buyback_price": 19, "publisher": "大人コミック", "saledate": "2025-10-23", "volume": "２", "volume_no": 2, "group_name": "【コミック】クズレス・オブリージュ（１～２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 実は俺、最強でした？
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020739373', '実は俺、最強でした？', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "高橋愛, 澄守彩", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-12-09", "volume": "１８", "volume_no": 18, "group_name": "【コミック】実は俺、最強でした？（１～２０巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739373'), '0020739373-U01', 650, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739373'), '0020739373-U02', 552, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739373'), '0020739373-N01', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739373'), '0020739373-N02', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020739373'), '0020739373-N03', 720, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 怪獣自衛隊
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019808503', '怪獣自衛隊', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "井上淳哉, 白土晴一", "market_price": 660, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2022-03-09", "volume": "７", "volume_no": 7, "group_name": "【コミック】怪獣自衛隊（１～２３巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019808503'), '0019808503-U01', 350, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019808503'), '0019808503-U02', 298, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 青春鉄道　付喪編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020336020', '青春鉄道　付喪編', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "青春", "market_price": 1200, "buyback_price": 10, "publisher": "大人コミック", "saledate": "2024-06-27", "group_name": "【コミック】青春鉄道（１～２０冊）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020336020'), '0020336020-N01', 1200, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブラック・ジャック創作秘話　手塚治虫の仕事場から
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017195505', 'ブラック・ジャック創作秘話　手塚治虫の仕事場から', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "吉本浩二, 宮崎克", "market_price": 800, "buyback_price": 91, "publisher": "大人コミック", "saledate": "2014-08-08", "volume": "Ｖｏｌ．５", "volume_no": 5, "group_name": "【コミック】ブラック・ジャック創作秘話　手塚治虫の仕事場から（全５巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017195505'), '0017195505-N01', 800, 'NEW', 'AVAILABLE', 'NEW') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＦＯＲ　ＡＬＬ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020367359', 'ＯＮＥ　ＦＯＲ　ＡＬＬ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "柳内大樹", "market_price": 690, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2024-08-06", "volume": "３", "volume_no": 3, "group_name": "【コミック】ＯＮＥ　ＦＯＲ　ＡＬＬ（１～８巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020367359'), '0020367359-U01', 200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020367359'), '0020367359-U02', 170, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＩＮＮＵ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020690454', 'ＩＮＮＵ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "小丸ひかり, 大沼隆揮", "market_price": 720, "buyback_price": 46, "publisher": "大人コミック", "saledate": "2025-10-06", "volume": "５", "volume_no": 5, "group_name": "【コミック】ＩＮＮＵ（１～７巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020690454'), '0020690454-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020690454'), '0020690454-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 甘々と稲妻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018898502', '甘々と稲妻', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "雨隠ギド", "market_price": 590, "buyback_price": 5, "publisher": "大人コミック", "saledate": "2017-07-07", "volume": "９", "volume_no": 9, "group_name": "【コミック】甘々と稲妻（全１２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018898502'), '0018898502-U01', 150, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018898502'), '0018898502-U02', 128, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: め組の大吾　救国のオレンジ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020659144', 'め組の大吾　救国のオレンジ', (SELECT id FROM categories WHERE slug = 'manga-seinen'), '{"author": "曽田正人, 冨山玖呂", "market_price": 720, "buyback_price": 273, "publisher": "大人コミック", "saledate": "2025-08-12", "volume": "１２", "volume_no": 12, "group_name": "【コミック】め組の大吾　救国のオレンジ（１～１２巻）"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;
