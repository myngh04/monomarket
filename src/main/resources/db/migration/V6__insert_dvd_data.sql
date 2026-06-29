-- ==========================================
-- Flyway Migration:  DVD / Blu-ray into MonoMarket
-- ==========================================

-- ==========================================
--  Anime DVD (video-anime)
-- ==========================================

-- Insert product catalog: 劇場版「鬼滅の刃」無限列車編（完全生産限定版）（２ＤＶＤ＋ＣＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019611893', '劇場版「鬼滅の刃」無限列車編（完全生産限定版）（２ＤＶＤ＋ＣＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 外崎春雄（監督）, 松島晃（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 8000, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2021-06-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611893'), '0019611893-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611893'), '0019611893-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611893'), '0019611893-U03', 504, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　呪術廻戦　０（豪華版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019842588', '劇場版　呪術廻戦　０（豪華版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "芥見下々（原作）, 緒方恵美, 花澤香菜, 小松未可子, 内山昂輝, 関智一, 中村悠一, 櫻井孝宏", "market_price": 8229, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2022-09-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019842588'), '0019842588-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019842588'), '0019842588-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019842588'), '0019842588-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　３ｒｄ　ＳＴＡＧＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017180005', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　３ｒｄ　ＳＴＡＧＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 6800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2014-06-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017180005'), '0017180005-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　４ｔｈ　ＳＴＡＧＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018679726', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　４ｔｈ　ＳＴＡＧＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 6800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2015-09-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018679726'), '0018679726-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018679726'), '0018679726-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　Ｖｏｌ．０１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001364888', 'ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　Ｖｏｌ．０１', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（監督）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）, 緒方恵美（碇シンジ）, 三石琴乃（葛城ミサト）, 山口由里子（赤木リツコ）, 林原めぐみ（綾波レイ）, 宮村優子（惣流・アスカ・ラングレー）", "market_price": 3800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2003-07-24", "group_name": "【ＤＶＤ】ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ（新世紀エヴァンゲリオン）　全"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001364888'), '0001364888-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001364888'), '0001364888-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）　ＲＥＤＯ．（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019701526', 'ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）　ＲＥＤＯ．（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、総監督、脚本）, 緒方恵美, 林原めぐみ, 宮村優子, 摩砂雪（監督）, 前田真宏（監督）, 貞本義行（主・キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 5000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2021-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701526'), '0019701526-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701526'), '0019701526-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701526'), '0019701526-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　６ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019044988', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　６ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 7500, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2017-12-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019044988'), '0019044988-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019044988'), '0019044988-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019044988'), '0019044988-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　７ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020411730', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　７ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤／鈴村健一／谷山紀章", "market_price": 9000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2022-07-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020411730'), '0020411730-U01', 7200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020411730'), '0020411730-U02', 6120, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　４ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018679712', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　４ｔｈ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 6800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2015-09-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018679712'), '0018679712-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018679712'), '0018679712-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版「鬼滅の刃」無限列車編（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019611894', '劇場版「鬼滅の刃」無限列車編（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 外崎春雄（監督）, 松島晃（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 4000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2021-06-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611894'), '0019611894-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611894'), '0019611894-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611894'), '0019611894-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：破　ＥＶＡＮＧＥＬＩＯＮ：２．２２　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＡＤＶＡＮＣＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016305103', 'ヱヴァンゲリヲン新劇場版：破　ＥＶＡＮＧＥＬＩＯＮ：２．２２　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＡＤＶＡＮＣＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 5800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2010-05-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305103'), '0016305103-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305103'), '0016305103-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305103'), '0016305103-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　６ｔｈ　ＳＴＡＧＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018985979', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　６ｔｈ　ＳＴＡＧＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 7500, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2017-12-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018985979'), '0018985979-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018985979'), '0018985979-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018985979'), '0018985979-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ“ＮＡＭＩ”（ＴＶアニメ第３１話～第４４話）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016339848', 'ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ“ＮＡＭＩ”（ＴＶアニメ第３１話～第４４話）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "尾田栄一郎（原作）, 田中真弓（ルフィ）, 中井和哉（ゾロ）, 小泉昇（キャラクターデザイン）, 田中公平（音楽）, 浜口史郎（音楽）", "market_price": 13143, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2010-08-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ラブライブ！サンシャイン！！　２ｎｄ　Ｓｅａｓｏｎ　７（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018945755', 'ラブライブ！サンシャイン！！　２ｎｄ　Ｓｅａｓｏｎ　７（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇（原作）, 伊波杏樹（高海千歌）, 逢田梨香子（桜内梨子）, 諏訪ななか（松浦果南）, 室田雄平（キャラクターデザイン）, 加藤達也（音楽）", "market_price": 7000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2018-06-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018945755'), '0018945755-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール　ＴＨＥ　ＭＯＶＩＥＳ　＃０４
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015894727', 'ドラゴンボール　ＴＨＥ　ＭＯＶＩＥＳ　＃０４', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯）, 古川登志夫（ピッコロ）, 田中真弓（クリリン）, 橋本光夫（監督）, 菊池俊輔（音楽）", "market_price": 2800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2008-09-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015894727'), '0015894727-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015894727'), '0015894727-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015894727'), '0015894727-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: おおかみこどもの雨と雪
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016940557', 'おおかみこどもの雨と雪', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "細田守（監督、脚本、原作）, 宮﨑あおい（花）, 大沢たかお（彼（おおかみおとこ））, 菅原文太（韮崎）, 貞本義行（キャラクターデザイン）, 高木正勝（音楽）", "market_price": 4800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2013-02-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016940557'), '0016940557-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016940557'), '0016940557-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016940557'), '0016940557-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: テレビアニメ「鬼滅の刃」無限列車編　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019750000', 'テレビアニメ「鬼滅の刃」無限列車編　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 松島晃（キャラクターデザイン、総作画監督）, 佐藤美幸（サブキャラクターデザイン）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 4000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2022-01-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019750000'), '0019750000-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019750000'), '0019750000-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪：うた☆プリＷＥＢラジオ合同オンラインイベントＤＶＤ　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＳＱＵＡＲＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019591299', 'うたの☆プリンスさまっ♪：うた☆プリＷＥＢラジオ合同オンラインイベントＤＶＤ　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＳＱＵＡＲＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（趣味／教養）, 森久保祥太郎, 鈴村健一, 下野紘, 緑川光, 内田雄馬, 鈴木達央, 蒼井翔太", "market_price": 5000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2021-07-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019591299'), '0019591299-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019591299'), '0019591299-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 僕のヒーローアカデミア　ＴＨＥ　ＭＯＶＩＥ　～２人の英雄～（プルスウルトラ版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019145657', '僕のヒーローアカデミア　ＴＨＥ　ＭＯＶＩＥ　～２人の英雄～（プルスウルトラ版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "堀越耕平（原作、総監修、キャラクター原案）, 山下大輝, 三宅健太, 志田未来, 長崎健司（監督）, 馬越嘉彦（キャラクターデザイン、チーフ作画監督）, 林ゆうき（音楽）", "market_price": 7800, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2019-02-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019145657'), '0019145657-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019145657'), '0019145657-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019145657'), '0019145657-U03', 504, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＧＨＯＳＴ　ＩＮ　ＴＨＥ　ＳＨＥＬＬ／攻殻機動隊（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018807929', 'ＧＨＯＳＴ　ＩＮ　ＴＨＥ　ＳＨＥＬＬ／攻殻機動隊（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "押井守（監督）, 士郎正宗（原作）, 田中敦子（草薙素子）, 大塚明夫（バトー）, 山寺宏一（トグサ）, 沖浦啓之（キャラクターデザイン、作画監督）, 川井憲次（音楽）", "market_price": 4800, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2017-04-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018807929'), '0018807929-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018807929'), '0018807929-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ウサビッチ　シーズン４
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016706593', 'ウサビッチ　シーズン４', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "富岡聡／宮崎あぐり（監督、原作、脚本、絵コンテ／原作、絵コンテ、デザイン）, 上野大典（音楽、音響効果、プーチンの声）", "market_price": 2800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2011-11-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016706593'), '0016706593-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－Ｄｒａｍａｔｉｃ　Ｍａｇｉｃａｌ　Ｓｔｏｒｙ－　Ｖｅｒ．Ａ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020549986', 'うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－Ｄｒａｍａｔｉｃ　Ｍａｇｉｃａｌ　Ｓｔｏｒｙ－　Ｖｅｒ．Ａ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＳＴ☆ＲＩＳＨ, ＱＵＡＲＴＥＴ　ＮＩＧＨＴ, ＨＥ★ＶＥＮＳ", "market_price": 8000, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2025-10-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549986'), '0020549986-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549986'), '0020549986-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549986'), '0020549986-U03', 3500, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール超　Ｂｌｕ－ｒａｙ　ＢＯＸ１１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018926545', 'ドラゴンボール超　Ｂｌｕ－ｒａｙ　ＢＯＸ１１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作、ストーリー、キャラクター原案）, 野沢雅子（孫悟空、孫悟飯）, 佐藤正治（亀仙人）, 堀川りょう（ベジータ）, 山室直儀（キャラクターデザイン）", "market_price": 15200, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2018-07-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018926545'), '0018926545-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018926545'), '0018926545-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＴＶアニメーション　蒼き鋼のアルペジオ－アルス・ノヴァ－第２巻（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017057732', 'ＴＶアニメーション　蒼き鋼のアルペジオ－アルス・ノヴァ－第２巻（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "Ａｒｋ　Ｐｅｒｆｏｒｍａｎｃｅ（原作）, 興津和幸（千早群像）, 渕上舞（イオナ）, 松本忍（織部僧）, 森田和明（キャラクターデザイン）, 甲田雅人（音楽）", "market_price": 6500, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2014-02-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017057732'), '0017057732-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 舞台「鬼滅の刃」（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019389262', '舞台「鬼滅の刃」（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "小林亮太, 髙石あかり, 植田圭輔, 吾峠呼世晴（原作）, 和田俊輔（音楽）", "market_price": 9800, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2020-07-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019389262'), '0019389262-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019389262'), '0019389262-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019389262'), '0019389262-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新世紀エヴァンゲリオン　Ｂｌｕ－ｒａｙ　ＢＯＸ　ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017292784', '新世紀エヴァンゲリオン　Ｂｌｕ－ｒａｙ　ＢＯＸ　ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（監督）", "market_price": 38000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2015-08-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017292784'), '0017292784-U01', 10500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017292784'), '0017292784-U02', 8925, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017292784'), '0017292784-U03', 7350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：序
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015758855', 'ヱヴァンゲリヲン新劇場版：序', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 4700, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2008-05-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015758855'), '0015758855-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（通常版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019903089', 'シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（通常版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明, 緒方恵美, 林原めぐみ, 宮村優子, 鶴巻和哉, 中山勝一, 前田真宏, 鷺巣詩郎", "market_price": 7800, "buyback_price": 3273, "publisher": "ＤＶＤ", "saledate": "2023-03-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903089'), '0019903089-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903089'), '0019903089-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：破　ＥＶＡＮＧＥＬＩＯＮ：２．２２　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＡＤＶＡＮＣＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016305104', 'ヱヴァンゲリヲン新劇場版：破　ＥＶＡＮＧＥＬＩＯＮ：２．２２　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＡＤＶＡＮＣＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 5700, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2010-05-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305104'), '0016305104-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305104'), '0016305104-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016305104'), '0016305104-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019903090', 'シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明, 緒方恵美, 林原めぐみ, 宮村優子, 鶴巻和哉, 中山勝一, 前田真宏, 鷺巣詩郎", "market_price": 7800, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2023-03-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903090'), '0019903090-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903090'), '0019903090-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）　ＲＥＤＯ．（期間限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋ＵＨＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019701524', 'ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）　ＲＥＤＯ．（期間限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋ＵＨＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、総監督、脚本）, 緒方恵美, 林原めぐみ, 宮村優子, 摩砂雪（監督）, 前田真宏（監督）, 貞本義行（主・キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 7800, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2021-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701524'), '0019701524-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701524'), '0019701524-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019701524'), '0019701524-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－Ｄｒａｍａｔｉｃ　Ｍａｇｉｃａｌ　Ｓｔｏｒｙ－　Ｖｅｒ．Ａ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020549961', 'うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－Ｄｒａｍａｔｉｃ　Ｍａｇｉｃａｌ　Ｓｔｏｒｙ－　Ｖｅｒ．Ａ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＳＴ☆ＲＩＳＨ, ＱＵＡＲＴＥＴ　ＮＩＧＨＴ, ＨＥ★ＶＥＮＳ", "market_price": 7000, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2025-10-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549961'), '0020549961-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549961'), '0020549961-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020549961'), '0020549961-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版「鬼滅の刃」無限列車編（通常版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019611892', '劇場版「鬼滅の刃」無限列車編（通常版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 外崎春雄（監督）, 松島晃（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 3500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2021-06-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611892'), '0019611892-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611892'), '0019611892-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019611892'), '0019611892-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＲＥＤＯ．
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016969950', 'ヱヴァンゲリヲン新劇場版：Ｑ　ＥＶＡＮＧＥＬＩＯＮ：３．３３　ＹＯＵ　ＣＡＮ（ＮＯＴ）ＲＥＤＯ．', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美, 林原めぐみ, 三石琴乃, 貞本義行（主・キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 5700, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2013-04-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016969950'), '0016969950-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016969950'), '0016969950-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016969950'), '0016969950-U03', 504, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＬＩＶＥ　エボリューション　２０１７
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019208324', 'うたの☆プリンスさまっ♪　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＬＩＶＥ　エボリューション　２０１７', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "森久保祥太郎, 鈴木達央, 蒼井翔太, 前野智昭", "market_price": 7000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2017-10-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：序（特装版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015758854', 'ヱヴァンゲリヲン新劇場版：序（特装版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）", "market_price": 5700, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2008-04-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015758854'), '0015758854-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015758854'), '0015758854-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015758854'), '0015758854-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 君の名は。コレクターズ・エディション（４Ｋ　ＵＬＴＲＡ　ＨＤ＋Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）（初回生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018869158', '君の名は。コレクターズ・エディション（４Ｋ　ＵＬＴＲＡ　ＨＤ＋Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）（初回生産限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作、脚本、監督）, 神木隆之介, 上白石萌音, 成田凌, 田中将賀（キャラクターデザイン）, ＲＡＤＷＩＭＰＳ（音楽）", "market_price": 12000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2017-07-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018869158'), '0018869158-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018869158'), '0018869158-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018869158'), '0018869158-U03', 2030, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 映画『聲の形』（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018815094', '映画『聲の形』（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "大今良時（原作）, 入野自由（石田将也）, 早見沙織（西宮硝子）, 悠木碧（西宮結絃）, 西屋太志（キャラクターデザイン）, Ｋｅｎｓｕｋｅ　Ｕｓｈｉｏ（音楽）", "market_price": 8000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2017-05-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018815094'), '0018815094-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018815094'), '0018815094-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018815094'), '0018815094-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 化物語　第六巻　つばさキャット　下（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016231242', '化物語　第六巻　つばさキャット　下（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "西尾維新（原作）, 神谷浩史（阿良々木暦）, 斎藤千和（戦場ヶ原ひたぎ）, 堀江由衣（羽川翼）, 渡辺明夫（キャラクターデザイン、総作画監督）, 神前暁（音楽）", "market_price": 7000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2010-07-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016231242'), '0016231242-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版　アニメイト特装版（ＱＵＡＲＴＥＴ　ＮＩＧＨＴバージョン）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019821857', '劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版　アニメイト特装版（ＱＵＡＲＴＥＴ　ＮＩＧＨＴバージョン）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康（原作）, ブロッコリー（原作）, 寺島拓篤（一十木音也）, 鈴村健一（聖川真斗）, 谷山紀章（四ノ宮那月）, 吉田丈司（総監督）, 倉花千夏（キャラクターデザイン原案）, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ（音楽）", "market_price": 11500, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2019-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版　Ｗａｋｅ　Ｕｐ，Ｇｉｒｌｓ！　七人のアイドル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017083574', '劇場版　Ｗａｋｅ　Ｕｐ，Ｇｉｒｌｓ！　七人のアイドル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "Ｇｒｅｅｎ　Ｌｅａｖｅｓ（原作）, 吉岡茉祐（島田真夢）, 青山吉能（七瀬佳乃）, 田中美海（片山実波）, 近岡直（キャラクターデザイン、総作画監督）, 神前暁（音楽）, ＭＯＮＡＣＡ（音楽）", "market_price": 3800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2014-02-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017083574'), '0017083574-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：序（デジタルリマスター版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016141239', 'ヱヴァンゲリヲン新劇場版：序（デジタルリマスター版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 鷺巣詩郎（音楽）", "market_price": 4800, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2009-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016141239'), '0016141239-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016141239'), '0016141239-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヱヴァンゲリヲン新劇場版：序（デジタルリマスター版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016141238', 'ヱヴァンゲリヲン新劇場版：序（デジタルリマスター版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（原作、脚本、総監督）, 緒方恵美（碇シンジ）, 林原めぐみ（綾波レイ）, 三石琴乃（葛城ミサト）, 鷺巣詩郎（音楽）", "market_price": 5800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2009-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016141238'), '0016141238-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016141238'), '0016141238-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016141238'), '0016141238-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　３ｒｄ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017316902', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　３ｒｄ　ＳＴＡＧＥ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 6800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2014-06-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017316902'), '0017316902-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017316902'), '0017316902-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　7ｔｈ　ＳＴＡＧＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020172599', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　7ｔｈ　ＳＴＡＧＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤／鈴村健一／谷山紀章", "market_price": 9000, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2022-07-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＤＲＡＧＯＮ　ＢＡＬＬ　Ｚ　ＤＶＤ－ＢＯＸ　ＤＲＡＧＯＮ　ＢＯＸ　Ｚ編　ＶＯＬ．２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001363745', 'ＤＲＡＧＯＮ　ＢＡＬＬ　Ｚ　ＤＶＤ－ＢＯＸ　ＤＲＡＧＯＮ　ＢＯＸ　Ｚ編　ＶＯＬ．２', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯、孫悟天）, 鶴ひろみ（ブルマ）, 宮内幸平（亀仙人）, 古谷徹（ヤムチャ）, 田中真弓（クリリン）, 鈴置洋孝（天津飯）, 古川登志夫（ピッコロ）", "market_price": 100000, "buyback_price": 10000, "publisher": "ＤＶＤ", "saledate": "2003-09-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001363745'), '0001363745-U01', 35000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 「すずめの戸締まり」コレクターズ・エディション（初回生産限定版）（４Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４Ｋ　ＵＬＴＲＡ　ＨＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020144951', '「すずめの戸締まり」コレクターズ・エディション（初回生産限定版）（４Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４Ｋ　ＵＬＴＲＡ　ＨＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作）, 原菜乃華, 松村北斗, 深津絵里, 染谷将太, 田中将賀, ＲＡＤＷＩＭＰＳ, 陣内一真", "market_price": 13000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2023-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144951'), '0020144951-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144951'), '0020144951-U02', 3400, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144951'), '0020144951-U03', 2800, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 化物語　第一巻　ひたぎクラブ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016206590', '化物語　第一巻　ひたぎクラブ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "西尾維新（原作）, 神谷浩史（阿良々木暦）, 斎藤千和（戦場ヶ原ひたぎ）, 堀江由衣（羽川翼）, 渡辺明夫（キャラクターデザイン、総作画監督）, 神前暁（音楽）", "market_price": 7000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-09-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ピオフィオーレの晩鐘　～Ｖａｃａｎｚａ　Ｂｕｒｌｏｎｅ～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019450902', 'ピオフィオーレの晩鐘　～Ｖａｃａｎｚａ　Ｂｕｒｌｏｎｅ～', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "石川界人／森久保祥太郎　岡本信彦／木村良平／豊永利行／ＳＨＯＪＩ", "market_price": 5900, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2020-09-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019450902'), '0019450902-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 「天気の子」Ｂｌｕ－ｒａｙ　スタンダード・エディション（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019386861', '「天気の子」Ｂｌｕ－ｒａｙ　スタンダード・エディション（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作、監督、脚本）, 醍醐虎汰朗, 森七菜, 本田翼, 田中将賀（キャラクターデザイン）, ＲＡＤＷＩＭＰＳ（音楽）", "market_price": 4800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2020-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019386861'), '0019386861-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019386861'), '0019386861-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019386861'), '0019386861-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＳＥＥＤ　ＦＲＥＥＤＯＭ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020333360', '機動戦士ガンダムＳＥＥＤ　ＦＲＥＥＤＯＭ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇, 富野由悠季, 保志総一朗, 田中理恵, 石田彰, 福田己津央, 平井久司, 佐橋俊彦", "market_price": 3636, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2024-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020333360'), '0020333360-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001367933', 'ＮＥＯＮ　ＧＥＮＥＳＩＳ　ＥＶＡＮＧＥＬＩＯＮ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（監督）", "market_price": 39800, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2003-06-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001367933'), '0001367933-U01', 5900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001367933'), '0001367933-U02', 5015, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＳＴＡＮＤＡＲＤ　ＥＤＩＴＩＯＮ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020174714', '映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＳＴＡＮＤＡＲＤ　ＥＤＩＴＩＯＮ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井上雄彦, 仲村宗悟, 笠間淳, 神尾晋一郎, 木村昴, 江原康之, 武部聡志, ＴＡＫＵＭＡ", "market_price": 5000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2024-02-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020174714'), '0020174714-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020696192', '劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康, ブロッコリー, 森久保祥太郎, 鈴木達央, 蒼井翔太, 関暁子, 藤岡真紀, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ", "market_price": 7500, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2025-12-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020696192'), '0020696192-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020696192'), '0020696192-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 君の名は。スタンダード・エディション（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018869161', '君の名は。スタンダード・エディション（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作、脚本、監督）, 神木隆之介, 上白石萌音, 成田凌, 田中将賀（キャラクターデザイン）, ＲＡＤＷＩＭＰＳ（音楽）", "market_price": 4800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2017-07-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018869161'), '0018869161-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018869161'), '0018869161-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（初回限定版）（２Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４Ｋ　ＵＬＴＲＡ　ＨＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019903091', 'シン・エヴァンゲリオン劇場版　ＥＶＡＮＧＥＬＩＯＮ：３．０＋１．１１　ＴＨＲＩＣＥ　ＵＰＯＮ　Ａ　ＴＩＭＥ（初回限定版）（２Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４Ｋ　ＵＬＴＲＡ　ＨＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明, 緒方恵美, 林原めぐみ, 宮村優子, 鶴巻和哉, 中山勝一, 前田真宏, 鷺巣詩郎", "market_price": 9800, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2023-03-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019903091'), '0019903091-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 「すずめの戸締まり」スタンダード・エディション
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020144953', '「すずめの戸締まり」スタンダード・エディション', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作）, 原菜乃華, 松村北斗, 深津絵里, 染谷将太, 田中将賀, ＲＡＤＷＩＭＰＳ, 陣内一真", "market_price": 4000, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2023-09-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144953'), '0020144953-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144953'), '0020144953-U02', 2635, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144953'), '0020144953-U03', 2170, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 涼宮ハルヒの憂鬱　ブルーレイコンプリートＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016408104', '涼宮ハルヒの憂鬱　ブルーレイコンプリートＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "谷川流（原作、構成）, アニメ, 平野綾（涼宮ハルヒ）, 杉田智和（キョン）, 茅原実里（長門有希）, 池田晶子（キャラクターデザイン）", "market_price": 38000, "buyback_price": 2546, "publisher": "ＤＶＤ", "saledate": "2010-11-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016408104'), '0016408104-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016408104'), '0016408104-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016408104'), '0016408104-U03', 4760, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＬＩＶＥ　ＦＵＴＵＲＥ　２０１８
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019577658', 'うたの☆プリンスさまっ♪　ＱＵＡＲＴＥＴ　ＮＩＧＨＴ　ＬＩＶＥ　ＦＵＴＵＲＥ　２０１８', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "森久保祥太郎, 鈴木達央, 蒼井翔太, 前野智昭", "market_price": 8000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2019-06-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: サマーウォーズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016277658', 'サマーウォーズ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "細田守（監督）, 神木隆之介（小磯健二）, 桜庭ななみ（篠原夏希）, 貞本義行（キャラクターデザイン）, 松本晃彦（音楽）", "market_price": 4800, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2010-03-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016277658'), '0016277658-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016277658'), '0016277658-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016277658'), '0016277658-U03', 504, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版　アニメイト特装版（ＱＵＡＲＴＥＴ　ＮＩＧＨＴバージョン）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019821852', '劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版　アニメイト特装版（ＱＵＡＲＴＥＴ　ＮＩＧＨＴバージョン）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康（原作）, ブロッコリー（原作）, 寺島拓篤（一十木音也）, 鈴村健一（聖川真斗）, 谷山紀章（四ノ宮那月）, 吉田丈司（総監督）, 倉花千夏（キャラクターデザイン原案）, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ（音楽）", "market_price": 11500, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2019-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版　新世紀エヴァンゲリオン　ＤＴＳ　ＣＯＬＬＥＣＴＯＲＥ’Ｓ　Ｅｄｉｔｉｏｎ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010006544', '劇場版　新世紀エヴァンゲリオン　ＤＴＳ　ＣＯＬＬＥＣＴＯＲＥ’Ｓ　Ｅｄｉｔｉｏｎ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明（企画、脚本、総監督、原作）, 貞本義行（キャラクターデザイン）, 鷺巣詩郎（音楽）, 緒方恵美（碇シンジ）, 三石琴乃（葛城ミサト）, 山口由里子（赤木リツコ）, 林原めぐみ（綾波レイ）, 宮村優子（惣流・アスカ・ラングレー）", "market_price": 7800, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2004-11-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010006544'), '0010006544-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010006544'), '0010006544-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010006544'), '0010006544-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: モノノ怪　弐之巻「海坊主」
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015598656', 'モノノ怪　弐之巻「海坊主」', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "橋本敬史（キャラクターデザイン、総作画監督）, 櫻井孝宏, ゆかな", "market_price": 5700, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2007-11-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015598656'), '0015598656-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　空の境界　未来福音（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017081117', '劇場版　空の境界　未来福音（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "奈須きのこ（原作）, 坂本真綾（両儀式）, 鈴村健一（黒桐幹也）, 本田貴子（蒼崎橙子）, 須藤友徳（キャラクターデザイン、作画監督）, 梶浦由記（音楽）", "market_price": 12000, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2014-02-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017081117'), '0017081117-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017081117'), '0017081117-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017081117'), '0017081117-U03', 3500, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ファイナルファンタジーⅦ　アドベントチルドレン（初回限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010451928', 'ファイナルファンタジーⅦ　アドベントチルドレン（初回限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "野村哲也（ディレクター）, 野末武志（ＣＧディレクター）, 櫻井孝宏（クラウド）, 森川智之（セフィロス）", "market_price": 4571, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-09-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010451928'), '0010451928-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: おそ松さんｏｎ　ＳＴＡＧＥ　Ｆ６　２ｎｄ　ＬＩＶＥツアー「ＦＡＮＴＡＳＴＩＣ　ＥＣＳＴＡＳＹ」豪華ＥＣＳＴＡＳＹ版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019418921', 'おそ松さんｏｎ　ＳＴＡＧＥ　Ｆ６　２ｎｄ　ＬＩＶＥツアー「ＦＡＮＴＡＳＴＩＣ　ＥＣＳＴＡＳＹ」豪華ＥＣＳＴＡＳＹ版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井澤勇貴、和田雅成、小野健斗、安里勇哉、和合真一、中山優貴", "market_price": 9800, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2020-07-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ラブライブ！サンシャイン！！　２ｎｄ　Ｓｅａｓｏｎ　１（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018945743', 'ラブライブ！サンシャイン！！　２ｎｄ　Ｓｅａｓｏｎ　１（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇（原作）, 伊波杏樹（高海千歌）, 逢田梨香子（桜内梨子）, 諏訪ななか（松浦果南）, 室田雄平（キャラクターデザイン）, 加藤達也（音楽）", "market_price": 4500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2017-12-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 艦隊これくしょん　－艦これ－　第５巻（限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017272731', '艦隊これくしょん　－艦これ－　第５巻（限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＤＭＭ．ｃｏｍ（原作）, ＫＡＤＯＫＡＷＡ　ＧＡＭＥＳ（原作）, 上坂すみれ, 藤田咲, 井口裕香, 井出直美（キャラクターデザイン、総作画監督）, 松本麻友子（キャラクターデザイン、総作画監督）, 亀岡夏海（音楽）", "market_price": 7600, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2015-07-31"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版　魔法少女まどか☆マギカ［前編］始まりの物語／［後編］永遠の物語（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016988181', '劇場版　魔法少女まどか☆マギカ［前編］始まりの物語／［後編］永遠の物語（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "Ｍａｇｉｃａ　Ｑｕａｒｔｅｔ（原作）, 悠木碧（鹿目まどか）, 斎藤千和（暁美ほむら）, 水橋かおり（巴マミ）, 岸田隆宏（キャラクターデザイン）, 谷口淳一郎（キャラクターデザイン）, 梶浦由記（音楽）", "market_price": 11000, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2013-07-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016988181'), '0016988181-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016988181'), '0016988181-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016988181'), '0016988181-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＳＴＡＮＤＡＲＤ　ＥＤＩＴＩＯＮ（通常版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020174716', '映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＳＴＡＮＤＡＲＤ　ＥＤＩＴＩＯＮ（通常版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井上雄彦, 仲村宗悟, 笠間淳, 神尾晋一郎, 木村昴, 江原康之, 武部聡志, ＴＡＫＵＭＡ", "market_price": 4000, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2024-02-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020174716'), '0020174716-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版ＮＡＲＵＴＯ－ナルト－疾風伝（完全生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015716357', '劇場版ＮＡＲＵＴＯ－ナルト－疾風伝（完全生産限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岸本斉史（原作）, 竹内順子（うずまきナルト）, 中村千絵（春野サクラ）, 西尾鉄也（キャラクターデザイン）, 高梨康治（音楽）, 刃－ｙａｉｂａ－（音楽）", "market_price": 4700, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2008-04-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015716357'), '0015716357-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｆａｔｅ／Ｚｅｒｏ　Ｂｌｕ－ｒａｙ　Ｄｉｓｃ　Ｂｏｘ　Ⅰ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016731609', 'Ｆａｔｅ／Ｚｅｒｏ　Ｂｌｕ－ｒａｙ　Ｄｉｓｃ　Ｂｏｘ　Ⅰ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "虚淵玄（原作）, ＴＹＰＥ－ＭＯＯＮ（原作）, 小山力也（衛宮切嗣）, 川澄綾子（セイバー）, 須藤友徳（キャラクターデザイン）, 碇谷敦（キャラクターデザイン）, 梶浦由記（音楽）", "market_price": 38000, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2012-03-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016731609'), '0016731609-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016731609'), '0016731609-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016731609'), '0016731609-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場アニメーション　言の葉の庭（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016977525', '劇場アニメーション　言の葉の庭（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作、脚本、監督）, 入野自由（秋月孝雄（タカオ））, 花澤香菜（雪野由香里（ユキノ））, 土屋賢一（キャラクターデザイン、作画監督）, 柏大輔（音楽）", "market_price": 5800, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2013-06-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016977525'), '0016977525-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016977525'), '0016977525-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016977525'), '0016977525-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019353332', '劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥキングダム　初回限定版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康（原作）, ブロッコリー（原作）, 寺島拓篤（一十木音也）, 鈴村健一（聖川真斗）, 谷山紀章（四ノ宮那月）, 吉田丈司（総監督）, 倉花千夏（キャラクターデザイン原案）, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ（音楽）", "market_price": 8500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2019-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019353332'), '0019353332-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019353332'), '0019353332-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＴＶアニメ「中二病でも恋がしたい！戀」Ｂｌｕ－ｒａｙ　ＢＯＸ（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018675270', 'ＴＶアニメ「中二病でも恋がしたい！戀」Ｂｌｕ－ｒａｙ　ＢＯＸ（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "虎虎（原作）, 福山潤（富樫勇太）, 内田真礼（小鳥遊六花）, 赤﨑千夏（丹生谷森夏）, 池田和美（キャラクターデザイン、総作画監督）, 虹音（音楽）", "market_price": 25000, "buyback_price": 5182, "publisher": "ＤＶＤ", "saledate": "2016-08-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018675270'), '0018675270-U01', 14500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ちいかわ　２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019904671', 'ちいかわ　２', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ナガノ, 青木遥, 田中誠人, 小澤亜李, 井口裕香, 杉田智和, 東地宏樹, トクマルシューゴ", "market_price": 2500, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2023-03-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019904671'), '0019904671-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019904671'), '0019904671-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＳＥＥＤ　ＤＥＳＴＩＮＹ　スペシャルエディション完結編　自由の代償
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015122790', '機動戦士ガンダムＳＥＥＤ　ＤＥＳＴＩＮＹ　スペシャルエディション完結編　自由の代償', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野由悠季, 平井久司（キャラクターデザイン）, 鈴村健一（シン・アスカ）, 保志総一朗（キラ・ヤマト）", "market_price": 4800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2007-02-23", "group_name": "【ＤＶＤ】機動戦士ガンダムＳＥＥＤ　ＤＥＳＴＩＮＹ　スペシャルエディション　全"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015122790'), '0015122790-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015122790'), '0015122790-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015122790'), '0015122790-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 異世界魔王と召喚少女の奴隷魔術　Ｖｏｌ．１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019097017', '異世界魔王と召喚少女の奴隷魔術　Ｖｏｌ．１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（オムニバス）, むらさきゆきや（原作）, 水中雅章（ディアヴロ）, 芹澤優（シェラ・Ｌ・グリーンウッド）, 和氣あず未（レム・ガレウ）, 金子志津枝（キャラクターデザイン）, 加藤裕介（音楽）", "market_price": 14000, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2018-09-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＴＨＥ　ＬＡＳＴ－ＮＡＲＵＴＯ　ＴＨＥ　ＭＯＶＩＥ－（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017318499', 'ＴＨＥ　ＬＡＳＴ－ＮＡＲＵＴＯ　ＴＨＥ　ＭＯＶＩＥ－（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岸本斉史（原作、キャラクターデザイン、ストーリー総監修）, 竹内順子（うずまきナルト）, 中村千絵（春野サクラ）, 森久保祥太郎（奈良シカマル）, 西尾鉄也（キャラクターデザイン、総作画監督）, 鈴木博文（キャラクターデザイン、総作画監督）, 高梨康治（音楽）, 刃－ｙａｉｂａ－（音楽）", "market_price": 6000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2015-07-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318499'), '0017318499-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318499'), '0017318499-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318499'), '0017318499-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ｓｅｒｉａｌ　ｅｘｐｅｒｉｍｅｎｔｓ　ｌａｉｎ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017392773', 'ｓｅｒｉａｌ　ｅｘｐｅｒｉｍｅｎｔｓ　ｌａｉｎ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "安倍吉俊（オリジナルキャラクターデザイン）, 清水香里（岩倉玲音）, 大林隆之介（父・岩倉康雄）, 五十嵐麗（母・岩倉美穂）, 岸田隆宏（キャラクターデザイン）", "market_price": 13000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2015-10-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版　ＢＬＥＡＣＨ　ＭＥＭＯＲＩＥＳ　ＯＦ　ＮＯＢＯＤＹ（完全生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015318079', '劇場版　ＢＬＥＡＣＨ　ＭＥＭＯＲＩＥＳ　ＯＦ　ＮＯＢＯＤＹ（完全生産限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "久保帯人（原作）, 阿部記之（監督）, 森田成一（黒崎一護）, 斎藤千和（茜雫）", "market_price": 8000, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2007-09-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 幽☆遊☆白書　２５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　Ｂｌｕ－ｒａｙ　ＢＯＸ　霊界探偵編（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018976645', '幽☆遊☆白書　２５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　Ｂｌｕ－ｒａｙ　ＢＯＸ　霊界探偵編（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "冨樫義博（原作）, 佐々木望（浦飯幽助）, 千葉繁（桑原和真）, 緒方恵美（蔵馬）, 北山真理（キャラクターデザイン）, 大西雅也（キャラクターデザイン）, 山沢実（キャラクターデザイン）, 本間勇輔（音楽）", "market_price": 18000, "buyback_price": 3364, "publisher": "ＤＶＤ", "saledate": "2018-07-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018976645'), '0018976645-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018976645'), '0018976645-U02', 7650, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動警察パトレイバー　劇場版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015871760', '機動警察パトレイバー　劇場版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "押井守（監督）, ヘッドギア（企画、原作）, 冨永みーな（泉野明）, 古川登志夫（篠原遊馬）, 大林隆介（後藤喜一）, 榊原良子（南雲しのぶ）, 高田明美（キャラクターデザイン）, 川井憲次（音楽）", "market_price": 7800, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2008-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015871760'), '0015871760-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015871760'), '0015871760-U02', 3400, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　魔法科高校の劣等生　星を呼ぶ少女（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018942396', '劇場版　魔法科高校の劣等生　星を呼ぶ少女（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "佐島勤（原作、脚本）, 石田可奈（原作イラスト、キャラクターデザイン、総作画監督）, 中村悠一（司波達也）, 早見沙織（司波深雪）, 内山夕実（千葉エリカ）, ジミー・ストーン（ＣＡＤ、サブキャラクターデザイン）, 岩崎琢（音楽）", "market_price": 8800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2018-01-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018942396'), '0018942396-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018942396'), '0018942396-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018942396'), '0018942396-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＬＡＭ　ＤＵＮＫ　ＤＶＤ－ＢＯＸ　桜木花道「１０」仕様
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001362981', 'ＳＬＡＭ　ＤＵＮＫ　ＤＶＤ－ＢＯＸ　桜木花道「１０」仕様', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井上雄彦（原作）", "market_price": 88000, "buyback_price": 18182, "publisher": "ＤＶＤ", "saledate": "2003-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001362981'), '0001362981-U01', 39000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 幽☆遊☆白書　２５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　Ｂｌｕ－ｒａｙ　ＢＯＸ　仙水編（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018976647', '幽☆遊☆白書　２５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　Ｂｌｕ－ｒａｙ　ＢＯＸ　仙水編（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "冨樫義博（原作）, 佐々木望（浦飯幽助）, 千葉繁（桑原和真）, 緒方恵美（蔵馬）, 北山真理（キャラクターデザイン）, 大西雅也（キャラクターデザイン）, 山沢実（キャラクターデザイン）, 本間勇輔（音楽）", "market_price": 17000, "buyback_price": 3364, "publisher": "ＤＶＤ", "saledate": "2018-09-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018976647'), '0018976647-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　ＰＳＹＣＨＯ－ＰＡＳＳ　サイコパス　Ｐｒｅｍｉｕｍ　Ｅｄｉｔｉｏｎ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017318392', '劇場版　ＰＳＹＣＨＯ－ＰＡＳＳ　サイコパス　Ｐｒｅｍｉｕｍ　Ｅｄｉｔｉｏｎ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "恩田尚之（キャラクターデザイン、総作画監督）, 浅野恭司（キャラクターデザイン）, 花澤香菜（常守朱）, 野島健児（宜野座伸元）, 佐倉綾音（霜月美佳）, 菅野祐悟（音楽）", "market_price": 8800, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2015-07-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318392'), '0017318392-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318392'), '0017318392-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017318392'), '0017318392-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ひぐらしのなく頃に解　捜査録－結－ｆｉｌｅ．０１（初回限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015764407', 'ひぐらしのなく頃に解　捜査録－結－ｆｉｌｅ．０１（初回限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "竜騎士０７（原作）, 保志総一朗（前原圭一）, 中原麻衣（竜宮レナ）, 雪野五月（園崎魅音、詩音）, 坂井久太（キャラクターデザイン、総作画監督）, 川井憲次（音楽）", "market_price": 6600, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2008-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＴＶアニメ『ガールズバンドクライ』　Ｖｏｌ．４（豪華限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020298358', 'ＴＶアニメ『ガールズバンドクライ』　Ｖｏｌ．４（豪華限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "東映アニメーション, 理名, 夕莉, 美怜, 凪都, 朱李, 手島ｎａｒｉ, 田中ユウスケ", "market_price": 7000, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2024-09-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298358'), '0020298358-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020298358'), '0020298358-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 映画「ノーゲーム・ノーライフ　ゼロ」（限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018965828', '映画「ノーゲーム・ノーライフ　ゼロ」（限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "榎宮祐（原作、キャラクター原案）, 松岡禎丞（リク）, 茅野愛衣（シュヴィ）, 日笠陽子（コローネ・ドーラ）, 田﨑聡（キャラクターデザイン、総作画監督）, 藤澤慶昌（音楽）", "market_price": 10000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2018-02-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018965828'), '0018965828-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018965828'), '0018965828-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018965828'), '0018965828-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＵＣ　７（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017078930', '機動戦士ガンダムＵＣ　７（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野由悠季（原作）, 内山昂輝（バナージ・リンクス）, 藤村歩（オードリー・バーン）, 甲斐田裕子（マリーダ・クルス）, 高橋久美子（アニメーションキャラクターデザイン）, 澤野弘之（音楽）", "market_price": 9800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2014-06-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017078930'), '0017078930-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017078930'), '0017078930-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017078930'), '0017078930-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 宇宙戦士バルディオス　ＤＶＤ－ＢＯＸ２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001227138', '宇宙戦士バルディオス　ＤＶＤ－ＢＯＸ２', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "広川和之", "market_price": 15000, "buyback_price": 4819, "publisher": "ＤＶＤ", "saledate": "2001-02-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: らき☆すた１（初回限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015198379', 'らき☆すた１（初回限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "美水かがみ（原作）, 堀口悠紀子（キャラクターデザイン）, 平野綾（泉こなた）, 加藤英美里（柊かがみ）", "market_price": 6600, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2007-06-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015198379'), '0015198379-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　Ｅｔｅｒｎａｌ　Ｌｏｇ　“ＥＡＳＴ　ＢＬＵＥ”（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019533315', 'ＯＮＥ　ＰＩＥＣＥ　Ｅｔｅｒｎａｌ　Ｌｏｇ　“ＥＡＳＴ　ＢＬＵＥ”（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "尾田栄一郎（原作）, 田中真弓（ルフィ）, 岡村明美（ナミ）, 中井和哉（ゾロ）, 山口勝平（ウソップ）, 小泉昇（キャラクターデザイン）, 田中公平（音楽）, 浜口史郎（音楽）", "market_price": 18000, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2021-01-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019533315'), '0019533315-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019533315'), '0019533315-U02', 3825, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019533315'), '0019533315-U03', 3150, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥスターリッシュツアーズ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019937168', '劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥスターリッシュツアーズ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康, ブロッコリー, 寺島拓篤, 鈴村健一, 谷山紀章, 永岡智佳, 藤岡真紀, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ", "market_price": 9000, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2023-03-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019937168'), '0019937168-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019937168'), '0019937168-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019937168'), '0019937168-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｘ－エックス－　０１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001238716', 'Ｘ－エックス－　０１', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＣＬＡＭＰ, 川尻善昭（脚本、絵コンテ）, 兼森義則（キャラクターデザイン、総作画監督）, 佐藤直紀, 鈴村健一（司狼神威）, 諏訪部順一（桃生封真）, 能登麻美子（桃生小鳥）, 久川綾（丁）", "market_price": 5000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2002-02-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001238716'), '0001238716-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　ソードアート・オンライン　－プログレッシブ－　星なき夜のアリア（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019820456', '劇場版　ソードアート・オンライン　－プログレッシブ－　星なき夜のアリア（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "川原礫（原作）, ａｂｅｃ（原作イラスト、キャラクターデザイン原案）, 松岡禎丞（キリト、桐ヶ谷和人）, 戸松遥（アスナ、結城明日奈）, 水瀬いのり（ミト、兎沢深澄）, 河野亜矢子（監督）, 戸谷賢都（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）", "market_price": 9000, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2022-07-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019820456'), '0019820456-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019820456'), '0019820456-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019820456'), '0019820456-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｅａｒ　Ｇｉｒｌ～Ｓｔｏｒｉｅｓ～　Ｆｅｓｔｉｖａｌ　Ｃａｒｎｉｖａｌ　Ｍａｔｓｕｒｉ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019909155', 'Ｄｅａｒ　Ｇｉｒｌ～Ｓｔｏｒｉｅｓ～　Ｆｅｓｔｉｖａｌ　Ｃａｒｎｉｖａｌ　Ｍａｔｓｕｒｉ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "神谷浩史／小野大輔", "market_price": 8096, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2013-09-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019909155'), '0019909155-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥスターリッシュツアーズ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019937169', '劇場版　うたの☆プリンスさまっ♪　マジＬＯＶＥスターリッシュツアーズ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康, ブロッコリー, 寺島拓篤, 鈴村健一, 谷山紀章, 永岡智佳, 藤岡真紀, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ", "market_price": 7000, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2023-03-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019937169'), '0019937169-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019937169'), '0019937169-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プラネテス　４
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001502274', 'プラネテス　４', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "幸村誠（原作）, 谷口悟朗（監督）, 大河内一楼（脚本）, 千羽由利子（キャラクターデザイン）, 田中一成（ハチマキ）, 雪野五月（タナベ）, 折笠愛（フィー）, 子安武人（ユーリ）", "market_price": 6000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2004-07-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001502274'), '0001502274-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: あんさんぶるスターズ！　私立夢ノ咲学院ドリームフェスティバル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018790913', 'あんさんぶるスターズ！　私立夢ノ咲学院ドリームフェスティバル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "あんさんぶるスターズ！, （趣味／教養）, 増田俊樹, 細貝圭, 緑川光, 橋本晃太朗, 村瀬歩, 浅沼晋太郎, 山下大輝", "market_price": 7000, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2017-03-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018790913'), '0018790913-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018790913'), '0018790913-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔入りました！入間くん　第２シリーズ　Ｂｌｕ－ｒａｙ　ＢＯＸ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019631530', '魔入りました！入間くん　第２シリーズ　Ｂｌｕ－ｒａｙ　ＢＯＸ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（オムニバス）, 西修（原作）, 村瀬歩（鈴木入間）, 木村良平（アスモデウス・アリス）, 朝井彩加（ウァラク・クララ）, 佐野聡彦（キャラクターデザイン）, 山本径子（キャラクターデザイン）, 本間昭光（音楽）", "market_price": 25000, "buyback_price": 3091, "publisher": "ＤＶＤ", "saledate": "2021-08-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019631530'), '0019631530-U01', 11500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＨＩＲＯＢＡＫＯ　第７巻（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017246069', 'ＳＨＩＲＯＢＡＫＯ　第７巻（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "武蔵野アニメーション（原作）, 木村珠莉（宮森あおい）, 佳村はるか（安原絵麻）, 千菅春香（坂木しずか）, 関口可奈味（キャラクターデザイン）, 浜口史郎（音楽）", "market_price": 11800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2015-07-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: テニスの王子様　Ｏｒｉｇｉｎａｌ　Ｖｉｄｅｏ　Ａｎｉｍａｔｉｏｎ　全国大会篇　ＦＡＮ　ＤＩＳＣ　Ｗｈｉｔｅ　ｈｅａｔ　Ｒｅｍｉｘ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015639008', 'テニスの王子様　Ｏｒｉｇｉｎａｌ　Ｖｉｄｅｏ　Ａｎｉｍａｔｉｏｎ　全国大会篇　ＦＡＮ　ＤＩＳＣ　Ｗｈｉｔｅ　ｈｅａｔ　Ｒｅｍｉｘ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "許斐剛（原作）", "market_price": 2500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2007-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015639008'), '0015639008-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鬼滅の刃　遊郭編　５（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019791996', '鬼滅の刃　遊郭編　５（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 松岡禎丞（嘴平伊之助）, 松島晃（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 6500, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2022-06-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019791996'), '0019791996-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 魔入りました！入間くん　５（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019346476', '魔入りました！入間くん　５（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（オムニバス）, 西修（原作）, 村瀬歩（鈴木入間）, 木村良平（アスモデウス）, 朝井彩加（クララ）, 佐野聡彦（キャラクターデザイン）, 山本径子（キャラクターデザイン）, 本間昭光（音楽）", "market_price": 9800, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2020-04-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019346476'), '0019346476-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＤＲＡＧＯＮ　ＢＡＬＬ　ＤＶＤ　ＢＯＸ　ＤＲＡＧＯＮ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001446237', 'ＤＲＡＧＯＮ　ＢＡＬＬ　ＤＶＤ　ＢＯＸ　ＤＲＡＧＯＮ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）", "market_price": 100000, "buyback_price": 18182, "publisher": "ＤＶＤ", "saledate": "2004-07-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001446237'), '0001446237-U01', 39000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＦＩＮＡＬ　ＦＡＮＴＡＳＹ　Ⅶ　ＡＤＶＥＮＴ　ＣＨＩＬＤＲＥＮ　ＣＯＭＰＬＥＴＥ／ＦＩＮＡＬ　ＦＡＮＴＡＳＹ　ⅩⅢ　体験版同梱限定パッケージ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016117039', 'ＦＩＮＡＬ　ＦＡＮＴＡＳＹ　Ⅶ　ＡＤＶＥＮＴ　ＣＨＩＬＤＲＥＮ　ＣＯＭＰＬＥＴＥ／ＦＩＮＡＬ　ＦＡＮＴＡＳＹ　ⅩⅢ　体験版同梱限定パッケージ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "アニメ", "market_price": 5619, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-04-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016117039'), '0016117039-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016117039'), '0016117039-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 異世界魔王と召喚少女の奴隷魔術　魔王プレイボックス（初回生産限定版）（３Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋ＣＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019564291', '異世界魔王と召喚少女の奴隷魔術　魔王プレイボックス（初回生産限定版）（３Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋ＣＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（オムニバス）, むらさきゆきや（原作）, 水中雅章（ディアヴロ）, 芹澤優（シェラ・Ｌ・グリーンウッド）, 和氣あず未（レム・ガレウ）, 原由実（アリシア・クリステラ）, 金子志津枝（キャラクターデザイン）, 加藤裕介（音楽）", "market_price": 19800, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2021-02-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＫＩＴＥ　ＬＩＢＥＲＡＴＯＲ　限定版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015651149', 'ＫＩＴＥ　ＬＩＢＥＲＡＴＯＲ　限定版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "梅津泰臣（原作、監督、脚本、絵コンテ、演出、キャラクターデザイン、作画監督）, 井上麻里奈（野口百南花）, 小山力也（野口折外）, 石川智久（音楽）", "market_price": 7800, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2008-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ガールズ＆パンツァー　最終章　第１話（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018988512', 'ガールズ＆パンツァー　最終章　第１話（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "杉本功（キャラクターデザイン、総作画監督）, 渕上舞（西住みほ）, 茅野愛衣（武部沙織）, 尾崎真実（五十鈴華）, 浜口史郎（音楽）", "market_price": 7800, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2018-03-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018988512'), '0018988512-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018988512'), '0018988512-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018988512'), '0018988512-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ３×３ＥＹＥＳ　ＢＯＸ（期間限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016379644', '３×３ＥＹＥＳ　ＢＯＸ（期間限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "高田裕三（原作）, アニメ, 林原めぐみ（パイ（三只眼）、綾小路ぱい（パイ））, 辻谷耕史（藤八雲）, 新井浩一（キャラクターデザイン、作画監督）, 熊谷哲矢（キャラクターデザイン、作画監督）, 和田薫（音楽）", "market_price": 16800, "buyback_price": 14546, "publisher": "ＤＶＤ", "saledate": "2010-08-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016379644'), '0016379644-U01', 37000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダム　劇場版メモリアルボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015594935', '機動戦士ガンダム　劇場版メモリアルボックス', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野喜幸, 古谷徹（アムロ・レイ）, 鈴置洋孝（ブライト・ノア）", "market_price": 18000, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2007-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015594935'), '0015594935-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015594935'), '0015594935-U02', 3400, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＬＩＭＩＴＥＤ　ＥＤＩＴＩＯＮ（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋２ＤＶＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020174713', '映画『ＴＨＥ　ＦＩＲＳＴ　ＳＬＡＭ　ＤＵＮＫ』　ＬＩＭＩＴＥＤ　ＥＤＩＴＩＯＮ（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋２ＤＶＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井上雄彦, 仲村宗悟, 笠間淳, 神尾晋一郎, 木村昴, 江原康之, 武部聡志, ＴＡＫＵＭＡ", "market_price": 10500, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2024-02-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020174713'), '0020174713-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020174713'), '0020174713-U02', 3825, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020174713'), '0020174713-U03', 3150, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　ＳＴＥＩＮＳ；ＧＡＴＥ　負荷領域のデジャヴ　超豪華版（初回限定生産版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４ＣＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017031440', '劇場版　ＳＴＥＩＮＳ；ＧＡＴＥ　負荷領域のデジャヴ　超豪華版（初回限定生産版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ＋４ＣＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "志倉千代丸（原作）, ＭＡＧＥＳ．（原作）, ニトロプラス（原作）, 宮野真守（岡部倫太郎）, 花澤香菜（椎名まゆり）, 坂井久太（キャラクターデザイン、総作画監督）, 阿保剛（音楽）, 村上純（音楽）", "market_price": 10000, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2013-12-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017031440'), '0017031440-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017031440'), '0017031440-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＡＲＵＴＯ－ナルト－　ＤＶＤ－ＢＯＸ　Ⅰ　参上！うずまきナルト（完全生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016010528', 'ＮＡＲＵＴＯ－ナルト－　ＤＶＤ－ＢＯＸ　Ⅰ　参上！うずまきナルト（完全生産限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岸本斉史（原作）, 竹内順子（うずまきナルト）, 杉山紀彰（うちはサスケ）", "market_price": 18500, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2009-01-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＢＯＲＵＴＯ　－ＮＡＲＵＴＯ　ＴＨＥ　ＭＯＶＩＥ－（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018581326', 'ＢＯＲＵＴＯ　－ＮＡＲＵＴＯ　ＴＨＥ　ＭＯＶＩＥ－（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岸本斉史（原作、脚本、キャラクターデザイン、制作総指揮）, 三瓶由布子（うずまきボルト）, 菊池こころ（うちはサラダ）, 竹内順子（うずまきナルト）, 西尾鉄也（キャラクターデザイン、総作画監督）, 鈴木博文（キャラクターデザイン）, 高梨康治（音楽）, 刃－ｙａｉｂａ－（音楽）", "market_price": 6000, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2016-07-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018581326'), '0018581326-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－ＭＵＳＩＣ　ＵＮＩＶＥＲＳＥ－
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020265622', 'うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－ＭＵＳＩＣ　ＵＮＩＶＥＲＳＥ－', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＳＴ☆ＲＩＳＨ, ＱＵＡＲＴＥＴ　ＮＩＧＨＴ, ＨＥ★ＶＥＮＳ", "market_price": 7000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2024-10-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265622'), '0020265622-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265622'), '0020265622-U02', 2635, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265622'), '0020265622-U03', 2170, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　あの日見た花の名前を僕達はまだ知らない。（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017079735', '劇場版　あの日見た花の名前を僕達はまだ知らない。（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "超平和バスターズ（原作）, 入野自由（宿海仁太）, 茅野愛衣（本間芽衣子）, 戸松遥（安城鳴子）, 田中将賀（キャラクターデザイン、総作画監督）, ＲＥＭＥＤＩＯＳ（音楽）", "market_price": 9900, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2014-03-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017079735'), '0017079735-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017079735'), '0017079735-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017079735'), '0017079735-U03', 630, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ファイナルファンタジーⅦ　アドベントチルドレン
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010451929', 'ファイナルファンタジーⅦ　アドベントチルドレン', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "野村哲也（ディレクター）, 野末武志（ＣＧディレクター）, 櫻井孝宏（クラウド）, 森川智之（セフィロス）", "market_price": 4571, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-09-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010451929'), '0010451929-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アイドルマスター　シンデレラガールズ　３（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017302410', 'アイドルマスター　シンデレラガールズ　３（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "バンダイナムコエンターテインメント（原作）, 大橋彩香（島村卯月）, 福原綾香（渋谷凛）, 原紗友里（本田未央）, 松尾祐輔（キャラクターデザイン、総作画監督）, 田中秀和（音楽）", "market_price": 7800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2015-07-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＳＥＥＤ　ＨＤリマスター　Ｂｌｕ－ｒａｙ　ＢＯＸ１（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016735897', '機動戦士ガンダムＳＥＥＤ　ＨＤリマスター　Ｂｌｕ－ｒａｙ　ＢＯＸ１（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野由悠季（原作）, 保志総一朗（キラ・ヤマト）, 石田彰（アスラン・ザラ）, 平井久司（キャラクターデザイン）, 佐橋俊彦（音楽）", "market_price": 20000, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2012-03-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016735897'), '0016735897-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016735897'), '0016735897-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016735897'), '0016735897-U03', 1750, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: とある科学の超電磁砲Ｓ　Ｂｌｕ－ｒａｙ　ＢＯＸ＜初回限定生産＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017390169', 'とある科学の超電磁砲Ｓ　Ｂｌｕ－ｒａｙ　ＢＯＸ＜初回限定生産＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鎌池和馬（原作）, 冬川基（原作）, 佐藤利奈（御坂美琴）, 新井里美（白井黒子）, 豊崎愛生（初春飾利）, 灰村キヨタカ（キャラクターデザイン）, Ｉ’ｖｅ　ｓｏｕｎｄ（音楽）, 井内舞子（音楽）", "market_price": 30000, "buyback_price": 5455, "publisher": "ＤＶＤ", "saledate": "2015-11-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017390169'), '0017390169-U01', 19500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017390169'), '0017390169-U02', 16575, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: パーフェクトブルー（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015732563', 'パーフェクトブルー（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "今敏（監督、キャラクターデザイン）, 竹内義和（原作）, 岩男潤子（未麻）, 松本梨香（ルミ）, 辻親八（田所）", "market_price": 8500, "buyback_price": 4819, "publisher": "ＤＶＤ", "saledate": "2008-02-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015732563'), '0015732563-U01', 17500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｘ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001229518', 'Ｘ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＣＬＡＭＰ, りんたろう, 清水靖晃, 関智一（司狼神威）, 岩男潤子（桃生小鳥）, 成田剣（桃生封真）, 山寺宏一（有洙川空汰）, 田中秀幸（蒼軌征一狼）", "market_price": 7800, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2001-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 銀河鉄道９９９　エターナル・ファンタジー
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001379285', '銀河鉄道９９９　エターナル・ファンタジー', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "松本零士, 宇田鋼之介, 武上純希, 田中公平, 加々美高浩（キャラデザイン）, ＴＨＥ　ＡＬＦＥＥ, 野沢雅子, 池田昌子", "market_price": 4500, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2002-10-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001379285'), '0001379285-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001379285'), '0001379285-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001379285'), '0001379285-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＴＶ放映３０周年記念　キャッツ・アイ　２ｎｄ　Ｓｅａｓｏｎ　Ｂｌｕ－ｒａｙ　Ｓｐｅｃｉａｌ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016937345', 'ＴＶ放映３０周年記念　キャッツ・アイ　２ｎｄ　Ｓｅａｓｏｎ　Ｂｌｕ－ｒａｙ　Ｓｐｅｃｉａｌ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "北条司（原作）, 戸田恵子（来生瞳）, 藤田淑子（来生泪）, 坂本千夏（来生愛）, 平山智（作画監督、キャラクターデザイン）, 大谷和夫（音楽）", "market_price": 29000, "buyback_price": 12728, "publisher": "ＤＶＤ", "saledate": "2013-03-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 新・キューティーハニー　コンプリートＢｌｕ－ｒａｙ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017040638', '新・キューティーハニー　コンプリートＢｌｕ－ｒａｙ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "永井豪（原作、キャラクター原案）, 根谷美智子, 松本梨香, 富田耕生", "market_price": 10800, "buyback_price": 4091, "publisher": "ＤＶＤ", "saledate": "2013-12-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017040638'), '0017040638-U01', 11500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版ペルソナ３　＃１　Ｓｐｒｉｎｇ　ｏｆ　Ｂｉｒｔｈ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017118937', '劇場版ペルソナ３　＃１　Ｓｐｒｉｎｇ　ｏｆ　Ｂｉｒｔｈ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＡＴＬＵＳ（原作）, 石田彰（結城理）, 豊口めぐみ（岳羽ゆかり）, 鳥海浩輔（伊織順平）, 渡部圭祐（キャラクターデザイン、アニメーションディレクター）, 目黒将司（音楽）", "market_price": 8000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2014-05-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 攻殻機動隊　ＳＴＡＮＤ　ＡＬＯＮＥ　ＣＯＭＰＬＥＸ　ＤＶＤ－ＢＯＸ（初回限定生産）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015222461', '攻殻機動隊　ＳＴＡＮＤ　ＡＬＯＮＥ　ＣＯＭＰＬＥＸ　ＤＶＤ－ＢＯＸ（初回限定生産）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "士郎正宗（原作、協力）, 神山健治（シリーズ構成、監督）, 下村一（キャラクターデザイン）, 菅野よう子（音楽）, 田中敦子（草薙素子）, 阪脩（荒巻大輔）, 大塚明夫（バトー）, 山寺宏一（トグサ）", "market_price": 40000, "buyback_price": 3091, "publisher": "ＤＶＤ", "saledate": "2007-07-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015222461'), '0015222461-U01', 11500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015222461'), '0015222461-U02', 9775, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　とある魔術の禁書目録－エンデュミオンの奇蹟－特装版（初回限定生産版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017012041', '劇場版　とある魔術の禁書目録－エンデュミオンの奇蹟－特装版（初回限定生産版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鎌池和馬（原作）, 灰村キヨタカ（原作（イラスト））, 阿部敦（上条当麻）, 井口裕香（インデックス）, 佐藤利奈（御坂美琴）, 田中雄一（キャラクターデザイン）, 井内舞子（音楽）, Ｉ’ｖｅ　ｓｏｕｎｄ（音楽）", "market_price": 9800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2013-08-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017012041'), '0017012041-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017012041'), '0017012041-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017012041'), '0017012041-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦艦ナデシコ　［劇場版］ザ・プリンス・オブ・ダークネス〈初回限定・ＢＯＸ付〉
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001219742', '機動戦艦ナデシコ　［劇場版］ザ・プリンス・オブ・ダークネス〈初回限定・ＢＯＸ付〉', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "麻宮騎亜", "market_price": 7500, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "1999-10-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001219742'), '0001219742-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001219742'), '0001219742-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 神のみぞ知るセカイ　女神篇　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017425943', '神のみぞ知るセカイ　女神篇　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "若木民喜（原作）, 下野紘（桂木桂馬）, 伊藤かな恵（エルシィ）, 早見沙織（ハクア）, 渡辺明夫（キャラクターデザイン）, 川村敏江（キャラクターデザイン）, 松尾早人（音楽）", "market_price": 19000, "buyback_price": 12728, "publisher": "ＤＶＤ", "saledate": "2015-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017425943'), '0017425943-U01', 32000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020696131', '劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康, ブロッコリー, 森久保祥太郎, 鈴木達央, 蒼井翔太, 関暁子, 藤岡真紀, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ", "market_price": 9500, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2025-12-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020696131'), '0020696131-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 楽園追放　Ｅｘｐｅｌｌｅｄ　ｆｒｏｍ　Ｐａｒａｄｉｓｅ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017223107', '楽園追放　Ｅｘｐｅｌｌｅｄ　ｆｒｏｍ　Ｐａｒａｄｉｓｅ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ニトロプラス（原作）, 東映アニメーション株式会社（原作）, 釘宮理恵（アンジェラ　バルザック）, 三木眞一郎（ディンゴ（ザリク　カジワラ））, 神谷浩史（フロンティアセッター）, 齋藤将嗣（キャラクターデザイン）, ＮＡＲＡＳＡＫＩ（音楽）", "market_price": 4800, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2014-12-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017223107'), '0017223107-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017223107'), '0017223107-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版ソードアート・オンライン－プログレッシブ－冥き夕闇のスケルツォ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020057217', '劇場版ソードアート・オンライン－プログレッシブ－冥き夕闇のスケルツォ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "川原礫, ａｂｅｃ, 戸松遥, 松岡禎丞, 水瀬いのり, 河野亜矢子, 戸谷賢都, 梶浦由記", "market_price": 9000, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2023-05-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020057217'), '0020057217-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020057217'), '0020057217-U02', 2890, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020057217'), '0020057217-U03', 2380, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＵＣ　４（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016673951', '機動戦士ガンダムＵＣ　４（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野由悠季（原案）, 内山昂輝（バナージ・リンクス）, 藤村歩（オードリー・バーン）, 甲斐田裕子（マリーダ・クルス）, 高橋久美子（アニメーションキャラクターデザイン）, 澤野弘之（音楽）", "market_price": 5800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-12-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016673951'), '0016673951-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ハイスクール・フリート　５．１ｃｈ　Ｂｌｕ－ｒａｙ　Ｄｉｓｃ　ＢＯＸ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019234830', 'ハイスクール・フリート　５．１ｃｈ　Ｂｌｕ－ｒａｙ　Ｄｉｓｃ　ＢＯＸ（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "中村直人（キャラクターデザイン、総作画監督）, 夏川椎菜（岬明乃）, Ｌｙｎｎ（宗谷ましろ）, 古木のぞみ（立石志摩）, 小森茂生（音楽）", "market_price": 25000, "buyback_price": 5182, "publisher": "ＤＶＤ", "saledate": "2019-12-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019234830'), '0019234830-U01', 14500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019234830'), '0019234830-U02', 12325, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール改　魔人ブウ編　ＤＶＤ－ＢＯＸ４
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017306886', 'ドラゴンボール改　魔人ブウ編　ＤＶＤ－ＢＯＸ４', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯、孫悟天）, 堀川りょう（ベジータ）, 古川登志夫（ピッコロ）, 住友紀人（音楽）", "market_price": 11200, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2015-06-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ペルソナ４　３（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016711408', 'ペルソナ４　３（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "森田和明（キャラクターデザイン）, 浪川大輔（鳴上悠）, 森久保祥太郎（花村陽介）, 堀江由衣（里中千枝）, 目黒将司（音楽）", "market_price": 7600, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2012-01-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 超時空要塞マクロス　Ｂｌｕ－ｒａｙ　Ｂｏｘ　Ｃｏｍｐｌｅｔｅ　Ｅｄｉｔｉｏｎ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016776498', '超時空要塞マクロス　Ｂｌｕ－ｒａｙ　Ｂｏｘ　Ｃｏｍｐｌｅｔｅ　Ｅｄｉｔｉｏｎ（初回限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "スタジオぬえ（原作）, 長谷有洋（一条輝）, 飯島真理（リン・ミンメイ）, 美樹本晴彦（キャラクターデザイン）, 羽田健太郎（音楽）", "market_price": 45000, "buyback_price": 20000, "publisher": "ＤＶＤ", "saledate": "2012-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　５ｔｈ　ＳＴＡＧＥ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018997725', 'うたの☆プリンスさまっ♪　マジＬＯＶＥＬＩＶＥ　５ｔｈ　ＳＴＡＧＥ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "寺島拓篤, 鈴村健一, 前野智昭, 谷山紀章, 宮野真守, 諏訪部順一, 下野紘, 鳥海浩輔, 森久保祥太郎, 鈴木達央, 蒼井翔太", "market_price": 7000, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2016-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018997725'), '0018997725-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018997725'), '0018997725-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鬼滅の刃　遊郭編　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019776375', '鬼滅の刃　遊郭編　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 下野紘（我妻善逸）, 松岡禎丞（嘴平伊之助）, 松島晃（キャラクターデザイン、総作画監督）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 6500, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2022-02-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019776375'), '0019776375-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019776375'), '0019776375-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: さらば宇宙戦艦ヤマト　愛の戦士たち
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016211374', 'さらば宇宙戦艦ヤマト　愛の戦士たち', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "松本零士（監督、総設定）, 富山敬（古代進）, 麻上洋子（森雪）, 納谷悟朗（沖田十三）, 舛田利雄（監督、脚本）, 西崎義展（企画、原案、製作、総指揮）, 宮川泰（音楽）", "market_price": 1900, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2009-11-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211374'), '0016211374-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211374'), '0016211374-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211374'), '0016211374-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鬼滅の刃　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019238132', '鬼滅の刃　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴（原作）, 花江夏樹（竈門炭治郎）, 鬼頭明里（竈門禰豆子）, 櫻井孝宏（富岡義勇）, 松島晃（キャラクターデザイン）, 佐藤美幸（サブキャラクターデザイン）, 梶浦由記（音楽）, 椎名豪（音楽）", "market_price": 6500, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2019-07-31", "group_name": "【ＤＶＤ】鬼滅の刃（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）全"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019238132'), '0019238132-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019238132'), '0019238132-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版マクロスＦ～イツワリノウタヒメ～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016429280', '劇場版マクロスＦ～イツワリノウタヒメ～', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "河森正治（原作、監督）, 河森正治（原作、監督）, スタジオぬえ（原作）, 中村悠一（早乙女アルト）, 遠藤綾（シェリル・ノーム）, 中島愛（ランカ・リー）, 江端里沙（キャラクターデザイン）, 高橋裕一（キャラクターデザイン）, 菅野よう子（音楽）", "market_price": 5800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2010-10-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016429280'), '0016429280-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＴＨＥ八犬伝～新章～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001218229', 'ＴＨＥ八犬伝～新章～', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岡本有樹郎, 日高のり子, 山寺宏一, 関俊彦, 山口勝平", "market_price": 4800, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "1998-12-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ハイスクールＤ×Ｄ　ＢｏｒＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018973035', 'ハイスクールＤ×Ｄ　ＢｏｒＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "石踏一榮（原作）, みやま零（原作イラスト）, 梶裕貴（兵藤一誠）, 日笠陽子（リアス・グレモリー）, 浅倉杏美（アーシア・アルジェント）, ごとうじゅんじ（キャラクターデザイン、総作画監督）, 中西亮輔（音楽）", "market_price": 22000, "buyback_price": 5182, "publisher": "ＤＶＤ", "saledate": "2018-03-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: この青空に約束をー～ようこそつぐみ寮へ～Ｖｏｌ．７（初回限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015623926', 'この青空に約束をー～ようこそつぐみ寮へ～Ｖｏｌ．７（初回限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "花井宏和（キャラクターデザイン、総作画監督）, 中村悠一（星野航）, こおろぎさとみ（沢城凛奈）", "market_price": 7800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2008-01-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（初回限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020696157', '劇場版　うたの☆プリンスさまっ♪　ＴＡＢＯＯ　ＮＩＧＨＴ　ＸＸＸＸ（初回限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "上松範康, ブロッコリー, 森久保祥太郎, 鈴木達央, 蒼井翔太, 関暁子, 藤岡真紀, Ｅｌｅｍｅｎｔｓ　Ｇａｒｄｅｎ", "market_price": 9500, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2025-12-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020696157'), '0020696157-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 呪術廻戦　懐玉・玉折　１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020101603', '呪術廻戦　懐玉・玉折　１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "芥見下々, 中村悠一, 櫻井孝宏, 遠藤綾, 永瀬アンナ, 平松禎史, 小磯沙矢香, 照井順政", "market_price": 6800, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2023-10-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020101603'), '0020101603-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 超時空要塞マクロス　愛・おぼえていますか（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017415727', '超時空要塞マクロス　愛・おぼえていますか（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "スタジオぬえ（原作）, 長谷有洋（一条輝）, 飯島真理（リン・ミンメイ）, 土井美加（早瀬未沙）, 美樹本晴彦（キャラクターデザイン、作画監督）, 羽田健太郎（音楽）", "market_price": 5000, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2016-01-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017415727'), '0017415727-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017415727'), '0017415727-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017415727'), '0017415727-U03', 2660, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ガールズ＆パンツァー　劇場版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018613833', 'ガールズ＆パンツァー　劇場版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "杉本功（キャラクターデザイン、総作画監督）, 渕上舞（西住みほ）, 茅野愛衣（武部沙織）, 尾崎真実（五十鈴華）, 浜口史郎（音楽）", "market_price": 6800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2016-05-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018613833'), '0018613833-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018613833'), '0018613833-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018613833'), '0018613833-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール改　魔人ブウ編　Ｂｌｕ－ｒａｙ　ＢＯＸ２（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017208774', 'ドラゴンボール改　魔人ブウ編　Ｂｌｕ－ｒａｙ　ＢＯＸ２（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯、孫悟天）, 堀川りょう（ベジータ）, 古川登志夫（ピッコロ）, 住友紀人（音楽）", "market_price": 15200, "buyback_price": 4728, "publisher": "ＤＶＤ", "saledate": "2014-12-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: るろうに剣心－明治剣客浪漫譚－星霜編（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016551909', 'るろうに剣心－明治剣客浪漫譚－星霜編（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "和月伸宏（原作）, 涼風真世（緋村剣心）, 岩男潤子（雪代巴）, 藤谷美紀（神谷薫）, 松島晃（キャラクターデザイン）, 岩崎琢（音楽）", "market_price": 6800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2011-09-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 新機動戦記ガンダムＷ　メモリアルボックス版　Ｐａｒｔ．Ⅰ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015237706', '新機動戦記ガンダムＷ　メモリアルボックス版　Ｐａｒｔ．Ⅰ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇／富野由悠季, 村瀬修功（キャラクターデザイン）, 緑川光（ヒイロ）, 関俊彦（デュオ）", "market_price": 36000, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2007-08-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015237706'), '0015237706-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015237706'), '0015237706-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 超時空要塞マクロス　愛・おぼえていますか　ＨＤリマスター版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015628623', '超時空要塞マクロス　愛・おぼえていますか　ＨＤリマスター版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "スタジオぬえ（原作）, 石黒昇（監督）, 河森正治（監督、脚本）, 長谷有洋（一条輝）, 飯島真理（リン・ミンメイ）, 美樹本晴彦（キャラクターデザイン、作画監督）, 羽田健太郎（音楽）", "market_price": 6800, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2007-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015628623'), '0015628623-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015628623'), '0015628623-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015628623'), '0015628623-U03', 3500, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－ＭＵＳＩＣ　ＵＮＩＶＥＲＳＥ－（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020265577', 'うたの☆プリンスさまっ♪　ＡＬＬ　ＳＴＡＲ　ＳＴＡＧＥ　－ＭＵＳＩＣ　ＵＮＩＶＥＲＳＥ－（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＳＴ☆ＲＩＳＨ, ＱＵＡＲＴＥＴ　ＮＩＧＨＴ, ＨＥ★ＶＥＮＳ", "market_price": 8000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2024-10-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265577'), '0020265577-U01', 4200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265577'), '0020265577-U02', 3570, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020265577'), '0020265577-U03', 2940, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動警察パトレイバー　劇場版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016211366', '機動警察パトレイバー　劇場版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "押井守（監督）, ヘッドギア（企画、原作）, 冨永みーな（泉野明）, 古川登志夫（篠原遊馬）, 高田明美（キャラクターデザイン）, 川井憲次（音楽）", "market_price": 1900, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2009-10-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211366'), '0016211366-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211366'), '0016211366-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ハイキュー！！　陸　ＶＳ　空
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019304215', 'ハイキュー！！　陸　ＶＳ　空', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "古舘春一（原作）, 梶裕貴（孤爪研磨）, 中村悠一（黒尾鉄郎）, 立花慎之介（夜久衛輔）, 岸田隆宏（キャラクターデザイン）, 林ゆうき（音楽）, 橘麻美（音楽）", "market_price": 5800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2020-01-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019304215'), '0019304215-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019304215'), '0019304215-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019304215'), '0019304215-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ガールズ＆パンツァー　オーケストラ・コンサート　～Ｈｅｒｂｓｔ　Ｍｕｓｉｋｆｅｓｔ　２０１５～（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017436431', 'ガールズ＆パンツァー　オーケストラ・コンサート　～Ｈｅｒｂｓｔ　Ｍｕｓｉｋｆｅｓｔ　２０１５～（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ガールズ＆パンツァー, 渕上舞（西住みほ）, ちょうちょ, 佐咲紗花", "market_price": 7800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2016-02-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017436431'), '0017436431-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017436431'), '0017436431-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版「鬼滅の刃」無限城編　第一章　猗窩座再来（通常版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020838624', '劇場版「鬼滅の刃」無限城編　第一章　猗窩座再来（通常版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴, 花江夏樹, 鬼頭明里, 下野紘, 外崎春雄, 松島晃, 椎名豪, 梶浦由記", "market_price": 4000, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2026-07-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＳＬＡＭ　ＤＵＮＫ　ＤＶＤ－ＢＯＸ　赤木剛憲「４」仕様
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001362983', 'ＳＬＡＭ　ＤＵＮＫ　ＤＶＤ－ＢＯＸ　赤木剛憲「４」仕様', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "井上雄彦（原作）", "market_price": 88000, "buyback_price": 16364, "publisher": "ＤＶＤ", "saledate": "2003-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001362983'), '0001362983-U01', 44000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール改　魔人ブウ編　Ｂｌｕ－ｒａｙ　ＢＯＸ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017164104', 'ドラゴンボール改　魔人ブウ編　Ｂｌｕ－ｒａｙ　ＢＯＸ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯、孫悟天）, 堀川りょう（ベジータ）, 古川登志夫（ピッコロ）, 住友紀人（音楽）", "market_price": 15200, "buyback_price": 3910, "publisher": "ＤＶＤ", "saledate": "2014-09-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017164104'), '0017164104-U01', 11000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ドラゴンボール改　魔人ブウ編　ＤＶＤ－ＢＯＸ５
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017345973', 'ドラゴンボール改　魔人ブウ編　ＤＶＤ－ＢＯＸ５', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "鳥山明（原作）, 野沢雅子（孫悟空、孫悟飯、孫悟天）, 堀川りょう（ベジータ）, 古川登志夫（ピッコロ）, 住友紀人（音楽）", "market_price": 11200, "buyback_price": 2000, "publisher": "ＤＶＤ", "saledate": "2015-09-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＳＡＣＲＡ　ＭＵＳＩＣ　ＦＥＳ．　２０２２　－５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　（通常盤）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019924887', 'ＳＡＣＲＡ　ＭＵＳＩＣ　ＦＥＳ．　２０２２　－５ｔｈ　Ａｎｎｉｖｅｒｓａｒｙ　（通常盤）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（Ｖ．Ａ．）, ＦＬＯＷ, ＣｌａｒｉＳ, ＬｉＳＡ, Ａｉｍｅｒ, 藍井エイル, ＳａｗａｎｏＨｉｒｏｙｕｋｉ［ｎＺｋ］, ＴｒｙＳａｉｌ", "market_price": 7500, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2023-04-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019924887'), '0019924887-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 頭文字［イニシャル］Ｄ　Ｐｒｅｍｉｕｍ　Ｂｌｕ－ｒａｙ　ＢＯＸ　Ｐｉｔ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017072570', '頭文字［イニシャル］Ｄ　Ｐｒｅｍｉｕｍ　Ｂｌｕ－ｒａｙ　ＢＯＸ　Ｐｉｔ１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "しげの秀一（原作）, 三木眞一郎（藤原拓海）, 石塚運昇（藤原文太）, 矢尾一樹（池谷浩一郎）, 勝又隆一（音楽）", "market_price": 40000, "buyback_price": 4273, "publisher": "ＤＶＤ", "saledate": "2014-02-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017072570'), '0017072570-U01', 14500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017072570'), '0017072570-U02', 12325, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 銀河英雄伝説　ＢＯＸ　全４６巻セット（通販限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017264965', '銀河英雄伝説　ＢＯＸ　全４６巻セット（通販限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "田中芳樹（原作）", "market_price": 220000, "buyback_price": 9091, "publisher": "ＤＶＤ", "saledate": "2001-10-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ブルージェンダー　ＴＨＥ　ＷＡＲＲＩＯＲ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001230451', 'ブルージェンダー　ＴＨＥ　ＷＡＲＲＩＯＲ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "（アニメーション）", "market_price": 7800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2002-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 涼宮ハルヒの消失【Ａｍａｚｏｎ限定版】（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016932730', '涼宮ハルヒの消失【Ａｍａｚｏｎ限定版】（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "谷川流（原作、脚本協力）", "market_price": 9000, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2010-12-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016932730'), '0016932730-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 機動戦士ガンダムＳＥＥＤ　ＦＲＥＥＤＯＭ（４Ｋ　ＵＬＴＲＡ　ＨＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020333362', '機動戦士ガンダムＳＥＥＤ　ＦＲＥＥＤＯＭ（４Ｋ　ＵＬＴＲＡ　ＨＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "矢立肇, 富野由悠季, 保志総一朗, 田中理恵, 石田彰, 福田己津央, 平井久司, 佐橋俊彦", "market_price": 6364, "buyback_price": 2364, "publisher": "ＤＶＤ", "saledate": "2024-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020333362'), '0020333362-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ　ＫＩＮＧ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020549911', 'ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ　ＫＩＮＧ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "尾田栄一郎, 田中真弓, 中井和哉, 平田広明, 山口由里子, 松田翠, 田中公平, 浜口史郎", "market_price": 12000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2025-07-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: るろうに剣心－明治剣客浪漫譚－追憶編（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016551908', 'るろうに剣心－明治剣客浪漫譚－追憶編（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "和月伸宏（原作）, 涼風真世（緋村剣心）, 岩男潤子（雪代巴）, 佐々木望（雪代縁）, 柳沢まさひで（キャラクターデザイン）, 岩崎琢（音楽）", "market_price": 8000, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2011-08-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016551908'), '0016551908-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016551908'), '0016551908-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: その着せ替え人形は恋をする　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019786662', 'その着せ替え人形は恋をする　１（完全生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "福田晋一（原作）, 直田姫奈（喜多川海夢）, 石毛翔弥（五条新菜）, 斧アツシ（五条薫）, 種﨑敦美（乾紗寿叶）, 羊宮妃那（乾心寿）, 石田一将（キャラクターデザイン、総作画監督）, 中塚武（音楽）", "market_price": 7000, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2022-03-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019786662'), '0019786662-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019786662'), '0019786662-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新世紀エヴァンゲリオン　ＳＥＣＯＮＤ　ＩＭＰＡＣＴ　ＢＯＸ　上巻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016086579', '新世紀エヴァンゲリオン　ＳＥＣＯＮＤ　ＩＭＰＡＣＴ　ＢＯＸ　上巻', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "庵野秀明【監督】", "market_price": 22575, "buyback_price": 137, "publisher": "ＤＶＤ", "saledate": "2000-11-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016086579'), '0016086579-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016086579'), '0016086579-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 言の葉の庭　期間限定サービスプライス版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019254191', '言の葉の庭　期間限定サービスプライス版', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "新海誠（原作、監督、脚本）, 入野自由（秋月孝雄（タカオ））, 花澤香菜（雪野由香里（ユキノ））, 土屋賢一（キャラクターデザイン、作画監督）, 柏大輔（音楽）", "market_price": 2300, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2019-07-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019254191'), '0019254191-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 蒼き流星ＳＰＴレイズナー　Ｒｅｃｏｌｌｅｃｔｉｏｎ１９９６－２０００　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017024467', '蒼き流星ＳＰＴレイズナー　Ｒｅｃｏｌｌｅｃｔｉｏｎ１９９６－２０００　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "伊東恒久（原作）, 高橋良輔（原作）, 井上和彦（アルバトロ・ナル・エイジ・アスカ）, 江森浩子（アンナ・ステファニー）, 梅津秀行（デビッド・ラザフォード）, 谷口守泰（キャラクターデザイン）, 乾裕樹（音楽）", "market_price": 45000, "buyback_price": 16364, "publisher": "ＤＶＤ", "saledate": "2013-09-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ワールドツアー上映「鬼滅の刃」上弦集結、そして刀鍛冶の里へ／絆の奇跡、そして柱稽古へ（完全生産限定版）（４Ｋ　ＵＬＴＲＡ　ＨＤ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020540033', 'ワールドツアー上映「鬼滅の刃」上弦集結、そして刀鍛冶の里へ／絆の奇跡、そして柱稽古へ（完全生産限定版）（４Ｋ　ＵＬＴＲＡ　ＨＤ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "吾峠呼世晴, 花江夏樹, 鬼頭明里, 下野紘, 松島晃, 佐藤美幸, 梶浦由記, 椎名豪", "market_price": 12800, "buyback_price": 2910, "publisher": "ＤＶＤ", "saledate": "2025-05-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020540033'), '0020540033-U01', 8100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020540033'), '0020540033-U02', 6885, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ルパン三世　ｔｈｅ　Ｌａｓｔ　Ｊｏｂ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020508091', 'ルパン三世　ｔｈｅ　Ｌａｓｔ　Ｊｏｂ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "モンキー・パンチ, 栗田貫一, 小林清志, 井上真樹夫, 増山江威子, 納谷悟朗, 平野綾, 大野雄二", "market_price": 4000, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2025-03-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020508091'), '0020508091-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ルパン三世　霧のエリューシヴ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020508104', 'ルパン三世　霧のエリューシヴ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "モンキー・パンチ, 栗田貫一, 小林清志, 井上真樹夫, 増山江威子, 納谷悟朗, 桑島法子, 大野雄二", "market_price": 4000, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2025-03-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 劇場版ＮＡＲＵＴＯ－ナルト－疾風伝　火の意志を継ぐ者
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016304601', '劇場版ＮＡＲＵＴＯ－ナルト－疾風伝　火の意志を継ぐ者', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "岸本斉史（原作）, 竹内順子（うずまきナルト）, 中村千絵（春野サクラ）, 西尾鉄也（キャラクターデザイン）, 鈴木博文（キャラクターデザイン）, むらた雅彦（監督）, 高梨康治（音楽）, 刃－ｙａｉｂａ－（音楽）", "market_price": 4000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2010-04-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 機動警察パトレイバー２　ｔｈｅ　Ｍｏｖｉｅ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016211367', '機動警察パトレイバー２　ｔｈｅ　Ｍｏｖｉｅ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "押井守（監督）, ヘッドギア（企画、原作）, 冨永みーな（泉野明）, 古川登志夫（篠原遊馬）, 高田明美（キャラクターデザイン）, ゆうきまさみ（キャラクターデザイン）, 川井憲次（音楽）", "market_price": 1900, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2009-10-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211367'), '0016211367-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016211367'), '0016211367-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＥＵＲＥＫＡ／交響詩篇エウレカセブン　ハイエボリューション（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019817332', 'ＥＵＲＥＫＡ／交響詩篇エウレカセブン　ハイエボリューション（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＢＯＮＥＳ（原作）, 名塚佳織（エウレカ・サーストン）, 遠藤璃菜（アイリス・マッケンジー）, 小清水亜美（石井・風花・アネモネ）, 森川智之（ホランド・ノヴァク）, 京田知己（監督、脚本）, 奥村正志（キャラクターデザイン、作画監督）, 佐藤直紀（音楽）", "market_price": 7000, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2022-06-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019817332'), '0019817332-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019817332'), '0019817332-U02', 3825, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鋼の錬金術師　ｖｏｌ．１３
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010040739', '鋼の錬金術師　ｖｏｌ．１３', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "荒川弘（原作）, 水島精二（監督）, 伊藤嘉之（キャラクターデザイン）, 大島ミチル（音楽）, 朴□美［パクロミ］（エドワード・エルリック）, 釘宮理恵（アルフォンス・エルリック）, 大川透（ロイ・マスタング）, 麻生美代子（ピナコ・ロックベル）", "market_price": 5800, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2005-01-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010040739'), '0010040739-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版　鋼の錬金術師　嘆きの丘の聖なる星
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016719667', '劇場版　鋼の錬金術師　嘆きの丘の聖なる星', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "荒川弘（原作）, 朴□美［パクロミ］（エドワード・エルリック）, 釘宮理恵（アルフォンス・エルリック）, 小西賢一（キャラクターデザイン、総作画監督）, 村田和也（監督）, 岩代太郎（音楽）", "market_price": 3800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2012-02-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016719667'), '0016719667-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016719667'), '0016719667-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＥＵＲＥＫＡ／交響詩篇エウレカセブン　ハイエボリューション（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019817331', 'ＥＵＲＥＫＡ／交響詩篇エウレカセブン　ハイエボリューション（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＢＯＮＥＳ（原作）, 名塚佳織（エウレカ・サーストン）, 遠藤璃菜（アイリス・マッケンジー）, 小清水亜美（石井・風花・アネモネ）, 森川智之（ホランド・ノヴァク）, 京田知己（監督、脚本）, 奥村正志（キャラクターデザイン、作画監督）, 佐藤直紀（音楽）", "market_price": 10000, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2022-06-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019817331'), '0019817331-U01', 5900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019817331'), '0019817331-U02', 5015, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ　ＫＯＢＹ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020806235', 'ＯＮＥ　ＰＩＥＣＥ　Ｌｏｇ　Ｃｏｌｌｅｃｔｉｏｎ　ＫＯＢＹ', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "尾田栄一郎, 田中真弓, 中井和哉, 岡村明美, 山口勝平, 松田翠, 田中公平, 浜口史郎", "market_price": 12000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2026-08-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 新劇場版　頭文字［イニシャル］Ｄ　Ｌｅｇｅｎｄ３－夢現－（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018652184', '新劇場版　頭文字［イニシャル］Ｄ　Ｌｅｇｅｎｄ３－夢現－（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "しげの秀一（原作）, 宮野真守（藤原拓海）, 小野大輔（高橋涼介）, 中村悠一（高橋啓介）, 羽田浩二（キャラクターデザイン）, 土橋安騎夫（音楽）", "market_price": 4980, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2016-06-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018652184'), '0018652184-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018652184'), '0018652184-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018652184'), '0018652184-U03', 2030, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 劇場版ペルソナ３　＃１　Ｓｐｒｉｎｇ　ｏｆ　Ｂｉｒｔｈ（完全生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017118938', '劇場版ペルソナ３　＃１　Ｓｐｒｉｎｇ　ｏｆ　Ｂｉｒｔｈ（完全生産限定版）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＡＴＬＵＳ（原作）, 石田彰（結城理）, 豊口めぐみ（岳羽ゆかり）, 鳥海浩輔（伊織順平）, 渡部圭祐（キャラクターデザイン、アニメーションディレクター）, 目黒将司（音楽）", "market_price": 7000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2014-05-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017118938'), '0017118938-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ルパン三世　天使の策略　～夢のカケラは殺しの香り～（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020508136', 'ルパン三世　天使の策略　～夢のカケラは殺しの香り～（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "モンキー・パンチ, 栗田貫一, 小林清志, 井上真樹夫, 増山江威子, 納谷悟朗, 松井菜桜子, 大野雄二", "market_price": 4000, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2025-03-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: コレクター・ユイ　ＤＶＤ－ＢＯＸ１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018886665', 'コレクター・ユイ　ＤＶＤ－ＢＯＸ１', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "室井ふみえ（キャラクターデザイン）, 大本眞基子（春日結）, 西村朋紘（ＩＲ）, 麦人（グロッサー）, 川井憲次（音楽）", "market_price": 15500, "buyback_price": 4546, "publisher": "ＤＶＤ", "saledate": "2017-08-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018886665'), '0018886665-U01', 15500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新劇場版　頭文字［イニシャル］Ｄ　Ｌｅｇｅｎｄ３－夢現－（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018652185', '新劇場版　頭文字［イニシャル］Ｄ　Ｌｅｇｅｎｄ３－夢現－（初回生産限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "しげの秀一（原作）, 宮野真守（藤原拓海）, 小野大輔（高橋涼介）, 中村悠一（高橋啓介）, 羽田浩二（キャラクターデザイン）, 土橋安騎夫（音楽）", "market_price": 7400, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2016-06-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018652185'), '0018652185-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 美味しんぼ　Ｂｌｕ－ｒａｙ　ＢＯＸ　１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018754968', '美味しんぼ　Ｂｌｕ－ｒａｙ　ＢＯＸ　１（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "雁屋哲（原作）, 花咲アキラ（原作）, 井上和彦（山岡士郎）, 荘真由美（栗田ゆう子）, 大塚周夫（海原雄山）, 河南正昭（キャラクターデザイン）, 大谷和夫（音楽）", "market_price": 42000, "buyback_price": 9546, "publisher": "ＤＶＤ", "saledate": "2016-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018754968'), '0018754968-U01', 26000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＮＥＭＯＮＥ／交響詩篇エウレカセブン　ハイエボリューション（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019183633', 'ＡＮＥＭＯＮＥ／交響詩篇エウレカセブン　ハイエボリューション（特装限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "ＢＯＮＥＳ（原作）, 小清水亜美（石井・風花・アネモネ）, 玉野るな（石井・風花・アネモネ）, 名塚佳織（エウレカ）, 京田知己（監督）, 吉田健一（キャラクターデザイン）, 藤田しげる（キャラクターデザイン、キャラクター作画監督）, 佐藤直紀（音楽）", "market_price": 10000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2019-03-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019183633'), '0019183633-U01', 4200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019183633'), '0019183633-U02', 3570, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ノブナガ先生の幼な妻　下巻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019244549', 'ノブナガ先生の幼な妻　下巻', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "佐々木勅嘉（監督）、酒井広大", "market_price": 5000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2019-07-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 響け！ユーフォニアム２　３巻（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018748424', '響け！ユーフォニアム２　３巻（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "武田綾乃（原作）, 黒沢ともよ（黄前久美子）, 朝井彩加（加藤葉月）, 豊田萌絵（川島緑輝）, 池田晶子（キャラクターデザイン）, 松田彬人（音楽）", "market_price": 6500, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2017-02-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018748424'), '0018748424-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018748424'), '0018748424-U02', 2890, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＡＶ版　劇場版「ＣＬＡＮＮＡＤ」ＤＶＤコレクターズ・エディション
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015712512', 'ＡＶ版　劇場版「ＣＬＡＮＮＡＤ」ＤＶＤコレクターズ・エディション', (SELECT id FROM categories WHERE slug = 'video-anime'), '{"author": "Ｋｅｙ（原作）", "market_price": 9333, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2008-03-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- ==========================================
--  Domestic Drama DVD (video-domestic-drama)
-- ==========================================

-- Insert product catalog: １０１回目のプロポーズ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001234085', '１０１回目のプロポーズ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "浅野温子, 武田鉄矢, 江口洋介, 田中律子, 浅田美代子, 竹内力, 野島伸司, 西村由紀江", "market_price": 19800, "buyback_price": 6091, "publisher": "ＤＶＤ", "saledate": "2001-10-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001234085'), '0001234085-U01', 15500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001234085'), '0001234085-U02', 13175, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スマイル　ＤＶＤ－ＢＯＸ（初回生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016188178', 'スマイル　ＤＶＤ－ＢＯＸ（初回生産限定版）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松本潤, 新垣結衣, 中井貴一, 山下康介（音楽）", "market_price": 22800, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2009-10-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016188178'), '0016188178-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016188178'), '0016188178-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ０号室の客　ＤＶＤ－ＢＯＸ　１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016292145', '０号室の客　ＤＶＤ－ＢＯＸ　１', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "横山裕（ストーリーテラー、出演）, 大野智, 丸山隆平, 加藤成亮", "market_price": 9000, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2010-03-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016292145'), '0016292145-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016292145'), '0016292145-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブラックペアン　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019090904', 'ブラックペアン　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也, 竹内涼真, 葵わかな, 海堂尊（原作）, 木村秀彬（音楽）", "market_price": 26400, "buyback_price": 3182, "publisher": "ＤＶＤ", "saledate": "2018-11-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090904'), '0019090904-U01', 8100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090904'), '0019090904-U02', 6885, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019090904'), '0019090904-U03', 5670, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 死神くん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017179404', '死神くん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 桐谷美玲, 菅田将暉, えんどコイチ（原作）, 井筒昭雄（音楽）", "market_price": 23500, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2014-11-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017179404'), '0017179404-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: のだめカンタービレ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015223187', 'のだめカンタービレ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "玉木宏, 上野樹里／玉木宏, 瑛太, 二ノ宮知子（原作）", "market_price": 22800, "buyback_price": 2000, "publisher": "ＤＶＤ", "saledate": "2007-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015223187'), '0015223187-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015223187'), '0015223187-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015223187'), '0015223187-U03', 3500, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 歌のおにいさん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017112846', '歌のおにいさん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 千紗（ＧＩＲＬ　ＮＥＸＴ　ＤＯＯＲ）, 片瀬那奈, 辻陽（音楽）", "market_price": 19200, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2014-03-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017112846'), '0017112846-U01', 7700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017112846'), '0017112846-U02', 6545, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 金田一少年の事件簿　ＶＯＬ．１（ディレクターズカット）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001238036', '金田一少年の事件簿　ＶＯＬ．１（ディレクターズカット）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "堂本剛, ともさかりえ, 古尾谷雅人, 金成陽三郎, さとうふみや, 見岳章", "market_price": 2800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2002-01-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001238036'), '0001238036-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001238036'), '0001238036-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001238036'), '0001238036-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 夏の恋は虹色に輝く　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016443133', '夏の恋は虹色に輝く　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松本潤, 竹内結子, 沢村一樹, 延近輝之（音楽）", "market_price": 19000, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2010-12-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016443133'), '0016443133-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ごくせん　２００２　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016252741', 'ごくせん　２００２　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "仲間由紀恵, 松本潤, 宇津井健, 森本梢子（原作）, 大島ミチル（音楽）", "market_price": 12000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2010-01-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016252741'), '0016252741-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016252741'), '0016252741-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016252741'), '0016252741-U03', 4760, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 山田太郎ものがたり
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015635152', '山田太郎ものがたり', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也／櫻井翔, 多部未華子, 平沢敦士（音楽）", "market_price": 19000, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2008-01-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015635152'), '0015635152-U01', 6300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: イラズラなＫｉｓｓ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016001045', 'イラズラなＫｉｓｓ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "佐藤藍子, 柏原崇, 明石亮太朗, 多田かおる（原作）, 中村幸代（音楽）", "market_price": 13500, "buyback_price": 6091, "publisher": "ＤＶＤ", "saledate": "2008-11-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ザ・クイズショウ２００９　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016189170', 'ザ・クイズショウ２００９　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "櫻井翔, 横山裕, 松浦亜弥, 真矢みき, ＮＡＲＡＳＡＫＩ（音楽）", "market_price": 17200, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2009-08-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016189170'), '0016189170-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016189170'), '0016189170-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016189170'), '0016189170-U03', 1750, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: はじまりの歌（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017056882', 'はじまりの歌（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松本潤, 榮倉奈々, 戸田菜穂, 白石めぐみ（音楽）", "market_price": 4300, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2013-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017056882'), '0017056882-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017056882'), '0017056882-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ナースのお仕事３　（１）～（４）　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010028689', 'ナースのお仕事３　（１）～（４）　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "観月ありさ, 松下由樹, 藤木直人, 伊藤かずえ, 神田うの, 石原良純, 金子ありさ, 両沢和幸", "market_price": 19800, "buyback_price": 8182, "publisher": "ＤＶＤ", "saledate": "2002-11-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010028689'), '0010028689-U01', 20000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ロングバケーション
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001235313', 'ロングバケーション', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "木村拓哉, 山口智子, 竹野内豊, 稲森いずみ, 松たか子, りょう, 北川悦吏子, ＣＡＧＮＥＴ", "market_price": 19800, "buyback_price": 3364, "publisher": "ＤＶＤ", "saledate": "2001-11-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001235313'), '0001235313-U01', 8600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001235313'), '0001235313-U02', 7310, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001235313'), '0001235313-U03', 6020, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: オレンジデイズ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001513322', 'オレンジデイズ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "妻夫木聡, 柴咲コウ, 成宮寛貴, 白石美帆, 瑛太, 風吹ジュン, 小西真奈美, 北川悦吏子（脚本）", "market_price": 19900, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2004-09-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001513322'), '0001513322-U01', 4200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 王様のレストラン　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001378661', '王様のレストラン　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "三谷幸喜（脚本）, 松本幸四郎［九代目］, 筒井道隆, 山口智子, 鈴木京香, 西村雅彦, 小野武彦, 服部隆之（音楽）", "market_price": 19800, "buyback_price": 3637, "publisher": "ＤＶＤ", "saledate": "2003-09-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001378661'), '0001378661-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001378661'), '0001378661-U02', 7650, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ゆとりですがなにか　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018683343', 'ゆとりですがなにか　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "岡田将生, 松坂桃李, 柳楽優弥, 平野義久（音楽）", "market_price": 22000, "buyback_price": 3637, "publisher": "ＤＶＤ", "saledate": "2016-10-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018683343'), '0018683343-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 吾輩は主婦である　ＤＶＤ－ＢＯＸ　下巻「たかし」
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011149679', '吾輩は主婦である　ＤＶＤ－ＢＯＸ　下巻「たかし」', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "斉藤由貴, 及川光博, 宮藤官九郎（脚本）", "market_price": 15200, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2006-11-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011149679'), '0011149679-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: セミオトコ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019326475', 'セミオトコ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "山田涼介, 木南晴夏, 今田美桜, ａｇｅｈａｓｐｒｉｎｇｓ（音楽）", "market_price": 19500, "buyback_price": 4000, "publisher": "ＤＶＤ", "saledate": "2020-03-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019326475'), '0019326475-U01', 8600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019326475'), '0019326475-U02', 7310, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マンハッタンラブストーリー　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016475742', 'マンハッタンラブストーリー　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松岡昌宏, 及川光博, 酒井若菜, 宮藤官九郎（脚本）", "market_price": 26400, "buyback_price": 11819, "publisher": "ＤＶＤ", "saledate": "2011-01-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016475742'), '0016475742-U01', 30000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: パパとムスメの７日間（２０２２年版）　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019894410', 'パパとムスメの７日間（２０２２年版）　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "飯沼愛, 長尾謙杜, 小栗有以, 松本怜生, 水間ロン, 高木ひとみ〇, 羽田美智子, 五十嵐貴久", "market_price": 8000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2023-06-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019894410'), '0019894410-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019894410'), '0019894410-U02', 3400, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｆａｌｌｅｎ　Ａｎｇｅｌ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016812680', 'Ｆａｌｌｅｎ　Ａｎｇｅｌ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "加藤和樹, 植原卓也, 北村匠海", "market_price": 11400, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2012-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016812680'), '0016812680-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016812680'), '0016812680-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ショムニ　ファーストシリーズ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016477682', 'ショムニ　ファーストシリーズ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "江角マキコ, 宝生舞, 京野ことみ, 安田弘之（原作）, 大島ミチル（音楽）", "market_price": 19000, "buyback_price": 9091, "publisher": "ＤＶＤ", "saledate": "2011-01-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: マイ★ボス　マイ★ヒーロー　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015184587', 'マイ★ボス　マイ★ヒーロー　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "長瀬智也, 手越祐也, 田中聖", "market_price": 17200, "buyback_price": 3910, "publisher": "ＤＶＤ", "saledate": "2007-04-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015184587'), '0015184587-U01', 10000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ３３分探偵　ＤＶＤ－ＢＯＸ上巻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016001054', '３３分探偵　ＤＶＤ－ＢＯＸ上巻', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "堂本剛, 水川あさみ, 高橋克実, 石田勝範（音楽）", "market_price": 11400, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2008-11-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016001054'), '0016001054-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016001054'), '0016001054-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016001054'), '0016001054-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 東京ラブストーリー　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017259022', '東京ラブストーリー　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "鈴木保奈美, 織田裕二, 有森也実, 柴門ふみ（原作）, 日向敏文（音楽）", "market_price": 19800, "buyback_price": 5455, "publisher": "ＤＶＤ", "saledate": "2015-02-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017259022'), '0017259022-U01', 13500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017259022'), '0017259022-U02', 11475, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: もう誘拐なんてしない
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016826445', 'もう誘拐なんてしない', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 新垣結衣, 佐藤隆太, 東川篤哉（原作）, 瀬川英史（音楽）", "market_price": 3800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2012-07-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016826445'), '0016826445-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016826445'), '0016826445-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 世界一難しい恋　Ｂｌｕ－ｒａｙ　ＢＯＸ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018685130', '世界一難しい恋　Ｂｌｕ－ｒａｙ　ＢＯＸ（通常版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 波瑠, 小池栄子", "market_price": 22000, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2016-11-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 花より男子２（リターンズ）番外編　牧野家はじめての家族旅行　珍道中　ｉｎ　Ｎ．Ｙ．
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015252759', '花より男子２（リターンズ）番外編　牧野家はじめての家族旅行　珍道中　ｉｎ　Ｎ．Ｙ．', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央／松本潤", "market_price": 3800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2007-06-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015252759'), '0015252759-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015252759'), '0015252759-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015252759'), '0015252759-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ラッキーセブン　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016811034', 'ラッキーセブン　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松本潤, 瑛太, 仲里依紗, ティモシー・ウィン（音楽）", "market_price": 23500, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2012-06-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016811034'), '0016811034-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016811034'), '0016811034-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 白線流し　夢見る頃を過ぎても
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010534657', '白線流し　夢見る頃を過ぎても', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "長瀬智也, 酒井美紀, 京野ことみ, 柏原崇, 馬渕英里何, 中村竜, 遊井亮子, 松本留美", "market_price": 3800, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2006-01-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010534657'), '0010534657-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: オー！マイ・ボス！恋は別冊で　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019612332', 'オー！マイ・ボス！恋は別冊で　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "上白石萌音, 菜々緒, 玉森裕太, 間宮祥太朗, ユースケ・サンタマリア, 久保田紗友, 亜生, 木村秀彬（音楽）", "market_price": 26400, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2021-09-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019612332'), '0019612332-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019612332'), '0019612332-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019612332'), '0019612332-U03', 3500, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 連続ドラマＷ　６０　誤判対策室
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019112985', '連続ドラマＷ　６０　誤判対策室', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "舘ひろし, 古川雄輝, 星野真里, 石川智健（原作）, 渡邊琢磨（音楽）", "market_price": 11400, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2018-10-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019112985'), '0019112985-U01', 7200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 池袋ウエストゲートパーク　スープの回　完全版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001360833', '池袋ウエストゲートパーク　スープの回　完全版', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "長瀬智也, 加藤あい, 妻夫木聡, 坂口憲二, 佐藤隆太, 石田衣良（原作）, 宮藤官九郎（脚本）, 磯山晶（制作）", "market_price": 4800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2003-07-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001360833'), '0001360833-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001360833'), '0001360833-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001360833'), '0001360833-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ギャルサー　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011088905', 'ギャルサー　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "藤木直人, 戸田恵梨香, 鈴木えみ, 矢口真里", "market_price": 18200, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2006-09-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011088905'), '0011088905-U01', 4200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ショムニ　ＦＩＮＡＬ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001458192', 'ショムニ　ＦＩＮＡＬ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "（ドラマ）, 江角マキコ, 宝生舞, 京野ことみ, 櫻井淳子, 戸田恵子, 高橋由美子, 沢村一樹", "market_price": 22800, "buyback_price": 8637, "publisher": "ＤＶＤ", "saledate": "2003-01-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001458192'), '0001458192-U01', 21000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花のち晴れ～花男Ｎｅｘｔ　Ｓｅａｓｏｎ～　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019088043', '花のち晴れ～花男Ｎｅｘｔ　Ｓｅａｓｏｎ～　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "杉咲花, 平野紫耀, 中川大志, 神尾葉子（原作）, 大間々昂（音楽）, 平野義久（音楽）, 鈴木真人（音楽）, 羽深由理（音楽）", "market_price": 22800, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2018-10-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019088043'), '0019088043-U01', 3800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019088043'), '0019088043-U02', 3230, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019088043'), '0019088043-U03', 2660, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 怪物くん　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016385062', '怪物くん　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 松岡昌宏, 八嶋智人, 川島海荷, 藤子不二雄Ａ（原作）, 井筒昭雄（音楽）", "market_price": 17200, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2010-09-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 花より男子２（リターンズ）ＤＶＤ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015222382', '花より男子２（リターンズ）ＤＶＤ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央／松本潤, 神尾葉子（原作）", "market_price": 22800, "buyback_price": 3000, "publisher": "ＤＶＤ", "saledate": "2007-07-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015222382'), '0015222382-U01', 7700, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015222382'), '0015222382-U02', 6545, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 世界一難しい恋　ＤＶＤ　ＢＯＸ（通常版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018685132', '世界一難しい恋　ＤＶＤ　ＢＯＸ（通常版）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 波瑠, 小池栄子", "market_price": 17200, "buyback_price": 2000, "publisher": "ＤＶＤ", "saledate": "2016-11-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: もう誘拐なんてしない（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016826447', 'もう誘拐なんてしない（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 新垣結衣, 佐藤隆太, 東川篤哉（原作）, 瀬川英史（音楽）", "market_price": 4700, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2012-07-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016826447'), '0016826447-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ブラックペアン　シーズン２　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020401602', 'ブラックペアン　シーズン２　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也, 竹内涼真, 葵わかな, キム・ムジュン, チェ・ジウ, 田中みな実, 海堂尊, 木村秀彬", "market_price": 31850, "buyback_price": 4546, "publisher": "ＤＶＤ", "saledate": "2024-12-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 怪物くん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016724810', '怪物くん　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 松岡昌宏, 八嶋智人, 川島海荷, 藤子不二雄Ａ（原作）, 井筒昭雄（音楽）", "market_price": 21200, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2011-12-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016724810'), '0016724810-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016724810'), '0016724810-U02', 3400, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鍵のかかった部屋　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016863533', '鍵のかかった部屋　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 戸田恵梨香, 佐藤浩市, 貴志祐介（原作）, Ｋｅｎ　Ａｒａｉ（音楽）", "market_price": 28200, "buyback_price": 4546, "publisher": "ＤＶＤ", "saledate": "2012-10-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ごくせん　２００５　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010468783', 'ごくせん　２００５　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "仲間由紀恵, 亀梨和也, 赤西仁", "market_price": 17200, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2005-11-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010468783'), '0010468783-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010468783'), '0010468783-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010468783'), '0010468783-U03', 1330, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 最後の約束
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016335747', '最後の約束', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 櫻井翔, 相葉雅紀, 二宮和也, 松本潤, 井筒昭雄（音楽）", "market_price": 3800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2010-06-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 凪のお暇　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019329226', '凪のお暇　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "黒木華, 高橋一生, 中村倫也, コナリミサト（原作）, パスカルズ（音楽）", "market_price": 20900, "buyback_price": 2546, "publisher": "ＤＶＤ", "saledate": "2020-02-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019329226'), '0019329226-U01', 6300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 大映テレビドラマシリーズ：スチュワーデス物語ＤＶＤ－ＢＯＸ　後編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001519551', '大映テレビドラマシリーズ：スチュワーデス物語ＤＶＤ－ＢＯＸ　後編', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "堀ちえみ, 風間杜夫, 片平なぎさ, 石立鉄男, 高樹澪, 春やすこ, 白石まるみ, 松岡ふたみ", "market_price": 19000, "buyback_price": 7273, "publisher": "ＤＶＤ", "saledate": "2004-11-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001519551'), '0001519551-U01', 18500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 新年早々　不適切にもほどがある！　～真面目な話、しちゃダメですか？～
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020765019', '新年早々　不適切にもほどがある！　～真面目な話、しちゃダメですか？～', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "阿部サダヲ, 仲里依紗, 磯村勇斗, 吉田羊, 河合優実, 末廣健一郎, ＭＡＹＵＫＯ, 宗形勇輝", "market_price": 5800, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2026-06-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: スペシャルドラマ　リーガル・ハイ　完全版
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016995427', 'スペシャルドラマ　リーガル・ハイ　完全版', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "堺雅人, 新垣結衣, 生瀬勝久, 林ゆうき（音楽）", "market_price": 3800, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2013-08-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016995427'), '0016995427-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016995427'), '0016995427-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016995427'), '0016995427-U03', 2030, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: きみはペット　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001389778', 'きみはペット　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "小雪, 松本潤, 石原さとみ, 田辺誠一, 酒井若菜, 長塚京三, 大森美香（脚本）, 小川彌生（原作）", "market_price": 19000, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2003-09-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001389778'), '0001389778-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２５時、赤坂で　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020336124', '２５時、赤坂で　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "駒木根葵汰, 新原泰佑, 宇佐卓真, 南雲奨馬, 福津健創, 今川宇宙, 篠原悠伸, 夏野寛子", "market_price": 24000, "buyback_price": 5455, "publisher": "ＤＶＤ", "saledate": "2024-11-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 木更津キャッツアイ　第２巻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001243394', '木更津キャッツアイ　第２巻', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "岡田准一", "market_price": 3800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2002-06-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 星の金貨　ＤＶＤ－ＢＯＸ（初回限定生産）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001230098', '星の金貨　ＤＶＤ－ＢＯＸ（初回限定生産）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "酒井法子, 大沢たかお, 竹野内豊, 西村知美, 細川直美, 田中美奈子, 龍居由佳里, 溝口肇", "market_price": 22800, "buyback_price": 7910, "publisher": "ＤＶＤ", "saledate": "2001-07-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001230098'), '0001230098-U01', 27000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マンハッタンラブストーリー　ＤＶＤ－ＢＯＸ（初回限定生産）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001445746', 'マンハッタンラブストーリー　ＤＶＤ－ＢＯＸ（初回限定生産）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松岡昌宏, 及川光博, 酒井若菜, 塚本高史, 松尾スズキ, 森下愛子, 小泉今日子, 宮藤官九郎（脚本）", "market_price": 22800, "buyback_price": 4091, "publisher": "ＤＶＤ", "saledate": "2004-03-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001445746'), '0001445746-U01', 10500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001445746'), '0001445746-U02', 8925, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 東京ラブストーリー　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001233063', '東京ラブストーリー　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "鈴木保奈美, 織田裕二, 有森也実, 江口洋介, 千堂あきほ, 柴門ふみ, 坂元裕二, 日向敏文", "market_price": 19800, "buyback_price": 4091, "publisher": "ＤＶＤ", "saledate": "2001-09-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001233063'), '0001233063-U01', 10500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001233063'), '0001233063-U02', 8925, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 真夏のシンデレラ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020144624', '真夏のシンデレラ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "森七菜, 間宮祥太朗, 神尾楓珠, 吉川愛, 萩原利久, 白濱亜嵐, 末廣健一郎, ＭＡＹＵＫＯ", "market_price": 26000, "buyback_price": 5728, "publisher": "ＤＶＤ", "saledate": "2024-02-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144624'), '0020144624-U01', 14500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0020144624'), '0020144624-U02', 12325, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花より男子（１）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010539716', '花より男子（１）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央, 松本潤, 小栗旬, 松田翔太, 阿部力, 神尾葉子（原作）", "market_price": 3800, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2006-03-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010539716'), '0010539716-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010539716'), '0010539716-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 俺の可愛いはもうすぐ消費期限！？　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019853793', '俺の可愛いはもうすぐ消費期限！？　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "山田涼介, 芳根京子, 大橋和也, 迫田孝也, 鞘師里保, 津田健次郎, 西田尚美, 井筒昭雄（音楽）", "market_price": 15200, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2022-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019853793'), '0019853793-U01', 4500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019853793'), '0019853793-U02', 3825, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 図書館戦争　ＢＯＯＫ　ＯＦ　ＭＥＭＯＲＩＥＳ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017420180', '図書館戦争　ＢＯＯＫ　ＯＦ　ＭＥＭＯＲＩＥＳ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "岡田准一, 榮倉奈々, 田中圭, 有川浩（原作）, 髙見優（音楽）", "market_price": 3800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2015-10-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017420180'), '0017420180-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 三毛猫ホームズの推理　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016858591', '三毛猫ホームズの推理　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "相葉雅紀, 藤木直人, 大倉忠義, 赤川次郎（原作）, 金子隆博（音楽）", "market_price": 23000, "buyback_price": 1364, "publisher": "ＤＶＤ", "saledate": "2012-10-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016858591'), '0016858591-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016858591'), '0016858591-U02', 2890, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４時間テレビ４４ドラマスペシャル「生徒が人生をやり直せる学校」（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019729426', '２４時間テレビ４４ドラマスペシャル「生徒が人生をやり直せる学校」（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "平野紫耀, 浜辺美波, 北村有起哉, 井之脇海, 道枝駿佑, 横内亜弓, 板垣李光人, 黒川祥子（原作）", "market_price": 4800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2022-01-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019729426'), '0019729426-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019729426'), '0019729426-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019729426'), '0019729426-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 木更津キャッツアイ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016431869', '木更津キャッツアイ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "岡田准一, 櫻井翔, 佐藤隆太, 宮藤官九郎（脚本）", "market_price": 21600, "buyback_price": 2455, "publisher": "ＤＶＤ", "saledate": "2010-12-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016431869'), '0016431869-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016431869'), '0016431869-U02', 7650, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016431869'), '0016431869-U03', 6300, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ナースのお仕事１　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001315601', 'ナースのお仕事１　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "観月ありさ", "market_price": 19800, "buyback_price": 9546, "publisher": "ＤＶＤ", "saledate": "2002-09-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 赤めだか
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018586925', '赤めだか', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也, ビートたけし, 濱田岳, 立川談春（原作）", "market_price": 3800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2016-03-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018586925'), '0018586925-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018586925'), '0018586925-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018586925'), '0018586925-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 鍵のかかった部屋　ＳＰ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017098673', '鍵のかかった部屋　ＳＰ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 戸田恵梨香, 佐藤浩市, 貴志祐介（原作）, Ｋｅｎ　Ａｒａｉ（音楽）", "market_price": 3800, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2014-05-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017098673'), '0017098673-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017098673'), '0017098673-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花より男子　Ｂｏｘ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015815724', '花より男子　Ｂｏｘ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央, 松本潤, 小栗旬, 松田翔太, 阿部力, 神尾葉子（原作）, 山下康介（音楽）", "market_price": 24000, "buyback_price": 4091, "publisher": "ＤＶＤ", "saledate": "2008-07-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015815724'), '0015815724-U01', 10500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015815724'), '0015815724-U02', 8925, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 流星の絆　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016092749', '流星の絆　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也, 錦戸亮, 戸田恵梨香, 東野圭吾（原作）, 河野伸（音楽）", "market_price": 19000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2009-04-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016092749'), '0016092749-U01', 4200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016092749'), '0016092749-U02', 3570, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016092749'), '0016092749-U03', 2940, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: もう誘拐なんてしない　特別版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016826446', 'もう誘拐なんてしない　特別版（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 新垣結衣, 佐藤隆太, 東川篤哉（原作）, 瀬川英史（音楽）", "market_price": 8500, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2012-07-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016826446'), '0016826446-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016826446'), '0016826446-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花より男子（４）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010539719', '花より男子（４）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央, 松本潤, 小栗旬, 松田翔太, 阿部力, 神尾葉子（原作）", "market_price": 3800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2006-03-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ２４ＨＯＵＲ　ＴＥＬＥＶＩＳＩＯＮ　ドラマスペシャル２０１３　今日の日はさようなら
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017046942', '２４ＨＯＵＲ　ＴＥＬＥＶＩＳＩＯＮ　ドラマスペシャル２０１３　今日の日はさようなら', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 深田恭子, 山田涼介, 幸和也（原作）, 松本淳一（音楽）", "market_price": 3800, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2014-01-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017046942'), '0017046942-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017046942'), '0017046942-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 聖者の行進　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011003901', '聖者の行進　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "いしだ壱成, 酒井法子, 広末涼子, 安藤政信, 雛形あきこ, 松本恵, 野島伸司, 千住明", "market_price": 22800, "buyback_price": 5455, "publisher": "ＤＶＤ", "saledate": "2003-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011003901'), '0011003901-U01', 13500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 好きな人がいること　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018740451', '好きな人がいること　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "桐谷美玲, 山﨑賢人, 三浦翔平, 世武裕子（音楽）", "market_price": 23500, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2016-12-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018740451'), '0018740451-U01', 7200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018740451'), '0018740451-U02', 6120, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花より男子２（リターンズ）ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015834115', '花より男子２（リターンズ）ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央, 松本潤, 小栗旬, 松田翔太, 阿部力, 神尾葉子（原作）", "market_price": 28800, "buyback_price": 5728, "publisher": "ＤＶＤ", "saledate": "2008-08-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015834115'), '0015834115-U01', 14500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015834115'), '0015834115-U02', 12325, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 花より男子（５）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010539742', '花より男子（５）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "井上真央, 松本潤, 小栗旬, 松田翔太, 阿部力, 神尾葉子（原作）", "market_price": 3800, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2006-03-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010539742'), '0010539742-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010539742'), '0010539742-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 逃げるは恥だが役に立つ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018787874', '逃げるは恥だが役に立つ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "新垣結衣, 星野源, 大谷亮平, 海野つなみ（原作）, 末廣健一郎（音楽）, ＭＡＹＵＫＯ（音楽）", "market_price": 20900, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2017-03-29"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018787874'), '0018787874-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018787874'), '0018787874-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018787874'), '0018787874-U03', 2030, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 今日から俺は！！　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019182861', '今日から俺は！！　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "賀来賢人, 伊藤健太郎, 清野菜名, 西森博之（原作）, 瀬川英史（音楽）", "market_price": 24000, "buyback_price": 1455, "publisher": "ＤＶＤ", "saledate": "2019-04-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019182861'), '0019182861-U01', 6800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019182861'), '0019182861-U02', 5780, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019182861'), '0019182861-U03', 4760, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: リーガルハイ　２ｎｄシーズン　完全版　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017092055', 'リーガルハイ　２ｎｄシーズン　完全版　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "堺雅人, 新垣結衣, 岡田将生, 林ゆうき（音楽）", "market_price": 19000, "buyback_price": 5728, "publisher": "ＤＶＤ", "saledate": "2014-03-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 怪物くん完全新作スペシャル！！
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016724812', '怪物くん完全新作スペシャル！！', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "大野智, 松岡昌宏, 八嶋智人, 川島海荷, 藤子不二雄Ａ（原作）, 井筒昭雄（音楽）", "market_price": 3800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2011-12-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016724812'), '0016724812-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チャンネルはそのまま！（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019415975', 'チャンネルはそのまま！（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "芳根京子, 飯島寛騎, 宮下かな子, 長田拓郎, ＴＥＡＭ　ＮＡＣＳ", "market_price": 7500, "buyback_price": 6364, "publisher": "ＤＶＤ", "saledate": "2020-03-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 海猿　ＵＭＩＺＡＲＵ　ＥＶＯＬＵＴＩＯＮ　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010532602', '海猿　ＵＭＩＺＡＲＵ　ＥＶＯＬＵＴＩＯＮ　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "伊藤英明, 加藤あい, 仲村トオル, 佐藤隆太", "market_price": 23800, "buyback_price": 6819, "publisher": "ＤＶＤ", "saledate": "2006-01-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010532602'), '0010532602-U01', 17500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プロポーズ大作戦　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015631940', 'プロポーズ大作戦　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "山下智久／長澤まさみ, 榮倉奈々", "market_price": 22800, "buyback_price": 5000, "publisher": "ＤＶＤ", "saledate": "2007-12-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015631940'), '0015631940-U01', 12500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015631940'), '0015631940-U02', 10625, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 勇者ヨシヒコと魔王の城　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016686961', '勇者ヨシヒコと魔王の城　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "山田孝之, 木南晴夏, 宅麻伸", "market_price": 15200, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2011-11-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016686961'), '0016686961-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016686961'), '0016686961-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016686961'), '0016686961-U03', 2030, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 連続テレビ小説　あまちゃん　完全版　ＤＶＤ－ＢＯＸ３
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017037849', '連続テレビ小説　あまちゃん　完全版　ＤＶＤ－ＢＯＸ３', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "能年玲奈, 小泉今日子, 尾美としのり, 大友良英（音楽）", "market_price": 19000, "buyback_price": 2728, "publisher": "ＤＶＤ", "saledate": "2014-01-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017037849'), '0017037849-U01', 7200, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ゲゲゲの女房　完全版　ＤＶＤ－ＢＯＸ　１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016377253', 'ゲゲゲの女房　完全版　ＤＶＤ－ＢＯＸ　１', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松下奈緒, 向井理, 野際陽子, 窪田ミナ（音楽）", "market_price": 15200, "buyback_price": 1637, "publisher": "ＤＶＤ", "saledate": "2010-08-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016377253'), '0016377253-U01', 4000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 連続テレビ小説　あまちゃん　完全版　ＤＶＤ－ＢＯＸ２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017025874', '連続テレビ小説　あまちゃん　完全版　ＤＶＤ－ＢＯＸ２', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "能年玲奈, 小泉今日子, 尾美としのり, 大友良英（音楽）", "market_price": 15200, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2013-11-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017025874'), '0017025874-U01', 5400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017025874'), '0017025874-U02', 4590, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｎのために　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017273771', 'Ｎのために　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "榮倉奈々, 窪田正孝, 賀来賢人, 湊かなえ（原作）, 横山克（音楽）", "market_price": 24000, "buyback_price": 3637, "publisher": "ＤＶＤ", "saledate": "2015-03-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017273771'), '0017273771-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ラッキーセブン　スペシャル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016949808', 'ラッキーセブン　スペシャル（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松本潤, 瑛太, 仲里依紗", "market_price": 4700, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2013-04-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016949808'), '0016949808-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: タイガー＆ドラゴン「三枚起請」の回
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010450048', 'タイガー＆ドラゴン「三枚起請」の回', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "長瀬智也, 岡田准一, 伊東美咲, 塚本高史, 西田敏行, 宮藤官九郎（脚本）, 磯山晶（プロデューサー）, 金子文紀（演出）", "market_price": 4700, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2005-03-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ドクターＸ　～外科医・大門未知子～　７　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019778458', 'ドクターＸ　～外科医・大門未知子～　７　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "米倉涼子, 野村萬斎, 内田有紀, 勝村政信, 鈴木浩介, 今田美桜, 小籔千豊, 沢田完（音楽）", "market_price": 21000, "buyback_price": 6364, "publisher": "ＤＶＤ", "saledate": "2022-04-13"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019778458'), '0019778458-U01', 16500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 流星の絆　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017360579', '流星の絆　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "二宮和也, 錦戸亮, 戸田恵梨香, 東野圭吾（原作）, 河野伸（音楽）", "market_price": 24000, "buyback_price": 3364, "publisher": "ＤＶＤ", "saledate": "2015-07-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017360579'), '0017360579-U01', 8600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017360579'), '0017360579-U02', 7310, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ハチミツとクローバー　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015849195', 'ハチミツとクローバー　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "成海璃子, 生田斗真, 原田夏希, 向井理, 成宮寛貴, 羽海野チカ（原作）", "market_price": 22800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2008-07-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015849195'), '0015849195-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: レッドアイズ　監視捜査班　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019618048', 'レッドアイズ　監視捜査班　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "亀梨和也, 松下奈緒, 趣里, シシド・カフカ, 松村北斗, 川瀬陽太, 長田成哉, カワイヒデヒロ（音楽）", "market_price": 19000, "buyback_price": 364, "publisher": "ＤＶＤ", "saledate": "2021-07-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019618048'), '0019618048-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019618048'), '0019618048-U02', 2635, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019618048'), '0019618048-U03', 2170, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 天国に一番近い男
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016304530', '天国に一番近い男', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "松岡昌宏, 奥菜恵, 陣内孝則", "market_price": 22800, "buyback_price": 5728, "publisher": "ＤＶＤ", "saledate": "2010-05-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 木更津キャッツアイ　第１巻
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001243393', '木更津キャッツアイ　第１巻', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "岡田准一", "market_price": 3800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2002-06-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001243393'), '0001243393-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 野ブタ。をプロデュース　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010742387', '野ブタ。をプロデュース　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "亀梨和也／山下智久／堀北真希／戸田恵梨香", "market_price": 17200, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2006-04-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010742387'), '0010742387-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010742387'), '0010742387-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010742387'), '0010742387-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ナースのお仕事２　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010759041', 'ナースのお仕事２　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "観月ありさ, 松下由樹, 松岡昌宏, 伊藤かずえ, 田口浩正, 上原さくら, 江頭美智留, 鴨宮諒", "market_price": 19800, "buyback_price": 6091, "publisher": "ＤＶＤ", "saledate": "2002-10-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010759041'), '0010759041-U01', 15500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010759041'), '0010759041-U02', 13175, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 海猿　ＵＭＩＺＡＲＵ　ＥＶＯＬＵＴＩＯＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016825861', '海猿　ＵＭＩＺＡＲＵ　ＥＶＯＬＵＴＩＯＮ　Ｂｌｕ－ｒａｙ　ＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-domestic-drama'), '{"author": "伊藤英明, 加藤あい, 仲村トオル, 佐藤秀峰（原作）, 佐藤直紀（音楽）", "market_price": 23800, "buyback_price": 23637, "publisher": "ＤＶＤ", "saledate": "2012-07-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016825861'), '0016825861-U01', 60000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016825861'), '0016825861-U02', 51000, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- ==========================================
--  Overseas Drama DVD (video-overseas-drama)
-- ==========================================

