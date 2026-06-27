-- ==========================================
-- 1. DỌN SẠCH DATA VÀ RESET BIẾN ĐẾM ID VỀ LẠI SỐ 1
-- ==========================================

TRUNCATE TABLE order_items,
orders,
products,
categories RESTART IDENTITY CASCADE;

-- ==========================================
-- 2. INSERT DANH MỤC CẤP 1 (DANH MỤC CHA)
-- ==========================================
-- ID 1
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES ('Books', '書籍', 'books', NULL);

-- ID 2
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Manga / Comics',
        'コミック',
        'manga-comics',
        NULL
    );

-- ID 3
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'DVD / Blu-ray',
        'DVD・ブルーレイ',
        'dvd-blu-ray',
        NULL
    );

-- ID 4
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES ('Games', 'ゲーム', 'games', NULL);

-- ==========================================
-- 3. INSERT DANH MỤC CẤP 2 (DANH MỤC CON)
-- ==========================================

-- 3.1 Subcategories thuộc Books (parent_id = 1)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Novels',
        '小説',
        'books-novels',
        1
    ),
    (
        'IT & Computers',
        '情報・通信・コンピュータ',
        'books-it-computers',
        1
    ),
    (
        'Magazines',
        '雑誌',
        'books-magazines',
        1
    );

-- 3.2 Subcategories thuộc Manga (parent_id = 2)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Shonen Manga',
        '少年コミック',
        'manga-shonen',
        2
    ),
    (
        'Seinen Manga',
        '青年コミック',
        'manga-seinen',
        2
    );

-- 3.3 Subcategories thuộc DVD / Blu-ray (parent_id = 3)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Anime',
        'アニメ',
        'video-anime',
        3
    ),
    (
        'Domestic Drama',
        '国内ドラマ',
        'video-domestic-drama',
        3
    ),
    (
        'Overseas Drama',
        '海外ドラマ',
        'video-overseas-drama',
        3
    );

-- 3.4 Subcategories thuộc Games (parent_id = 4)
-- LƯU Ý: Tạo các nhóm trung gian (Cấp 2) trước để làm cha cho các hệ máy (Cấp 3)
-- ID 14: Game Software (ゲームソフト)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Game Software',
        'ゲームソフト',
        'games-software',
        4
    );

-- ID 15: Retro Games (レトロゲーム)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Retro Games',
        'レトロゲーム',
        'games-retro',
        4
    );

-- ID 16: Consoles & Accessories (本体・周辺機器)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Consoles & Accessories',
        '本体・周辺機器',
        'games-consoles-accessories',
        4
    );

-- ==========================================
-- 4. INSERT DANH MỤC CẤP 3 (HỆ MÁY CHI TIẾT)
-- ==========================================

-- 4.1 Các hệ máy thuộc Game Software (parent_id = 14)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Nintendo Switch',
        'ニンテンドースイッチ',
        'games-switch',
        14
    ),
    (
        'PlayStation 5',
        'プレイステーション5',
        'games-ps5',
        14
    ),
    (
        'PlayStation 4',
        'プレイステーション4',
        'games-ps4',
        14
    ),
    (
        'PlayStation 3',
        'プレイステーション3',
        'games-ps3',
        14
    ),
    (
        'Xbox Series',
        'Xbox Series',
        'games-xbox-series',
        14
    ),
    (
        'Xbox One',
        'Xbox One',
        'games-xbox-one',
        14
    ),
    (
        'Xbox 360',
        'Xbox 360',
        'games-xbox-360',
        14
    );

-- 4.2 Các hệ máy thuộc Retro Games (parent_id = 15)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Famicom (NES)',
        'ファミコン',
        'games-famicom',
        15
    ),
    (
        'Super Famicom (SNES)',
        'スーパーファミコン',
        'games-super-famicom',
        15
    ),
    (
        'Nintendo 64',
        'ニンテンドー64',
        'games-nintendo-64',
        15
    );

-- 4.3 Các dòng máy/phụ kiện thuộc Consoles & Accessories (parent_id = 16)
INSERT INTO
    categories (
        name_en,
        name_ja,
        slug,
        parent_id
    )
VALUES (
        'Handheld Consoles',
        '本体(携帯ゲーム機)',
        'games-handheld-consoles',
        16
    ),
    (
        'Accessories',
        '周辺機器',
        'games-accessories',
        16
    );

