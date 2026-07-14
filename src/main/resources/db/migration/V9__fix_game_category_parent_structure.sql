-- ==========================================
-- V9: Fix off-by-one parent_id bug in game subcategories
-- ==========================================

-- Move modern platforms (Switch, PS5, PS4, PS3, Xbox*) from Retro Games → Game Software
UPDATE categories
SET parent_id = (SELECT id FROM categories WHERE slug = 'games-software')
WHERE slug IN (
    'games-switch',
    'games-ps5',
    'games-ps4',
    'games-ps3',
    'games-xbox-series',
    'games-xbox-one',
    'games-xbox-360'
);

-- Move retro platforms (Famicom, SNES, N64) from Consoles → Retro Games
UPDATE categories
SET parent_id = (SELECT id FROM categories WHERE slug = 'games-retro')
WHERE slug IN (
    'games-famicom',
    'games-super-famicom',
    'games-nintendo-64'
);

-- Move Handheld Consoles and Accessories → Consoles & Accessories
UPDATE categories
SET parent_id = (SELECT id FROM categories WHERE slug = 'games-consoles-accessories')
WHERE slug IN (
    'games-handheld-consoles',
    'games-accessories'
);