-- Insert product catalog: プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015186514', 'プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル, ロビン・タニー", "market_price": 20000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2007-04-27"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015186514'), '0015186514-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015186514'), '0015186514-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　シーズンⅡ　ＤＶＤコレクターズＢＯＸ２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015373080', 'プリズン・ブレイク　シーズンⅡ　ＤＶＤコレクターズＢＯＸ２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 9800, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2007-09-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015373080'), '0015373080-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011148932', 'プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル, ロビン・タニー", "market_price": 9800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-06-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011148932'), '0011148932-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン３　コンパクトＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016838995', 'ＬＯＳＴ　シーズン３　コンパクトＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジェフリー・エイブラムス（製作総指揮）", "market_price": 4762, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2012-08-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838995'), '0016838995-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838995'), '0016838995-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838995'), '0016838995-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015111963', 'プリズン・ブレイク　ＤＶＤコレクターズＢＯＸ２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル, ロビン・タニー", "market_price": 9800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-12-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015111963'), '0015111963-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＣＳＩ：マイアミ　ＳＥＡＳＯＮ２　コンプリートＤＶＤ　ＢＯＸ－２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015239419', 'ＣＳＩ：マイアミ　ＳＥＡＳＯＮ２　コンプリートＤＶＤ　ＢＯＸ－２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "デヴィッド・カルーソ, エミリー・プロクター, ジェリー・ブラッカイマー（製作総指揮）", "market_price": 12800, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2007-06-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015239419'), '0015239419-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンＩ　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001519628', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンＩ　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, レスリー・ホープ, エリシャ・カスバート, サラ・クラーク, デニス・ヘイスバート, ルー・ダイアモンド・フィリップス, デニス・ホッパー, スティーヴン・ホプキンス（監督）", "market_price": 24000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2004-08-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　シーズン２　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016378689', 'プリズン・ブレイク　シーズン２　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル, サラ・ウェイン・キャリーズ", "market_price": 4752, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2010-08-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378689'), '0016378689-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378689'), '0016378689-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378689'), '0016378689-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅡ　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001464085', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅡ　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, レスリー・ホープ, エリシャ・カスバート, サラ・クラーク, デニス・ヘイスバート, ルー・ダイアモンド・フィリップス, デニス・ホッパー, スティーヴン・ホプキンス（監督）", "market_price": 24000, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2004-05-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001464085'), '0001464085-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン３　ＣＯＭＰＬＥＴＥ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015695702', 'ＬＯＳＴ　シーズン３　ＣＯＭＰＬＥＴＥ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジェフリー・エイブラムス（製作総指揮）", "market_price": 20000, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2008-02-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015695702'), '0015695702-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015695702'), '0015695702-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015695702'), '0015695702-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン２　ＣＯＭＰＬＥＴＥ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015140296', 'ＬＯＳＴ　シーズン２　ＣＯＭＰＬＥＴＥ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジェフリー・エイブラムス（製作総指揮）", "market_price": 20000, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2007-03-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン５　ＣＯＭＰＬＥＴＥ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016264686', 'ＬＯＳＴ　シーズン５　ＣＯＭＰＬＥＴＥ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジョシュ・ホロウェイ, ジェフリー・エイブラムス（製作総指揮）", "market_price": 15000, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2010-01-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016264686'), '0016264686-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016264686'), '0016264686-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　シーズン１　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016344829', 'プリズン・ブレイク　シーズン１　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 4752, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2010-05-28"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016344829'), '0016344829-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016344829'), '0016344829-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016344829'), '0016344829-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン１　ＤＶＤ　ＣＯＭＰＬＥＴＥ　ＳＬＩＭ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015998861', 'ＬＯＳＴ　シーズン１　ＤＶＤ　ＣＯＭＰＬＥＴＥ　ＳＬＩＭ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジェフリー・エイブラムス（製作総指揮）", "market_price": 10000, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2008-12-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015998861'), '0015998861-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＣＳＩ：ＮＹ　コンプリートＤＶＤ　ＢＯＸ－１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015107966', 'ＣＳＩ：ＮＹ　コンプリートＤＶＤ　ＢＯＸ－１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ゲイリー・シニーズ, メリーナ・カナカレデス, カーマイン・ジョヴィナッツォ, ジェリー・ブラッカイマー（製作総指揮）", "market_price": 12800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-12-01"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015107966'), '0015107966-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015107966'), '0015107966-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015107966'), '0015107966-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ　シーズン２　ＤＶＤ－ＳＥＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016384844', 'Ｄｒ．ＨＯＵＳＥ　シーズン２　ＤＶＤ－ＳＥＴ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, リサ・エデルシュタイン, ロバート・ショーン・レナード", "market_price": 2838, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2010-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016384844'), '0016384844-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＣＳＩ：マイアミ　コンプリート・ボックスⅡ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011118304', 'ＣＳＩ：マイアミ　コンプリート・ボックスⅡ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "デヴィッド・カルーソ", "market_price": 12800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-10-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011118304'), '0011118304-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011118304'), '0011118304-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　ファイナル・シーズン　ＣＯＭＰＬＥＴＥ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016471357', 'ＬＯＳＴ　ファイナル・シーズン　ＣＯＭＰＬＥＴＥ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジョシュ・ホロウェイ, ジェフリー・エイブラムス（製作総指揮）", "market_price": 15000, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2011-01-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016471357'), '0016471357-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016471357'), '0016471357-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016471357'), '0016471357-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: フルハウス＜ファースト＞セット１　（ＤＩＳＣ１～３）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011032530', 'フルハウス＜ファースト＞セット１　（ＤＩＳＣ１～３）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジョン・ステイモス, ボブ・サゲット, ジェフ・フランクリン（製作総指揮）", "market_price": 2490, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-08-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011032530'), '0011032530-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011032530'), '0011032530-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅣ　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010434645', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅣ　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド", "market_price": 24000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-11-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434645'), '0010434645-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434645'), '0010434645-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＣＳＩ：科学捜査班　ＳＥＡＳＯＮ２　コンプリート・ボックス　Ⅰ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011048127', 'ＣＳＩ：科学捜査班　ＳＥＡＳＯＮ２　コンプリート・ボックス　Ⅰ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウィリアム・ピーターセン, マージ・ヘルゲンバーガー, ゲイリー・ドゥーダン, ジョージャ・フォックス, ポール・ギルフォイル, ジェリー・ブラッカイマー（製作総指揮）, キャロル・メンデルソーン（製作総指揮）, アン・ドナヒュー（製作総指揮）", "market_price": 12800, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-02-23"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011048127'), '0011048127-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011048127'), '0011048127-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011048127'), '0011048127-U03', 210, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クローザー＜サード＞セット１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016486841', 'クローザー＜サード＞セット１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キラ・セジウィック, Ｊ．Ｋ．シモンズ, コリー・レイノルズ", "market_price": 2490, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2011-03-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016486841'), '0016486841-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ターミネーター：サラ・コナー　クロニクルズ＜セカンド・シーズン＞コレクターズ・ボックス１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016128842', 'ターミネーター：サラ・コナー　クロニクルズ＜セカンド・シーズン＞コレクターズ・ボックス１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "レナ・ヘディ, トーマス・デッカー, サマー・グロー", "market_price": 9333, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-06-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016128842'), '0016128842-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016128842'), '0016128842-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－リブ・アナザー・デイ　ブルーレイＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017241173', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－リブ・アナザー・デイ　ブルーレイＢＯＸ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, メアリー・リン・ライスカブ, キム・レイヴァー", "market_price": 12000, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2015-03-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017241173'), '0017241173-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017241173'), '0017241173-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017241173'), '0017241173-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 吸血キラー／聖少女バフィー　シーズン１　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016713102', '吸血キラー／聖少女バフィー　シーズン１　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "サラ・ミッシェル・ゲラー, ニコラス・ブレンドン, アリソン・ハニガン", "market_price": 4752, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2011-11-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016713102'), '0016713102-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クリミナル・マインド　ＦＢＩ　ｖｓ．異常犯罪　シーズン３　コンパクト　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016823260', 'クリミナル・マインド　ＦＢＩ　ｖｓ．異常犯罪　シーズン３　コンパクト　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジョー・マンテーニャ, トーマス・ギブソン, シェマー・ムーア", "market_price": 4762, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2012-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016823260'), '0016823260-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016823260'), '0016823260-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016823260'), '0016823260-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞コレクターズ・ボックス２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016606094', 'ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞コレクターズ・ボックス２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マギー・Ｑ, リンゼイ・フォンセカ, シェーン・ウェスト", "market_price": 9333, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-09-14"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016606094'), '0016606094-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　Ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011064765', 'プリズン・ブレイク　Ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 933, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-05-11"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011064765'), '0011064765-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クリミナル・マインド　ＦＢＩ　ｖｓ．異常犯罪　シーズン２　コレクターズＢＯＸ　Ｐａｒｔ２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016083682', 'クリミナル・マインド　ＦＢＩ　ｖｓ．異常犯罪　シーズン２　コレクターズＢＯＸ　Ｐａｒｔ２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マンディ・パティンキン, トーマス・ギブソン, シェマー・ムーア", "market_price": 10000, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2009-03-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016083682'), '0016083682-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016083682'), '0016083682-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016083682'), '0016083682-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＥＲＯＥＳ　シーズン１　ＤＶＤ－ＳＥＴ　２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016202405', 'ＨＥＲＯＥＳ　シーズン１　ＤＶＤ－ＳＥＴ　２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マイロ・ヴィンティミリア, マシ・オカ, ヘイデン・パネッティーア", "market_price": 4743, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-09-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　ファイナル・シーズン　ＤＶＤコレクターズＢＯＸ１（初回生産限定版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016119055', 'プリズン・ブレイク　ファイナル・シーズン　ＤＶＤコレクターズＢＯＸ１（初回生産限定版）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 9800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2009-06-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016119055'), '0016119055-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　コンプリート　ブルーレイＢＯＸ（「プリズン・ブレイク　シーズン５」付）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018935616', 'プリズン・ブレイク　コンプリート　ブルーレイＢＯＸ（「プリズン・ブレイク　シーズン５」付）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 29800, "buyback_price": 6091, "publisher": "ＤＶＤ", "saledate": "2017-12-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018935616'), '0018935616-U01', 15500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018935616'), '0018935616-U02', 13175, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ザ・パシフィック　セット
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017411080', 'ザ・パシフィック　セット', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェームズ・バッジ・デール, ジョセフ・マッゼロ, ジョン・セダ", "market_price": 4980, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2015-11-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017411080'), '0017411080-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017411080'), '0017411080-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017411080'), '0017411080-U03', 1750, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ｇｌｅｅ／グリー　シーズン１　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016456718', 'ｇｌｅｅ／グリー　シーズン１　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・モリソン, コリー・モンテース, リー・ミッシェル", "market_price": 14400, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-02-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016456718'), '0016456718-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ　シーズン５　ＤＶＤ－ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016517368', 'Ｄｒ．ＨＯＵＳＥ　シーズン５　ＤＶＤ－ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, リサ・エデルシュタイン, ロバート・ショーン・レナード", "market_price": 4743, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016517368'), '0016517368-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: プリズン・ブレイク　ファイナル・ブレイク
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016258065', 'プリズン・ブレイク　ファイナル・ブレイク', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ウェントワース・ミラー, ドミニク・パーセル", "market_price": 3800, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2010-02-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016258065'), '0016258065-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＨＥＲＯＥＳ／ヒーローズ　Ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015659713', 'ＨＥＲＯＥＳ／ヒーローズ　Ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マイロ・ヴィンティミリア, マシ・オカ, ヘイデン・パネッティーア", "market_price": 933, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2008-02-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015659713'), '0015659713-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞セット２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017023349', 'ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞セット２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マギー・Ｑ, リンゼイ・フォンセカ, シェーン・ウェスト", "market_price": 2490, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2013-09-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017023349'), '0017023349-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017023349'), '0017023349-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン２＜ＳＥＡＳＯＮＳ　ブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018878149', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン２＜ＳＥＡＳＯＮＳ　ブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, エリシャ・カスバート, デニス・ヘイスバート", "market_price": 6225, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2017-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018878149'), '0018878149-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018878149'), '0018878149-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ　シーズン２　ＤＶＤ－ＢＯＸ１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016176027', 'Ｄｒ．ＨＯＵＳＥ　シーズン２　ＤＶＤ－ＢＯＸ１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, ジェシー・スペンサー, リサ・エデルシュタイン", "market_price": 9500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-07-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016176027'), '0016176027-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016176027'), '0016176027-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－１０周年記念コンプリートＤＶＤ－ＢＯＸ（１０５枚組）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016916273', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－１０周年記念コンプリートＤＶＤ－ＢＯＸ（１０５枚組）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド", "market_price": 30400, "buyback_price": 6091, "publisher": "ＤＶＤ", "saledate": "2012-12-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016916273'), '0016916273-U01', 15500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016916273'), '0016916273-U02', 13175, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ホワイトカラー　シーズン３　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017148533', 'ホワイトカラー　シーズン３　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マット・ボマー, ティム・ディケイ, ティファニー・ティーセン", "market_price": 4752, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2014-08-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017148533'), '0017148533-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017148533'), '0017148533-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ／ドクター・ハウス：ファイナル・シーズン　バリューパック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017331682', 'Ｄｒ．ＨＯＵＳＥ／ドクター・ハウス：ファイナル・シーズン　バリューパック', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, ロバート・ショーン・レナード, オマー・エップス", "market_price": 4743, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2015-07-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017331682'), '0017331682-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017331682'), '0017331682-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ダーク・エンジェルⅡ　ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001243476', 'ダーク・エンジェルⅡ　ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェシカ・アルバ, マイケル・ウェザリー, ジェンセン・アクレス, ジェームズ・キャメロン（製作総指揮）, チャールズ・Ｈ．エグリー（製作総指揮）", "market_price": 2980, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2002-07-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001243476'), '0001243476-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン１＜ＳＥＡＳＯＮＳ　ブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018878148', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン１＜ＳＥＡＳＯＮＳ　ブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, レスリー・ホープ, エリシャ・カスバート", "market_price": 6225, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2017-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018878148'), '0018878148-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018878148'), '0018878148-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン８＜ＳＥＡＳＯＮＳブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018856363', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズン８＜ＳＥＡＳＯＮＳブルーレイ・ボックス＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド", "market_price": 6225, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2017-07-21"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018856363'), '0018856363-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－トリロジーＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010434646', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－トリロジーＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド", "market_price": 24000, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2005-08-12"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434646'), '0010434646-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434646'), '0010434646-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434646'), '0010434646-U03', 910, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＧＯＴＨＡＭ／ゴッサム＜ファースト＞コンプリート・セット（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018942422', 'ＧＯＴＨＡＭ／ゴッサム＜ファースト＞コンプリート・セット（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ベン・マッケンジー, ドナル・ローグ, デヴィッド・マズーズ", "market_price": 6171, "buyback_price": 46, "publisher": "ＤＶＤ", "saledate": "2017-11-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018942422'), '0018942422-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅠ　Ｖｏｌ．２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010434402', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅠ　Ｖｏｌ．２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, レスリー・ホープ, エリシャ・カスバート, サラ・クラーク, デニス・ヘイスバート, ルー・ダイアモンド・フィリップス, デニス・ホッパー, スティーヴン・ホプキンス（監督）", "market_price": 1695, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-02-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010434402'), '0010434402-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞セット１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017023348', 'ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞セット１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マギー・Ｑ, リンゼイ・フォンセカ, シェーン・ウェスト", "market_price": 2490, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2013-09-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017023348'), '0017023348-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017023348'), '0017023348-U02', 612, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－ＤＶＤコレクターズ・ボックス２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001386450', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－ＤＶＤコレクターズ・ボックス２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, レスリー・ホープ, エリシャ・カスバート, サラ・クラーク, デニス・ヘイスバート, ルー・ダイアモンド・フィリップス, デニス・ホッパー, スティーヴン・ホプキンス（監督）", "market_price": 12000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2003-12-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001386450'), '0001386450-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅦ　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016552189', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅦ　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, チェリー・ジョーンズ, アニー・ワーシング", "market_price": 4752, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2011-07-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016552189'), '0016552189-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016552189'), '0016552189-U02', 1360, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016552189'), '0016552189-U03', 1120, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＧＯＴＨＡＭ／ゴッサム　＜セカンド・シーズン＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018676575', 'ＧＯＴＨＡＭ／ゴッサム　＜セカンド・シーズン＞（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ベン・マッケンジー, ドナル・ローグ, デヴィッド・マズーズ", "market_price": 16200, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2016-09-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018676575'), '0018676575-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018676575'), '0018676575-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ウォーキング・デッド　シーズン１１（ファイナル・シーズン）　Ｂｌｕ－ｒａｙ　ＢＯＸ２（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020101654', 'ウォーキング・デッド　シーズン１１（ファイナル・シーズン）　Ｂｌｕ－ｒａｙ　ＢＯＸ２（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ノーマン・リーダス, メリッサ・スーザン・マクブライド, ジェフリー・ディーン・モーガン, ロバート・カークマン", "market_price": 12900, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2023-09-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン１　ＣＯＭＰＬＥＴＥ　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011005106', 'ＬＯＳＴ　シーズン１　ＣＯＭＰＬＥＴＥ　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ナヴィーン・アンドリュース, ジェフリー・エイブラムス（製作総指揮）", "market_price": 20000, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2006-08-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011005106'), '0011005106-U01', 1100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011005106'), '0011005106-U02', 935, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011005106'), '0011005106-U03', 770, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｈａｗａｉｉ　Ｆｉｖｅ－０　ＤＶＤ－ＢＯＸ　シーズン３　Ｐａｒｔ１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017042349', 'Ｈａｗａｉｉ　Ｆｉｖｅ－０　ＤＶＤ－ＢＯＸ　シーズン３　Ｐａｒｔ１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "アレックス・オロックリン, スコット・カーン, ダニエル・ディ・キム", "market_price": 9333, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2013-11-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017042349'), '0017042349-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017042349'), '0017042349-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ゴシップガール＜セカンド・シーズン＞セット１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016876065', 'ゴシップガール＜セカンド・シーズン＞セット１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ブレイク・ライヴリー, レイトン・ミースター, ペン・バッジリー, セシリー・フォン・ジーゲザー（原作）", "market_price": 2490, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2012-10-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016876065'), '0016876065-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅢ　ＤＶＤコレクターズＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010010069', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅢ　ＤＶＤコレクターズＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "スティーヴン・ホプキンス（監督）, キーファー・サザーランド", "market_price": 24000, "buyback_price": 19, "publisher": "ＤＶＤ", "saledate": "2004-12-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010010069'), '0010010069-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＬＯＳＴ　シーズン６　コンパクトＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016838998', 'ＬＯＳＴ　シーズン６　コンパクトＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・フォックス, エヴァンジェリン・リリー, ジョシュ・ホロウェイ, ジェフリー・エイブラムス（製作総指揮）", "market_price": 4762, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2012-09-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838998'), '0016838998-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838998'), '0016838998-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016838998'), '0016838998-U03', 1610, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞Ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016506353', 'ＮＩＫＩＴＡ／ニキータ＜ファースト・シーズン＞Ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "映画・ドラマ, マギー・Ｑ, リンゼイ・フォンセカ, シェーン・ウェスト", "market_price": 933, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-06-15"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016506353'), '0016506353-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: チャールズ・ディケンズの骨董屋　後編
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015872773', 'チャールズ・ディケンズの骨董屋　後編', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ピーター・ユスティノフ, トム・コートネイ, ケヴィン・コナー（監督）", "market_price": 500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2008-06-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015872773'), '0015872773-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015872773'), '0015872773-U02', 85, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ　シーズン１　ＤＶＤ－ＳＥＴ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016374207', 'Ｄｒ．ＨＯＵＳＥ　シーズン１　ＤＶＤ－ＳＥＴ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, リサ・エデルシュタイン, ロバート・ショーン・レナード", "market_price": 2838, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2010-08-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016374207'), '0016374207-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016374207'), '0016374207-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅣ　ＳＥＡＳＯＮＳコンパクト・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016378688', '２４－ＴＷＥＮＴＹ　ＦＯＵＲ－シーズンⅣ　ＳＥＡＳＯＮＳコンパクト・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キーファー・サザーランド, キム・レイヴァー", "market_price": 4752, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2010-08-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378688'), '0016378688-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378688'), '0016378688-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016378688'), '0016378688-U03', 350, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ｇｌｅｅ／グリー　シーズン１　踊る♪合唱部！？　Ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016456719', 'ｇｌｅｅ／グリー　シーズン１　踊る♪合唱部！？　Ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マシュー・モリソン, コリー・モンテース, リー・ミッシェル", "market_price": 1419, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2011-01-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＧＯＴＨＡＭ／ゴッサム　＜ファースト・シーズン＞コンプリート・ボックス（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017319690', 'ＧＯＴＨＡＭ／ゴッサム　＜ファースト・シーズン＞コンプリート・ボックス（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ベン・マッケンジー, ドナル・ローグ, デヴィッド・マズーズ", "market_price": 16200, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2015-09-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017319690'), '0017319690-U01', 900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017319690'), '0017319690-U02', 765, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＧＯＴＨＡＭ／ゴッサム　コンプリート・シリーズ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019260915', 'ＧＯＴＨＡＭ／ゴッサム　コンプリート・シリーズ（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ベン・マッケンジー, ドナル・ローグ, デヴィッド・マズーズ", "market_price": 32727, "buyback_price": 3637, "publisher": "ＤＶＤ", "saledate": "2019-11-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019260915'), '0019260915-U01', 9000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: Ｄｒ．ＨＯＵＳＥ　シーズン１　ＤＶＤ－ＢＯＸ１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016176028', 'Ｄｒ．ＨＯＵＳＥ　シーズン１　ＤＶＤ－ＢＯＸ１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ヒュー・ローリー, リサ・エデルシュタイン, ロバート・ショーン・レナード", "market_price": 9500, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2009-07-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016176028'), '0016176028-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016176028'), '0016176028-U02', 255, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅱ　ＤＶＤ－ＢＯＸ　ｖｏｌ．２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001234756', 'アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅱ　ＤＶＤ－ＢＯＸ　ｖｏｌ．２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キャリスタ・フロックハート, ギル・ベローズ, グレッグ・ジャーマン, コートニー・ソーン＝スミス, ピーター・マクニコル, ジェーン・クラコフスキー, ルーシー・リュー, デヴィッド・Ｅ．ケリー（製作総指揮）", "market_price": 7480, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2001-12-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: フライング・コップ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016984658', 'フライング・コップ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "レスリー・ニールセン, アラン・ノース, アイラ・ニューボーン（音楽）", "market_price": 3800, "buyback_price": 2364, "publisher": "ＤＶＤ", "saledate": "2013-05-17"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 新スター・トレック　ＤＶＤコンプリート・シーズン１　コレクターズ・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001243348', '新スター・トレック　ＤＶＤコンプリート・シーズン１　コレクターズ・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "パトリック・スチュワート", "market_price": 17800, "buyback_price": 455, "publisher": "ＤＶＤ", "saledate": "2002-07-05"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001243348'), '0001243348-U01', 1800, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001243348'), '0001243348-U02', 1530, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001243348'), '0001243348-U03', 1260, 'C', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: シークレット・アイドル　ハンナ・モンタナ　シーズン１　コンパクトＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016952838', 'シークレット・アイドル　ハンナ・モンタナ　シーズン１　コンパクトＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "マイリー・サイラス, ビリー・レイ・サイラス, ジェイソン・アールズ", "market_price": 4762, "buyback_price": 91, "publisher": "ＤＶＤ", "saledate": "2013-03-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016952838'), '0016952838-U01', 1300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016952838'), '0016952838-U02', 1105, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クリミナル・マインド／ＦＢＩ　ｖｓ．異常犯罪　シーズン１２　コンパクト　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019418757', 'クリミナル・マインド／ＦＢＩ　ｖｓ．異常犯罪　シーズン１２　コンパクト　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジョー・マンテーニャ, トーマス・ギブソン, マシュー・グレイ・ギュプラー", "market_price": 4762, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2020-05-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019418757'), '0019418757-U01', 2500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019418757'), '0019418757-U02', 2125, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ザ・ベスト・オブ・ナイトライダー　Ｖｏｌ．２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015107188', 'ザ・ベスト・オブ・ナイトライダー　Ｖｏｌ．２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "デヴィッド・ハッセルホフ, エドワード・マルヘア, パトリシア・マクファーソン", "market_price": 933, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2006-11-30"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015107188'), '0015107188-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ミレニアム　サード　ＤＶＤコレクターズ・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010525472', 'ミレニアム　サード　ＤＶＤコレクターズ・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "クリス・カーター（製作総指揮）, ランス・ヘンリクセン", "market_price": 16800, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2005-04-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0010525472'), '0010525472-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スパイ大作戦　シーズン７（日本語完全版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016386822', 'スパイ大作戦　シーズン７（日本語完全版）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ピーター・グレイヴス, グレッグ・モリス", "market_price": 14800, "buyback_price": 1364, "publisher": "ＤＶＤ", "saledate": "2010-08-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016386822'), '0016386822-U01', 3400, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016386822'), '0016386822-U02', 2890, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ヴァンパイア・ダイアリーズ＜セカンド・シーズン＞セット１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0017023354', 'ヴァンパイア・ダイアリーズ＜セカンド・シーズン＞セット１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ニーナ・ドブレフ, ポール・ウェズレイ, イアン・サマーホルダー, Ｌ．Ｊ．スミス（原作）", "market_price": 4980, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2013-09-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0017023354'), '0017023354-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＥＲ　緊急救命室　＜ファースト＞ＤＶＤコレクターズセット
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015461592', 'ＥＲ　緊急救命室　＜ファースト＞ＤＶＤコレクターズセット', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "アンソニー・エドワーズ", "market_price": 23800, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "1999-09-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015461592'), '0015461592-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: マグナム・コップ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001230659', 'マグナム・コップ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "チャールズ・ブロンソン, セバスチャン・スペンス, バーバラ・ウィリアムス, キム・ウィークス, ジョー・ペニー, シェルドン・ラリー, ニコラス・Ｊ．グレイ", "market_price": 4700, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2001-06-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001230659'), '0001230659-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＣＯＲＰＩＯＮ／スコーピオン　シーズン２＜トク選ＢＯＸ＞
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019016367', 'ＳＣＯＲＰＩＯＮ／スコーピオン　シーズン２＜トク選ＢＯＸ＞', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "エリス・ガベル, キャサリン・マクフィー, ロバート・パトリック", "market_price": 4757, "buyback_price": 546, "publisher": "ＤＶＤ", "saledate": "2018-05-09"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0019016367'), '0019016367-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スパイ大作戦　シーズン６（日本語完全版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016262115', 'スパイ大作戦　シーズン６（日本語完全版）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ピーター・グレイヴス, グレッグ・モリス", "market_price": 14800, "buyback_price": 1273, "publisher": "ＤＶＤ", "saledate": "2010-01-22"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016262115'), '0016262115-U01', 3100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016262115'), '0016262115-U02', 2635, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: フレンズⅣ＜フォース・シーズン＞セット１　（ＤＩＳＣ１～３）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011087102', 'フレンズⅣ＜フォース・シーズン＞セット１　（ＤＩＳＣ１～３）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェニファー・アニストン, コートニー・コックス, リサ・クドロー", "market_price": 2490, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-08-26"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011087102'), '0011087102-U01', 100, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＵＰＥＲＮＡＴＵＲＡＬ　ⅩⅠ＜イレブン・シーズン＞コンプリート・ボックス（２ＢＯＸセット）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018702368', 'ＳＵＰＥＲＮＡＴＵＲＡＬ　ⅩⅠ＜イレブン・シーズン＞コンプリート・ボックス（２ＢＯＸセット）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジャレッド・パダレッキ, ジェンセン・アクレス, ルース・コネル", "market_price": 14300, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2016-09-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018702368'), '0018702368-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅲ　ＤＶＤ－ＢＯＸ　ｖｏｌ．２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001239360', 'アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅲ　ＤＶＤ－ＢＯＸ　ｖｏｌ．２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キャリスタ・フロックハート, ギル・ベローズ, グレッグ・ジャーマン, コートニー・ソーン＝スミス, リサ・ニコル・カーソン, デヴィッド・Ｅ．ケリー（製作総指揮）", "market_price": 7480, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2002-03-08"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: パーソン・オブ・インタレスト＜ファースト＞コンプリート・セット（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016957627', 'パーソン・オブ・インタレスト＜ファースト＞コンプリート・セット（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジム・カヴィーゼル, マイケル・エマーソン, タラジ・Ｐ．ヘンソン", "market_price": 6171, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2013-03-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016957627'), '0016957627-U01', 1600, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 吸血キラー　聖少女バフィー　シーズンⅠ　Ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0010486798', '吸血キラー　聖少女バフィー　シーズンⅠ　Ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジョス・ウェドン（脚本、制作）, サラ・ミッシェル・ゲラー, ニコラス・ブレンドン, アリソン・ハニガン, アンソニー・スチュワート・ヘッド, デヴィッド・ボレアナズ", "market_price": 948, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-02-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: クローザー＜フィフス＞セット２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016944551', 'クローザー＜フィフス＞セット２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キラ・セジウィック, Ｊ．Ｋ．シモンズ, コリー・レイノルズ", "market_price": 2490, "buyback_price": 64, "publisher": "ＤＶＤ", "saledate": "2013-03-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016944551'), '0016944551-U01', 720, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: フレンズⅨ＜ナイン・シーズン＞ＤＶＤコレクターズセット１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011010159', 'フレンズⅨ＜ナイン・シーズン＞ＤＶＤコレクターズセット１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェニファー・アニストン, コートニー・コックス・アークエット, リサ・クドロー, マット・ルブラン, マシュー・ペリー, デヴィッド・シュワイマー, ケヴィン・Ｓ．ブライト（製作総指揮）, マルタ・カウフマン（製作総指揮）", "market_price": 6000, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2005-02-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011010159'), '0011010159-U01', 300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 将軍　ＳＨＯＧＵＮ　其の壱
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011059950', '将軍　ＳＨＯＧＵＮ　其の壱', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "リチャード・チェンバレン, 三船敏郎, ジェリー・ロンドン（監督）, ジェームズ・クラヴェル（原作）", "market_price": 1905, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2006-03-24"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ＣＳＩ：科学捜査班　ＳＥＡＳＯＮ２　コンプリート・ボックス　Ⅱ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0011147310', 'ＣＳＩ：科学捜査班　ＳＥＡＳＯＮ２　コンプリート・ボックス　Ⅱ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェリー・ブラッカイマー（製作総指揮）, キャロル・メンデルソーン（製作総指揮）, アン・ドナヒュー（製作総指揮）, ウィリアム・ピーターセン, マージ・ヘルゲンバーガー, ジョージ・イーズ, ゲイリー・ドゥーダン, ジョージャ・フォックス", "market_price": 12800, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2005-03-16"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011147310'), '0011147310-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0011147310'), '0011147310-U02', 425, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: クローザー＜サード＞セット２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016486906', 'クローザー＜サード＞セット２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キラ・セジウィック, Ｊ．Ｋ．シモンズ, コリー・レイノルズ", "market_price": 2490, "buyback_price": 28, "publisher": "ＤＶＤ", "saledate": "2011-03-02"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016486906'), '0016486906-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅱ　ＤＶＤ－ＢＯＸ　ｖｏｌ．１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001234755', 'アリー　ｍｙ　Ｌｏｖｅ（Ａｌｌｙ　ＭｃＢｅａｌ）Ⅱ　ＤＶＤ－ＢＯＸ　ｖｏｌ．１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "キャリスタ・フロックハート, ギル・ベローズ, グレッグ・ジャーマン, コートニー・ソーン＝スミス, ピーター・マクニコル, ジェーン・クラコフスキー, ルーシー・リュー, デヴィッド・Ｅ．ケリー（製作総指揮）", "market_price": 7480, "buyback_price": 5, "publisher": "ＤＶＤ", "saledate": "2001-12-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0001234755'), '0001234755-U01', 500, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ワンダヴィジョン　コレクターズ・エディション　スチールブック（数量限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0020216931', 'ワンダヴィジョン　コレクターズ・エディション　スチールブック（数量限定版）（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "エリザベス・オルセン, ポール・ベタニー, キャスリン・ハーン, テヨナ・パリス, カット・デニングス, ランドール・パーク", "market_price": 9900, "buyback_price": 2182, "publisher": "ＤＶＤ", "saledate": "2024-04-10"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ザ・ラストシップ＜ファイナル・シーズン＞コンプリート・ボックス
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0019236772', 'ザ・ラストシップ＜ファイナル・シーズン＞コンプリート・ボックス', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "エリック・デイン, ブリジット・リーガン, アダム・ボールドウィン", "market_price": 9400, "buyback_price": 1819, "publisher": "ＤＶＤ", "saledate": "2019-07-03"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: 地上最強の美女たち！チャーリーズ・エンジェル　コンプリート２ｎｄシーズン　セット２
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016197248', '地上最強の美女たち！チャーリーズ・エンジェル　コンプリート２ｎｄシーズン　セット２', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ケイト・ジャクソン, ジャクリン・スミス, シェリル・ラッド", "market_price": 3790, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2009-10-07"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ミステリーゾーン～Ｔｗｉｌｉｇｈｔ　Ｚｏｎｅ～１１
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0001229067', 'ミステリーゾーン～Ｔｗｉｌｉｇｈｔ　Ｚｏｎｅ～１１', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "（洋画）", "market_price": 4700, "buyback_price": 273, "publisher": "ＤＶＤ", "saledate": "2001-05-19"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

-- Insert product catalog: ゴースト～天国からのささやき　ファイナル・シーズン　コンパクト　ＢＯＸ
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016952836', 'ゴースト～天国からのささやき　ファイナル・シーズン　コンパクト　ＢＯＸ', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ジェニファー・ラヴ・ヒューイット（出演、製作）, デヴィッド・コンラッド, カムリン・マンハイム", "market_price": 4762, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2013-03-20"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016952836'), '0016952836-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ＳＵＰＥＲＧＩＲＬ／スーパーガール＜セカンド・シーズン＞コンプリート・ボックス（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018890539', 'ＳＵＰＥＲＧＩＲＬ／スーパーガール＜セカンド・シーズン＞コンプリート・ボックス（Ｂｌｕ－ｒａｙ　Ｄｉｓｃ）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "メリッサ・ブノワ, メカッド・ブルックス, カイラー・リー", "market_price": 16200, "buyback_price": 182, "publisher": "ＤＶＤ", "saledate": "2017-09-06"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018890539'), '0018890539-U01', 1900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018890539'), '0018890539-U02', 1615, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: 刑事コロンボ完全版３　バリューパック
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0016828783', '刑事コロンボ完全版３　バリューパック', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ピーター・フォーク", "market_price": 4743, "buyback_price": 728, "publisher": "ＤＶＤ", "saledate": "2012-07-04"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016828783'), '0016828783-U01', 2300, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0016828783'), '0016828783-U02', 1955, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: スパイ大作戦　シーズン２（日本語完全版）
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0015223521', 'スパイ大作戦　シーズン２（日本語完全版）', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "ピーター・グレイヴス, マーティン・ランドー", "market_price": 17800, "buyback_price": 1091, "publisher": "ＤＶＤ", "saledate": "2007-05-25"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015223521'), '0015223521-U01', 2900, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0015223521'), '0015223521-U02', 2465, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;

-- Insert product catalog: ツイン・ピークス　ゴールド・ボックス　アンコール
INSERT INTO products (isbn_or_jan, title_ja, category_id, attributes) 
VALUES ('0018740401', 'ツイン・ピークス　ゴールド・ボックス　アンコール', (SELECT id FROM categories WHERE slug = 'video-overseas-drama'), '{"author": "カイル・マクラクラン, マイケル・オントキーン, シェリル・リー, アンジェロ・バダラメンティ（音楽）", "market_price": 9400, "buyback_price": 910, "publisher": "ＤＶＤ", "saledate": "2016-11-18"}'::jsonb) 
ON CONFLICT (isbn_or_jan) DO NOTHING;

INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018740401'), '0018740401-U01', 5000, 'A', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
INSERT INTO inventory_items (product_id, instore_code, price, condition_rank, status, item_type) 
VALUES ((SELECT id FROM products WHERE isbn_or_jan = '0018740401'), '0018740401-U02', 4250, 'B', 'AVAILABLE', 'USED') 
ON CONFLICT (instore_code) DO NOTHING;
