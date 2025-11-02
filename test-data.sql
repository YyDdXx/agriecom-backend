-- 农产品电商测试数据
-- 执行前请确保数据库已经运行了所有的 changelog 迁移

-- 首先创建测试用户（如果不存在）
INSERT INTO users (username, password, created_at, updated_at) 
VALUES ('test_merchant', '$2a$10$N.zmdr9k7uOCQb376NoUnuTSOTFLLHmOhVSWVxB9Kh/RYZvKNPUuy', NOW(), NOW())
ON CONFLICT (username) DO NOTHING;

-- 创建测试店铺（使用上面创建的用户ID）
INSERT INTO shops (name, description, logo_url, owner_id, status, created_at, updated_at)
SELECT '农优鲜生活馆', '专注于优质农产品，新鲜直达，品质保证', 'https://via.placeholder.com/200', u.id, 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.username = 'test_merchant'
ON CONFLICT DO NOTHING;

-- 插入商品数据（水果类）
-- 注意:使用子查询获取刚创建的shop_id
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('新疆阿克苏苹果', '脆甜多汁，富含维生素C，每个约250g', 12.80, 500, '新鲜水果', '新疆阿克苏', 1523),
('海南金煌芒果', '果肉金黄细腻，香甜可口，单果约500g', 18.90, 300, '新鲜水果', '海南三亚', 892),
('智利进口车厘子', 'JJJ级大果，果径28-30mm，500g装', 89.00, 150, '新鲜水果', '智利', 2341),
('泰国金枕榴莲', '肉厚核小，口感绵密，约2.5-3kg/个', 128.00, 80, '新鲜水果', '泰国', 567),
('陕西红心猕猴桃', '维C之王，酸甜适中，12个装约1kg', 35.80, 400, '新鲜水果', '陕西周至', 1205),
('云南石榴', '籽粒饱满晶莹剔透，单果约400g', 15.60, 320, '新鲜水果', '云南蒙自', 678),
('山东烟台大樱桃', '个大饱满，甜度高，500g精选装', 68.00, 200, '新鲜水果', '山东烟台', 945),
('广西沙糖桔', '皮薄多汁，无籽化渣，5斤装', 22.90, 600, '新鲜水果', '广西桂林', 2156)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 插入商品数据（蔬菜类）
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('有机西蓝花', '新鲜采摘，营养丰富，约500g', 9.80, 400, '新鲜蔬菜', '山东寿光', 834),
('紫甘蓝', '色泽鲜艳，口感清脆，约600g/个', 6.50, 350, '新鲜蔬菜', '云南', 521),
('有机生菜', '水培生菜，干净卫生，300g装', 8.90, 280, '新鲜蔬菜', '上海崇明', 1124),
('新鲜秋葵', '嫩荚翠绿，黏液丰富，250g装', 12.80, 200, '新鲜蔬菜', '海南', 456),
('彩椒组合', '红黄绿三色甜椒，3个装约600g', 14.50, 320, '新鲜蔬菜', '山东', 789),
('紫薯', '富含花青素，口感香甜，2.5kg装', 19.80, 450, '新鲜蔬菜', '福建', 1567),
('有机菠菜', '叶片肥厚，补铁佳品，500g装', 7.80, 380, '新鲜蔬菜', '北京', 923),
('荷兰土豆', '口感绵密，适合烹饪，2kg装', 11.90, 600, '新鲜蔬菜', '内蒙古', 2034)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 插入商品数据（肉禽蛋类）
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('散养土鸡蛋', '农家散养，蛋黄金黄，30枚装', 38.00, 500, '肉禽蛋品', '江苏', 1876),
('澳洲谷饲牛腱子', '优质牛肉，适合炖煮，500g', 58.00, 200, '肉禽蛋品', '澳大利亚', 654),
('黑猪五花肉', '肥瘦相间，肉质鲜嫩，500g', 45.80, 180, '肉禽蛋品', '浙江', 892),
('鲜嫩鸡胸肉', '低脂高蛋白，健身首选，1kg装', 28.90, 350, '肉禽蛋品', '山东', 1234),
('新鲜鸭蛋', '个大饱满，适合腌制，20枚装', 26.80, 280, '肉禽蛋品', '江苏高邮', 567),
('羊肉卷', '内蒙古羔羊肉，涮火锅专用，500g', 48.00, 220, '肉禽蛋品', '内蒙古', 1045),
('三黄鸡', '散养整鸡，约1.2kg/只', 42.00, 150, '肉禽蛋品', '广东', 723),
('鹌鹑蛋', '营养丰富，40枚盒装', 18.80, 400, '肉禽蛋品', '河北', 1456)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 插入商品数据（粮油调味类）
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('东北五常大米', '粒粒分明，口感香糯，5kg装', 65.00, 800, '粮油调味', '黑龙江五常', 3245),
('鲁花花生油', '压榨一级，清香不腻，5L装', 128.00, 350, '粮油调味', '山东', 2156),
('海天酱油', '特级生抽，鲜味十足，1.9L装', 23.80, 600, '粮油调味', '广东', 4567),
('李锦记蚝油', '提鲜增味，510g瓶装', 18.90, 550, '粮油调味', '香港', 3421),
('山西老陈醋', '酿造陈醋，酸香浓郁，500ml', 15.60, 420, '粮油调味', '山西', 1234),
('有机藜麦', '进口三色藜麦，500g装', 38.00, 200, '粮油调味', '秘鲁', 567),
('特级红小豆', '颗粒饱满，易煮烂，500g装', 12.80, 380, '粮油调味', '黑龙江', 890),
('优质面粉', '高筋面粉，适合做面包，2.5kg', 22.50, 500, '粮油调味', '河南', 1678)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 插入商品数据（乳品烘焙类）
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('伊利纯牛奶', '优质奶源，营养丰富，250ml*12盒', 48.00, 600, '乳品烘焙', '内蒙古', 4523),
('安慕希酸奶', '希腊风味，口感浓郁，205g*12杯', 68.00, 450, '乳品烘焙', '内蒙古', 3456),
('三元鲜牛乳', '巴氏杀菌，保留营养，950ml', 18.90, 300, '乳品烘焙', '北京', 2134),
('光明莫斯利安', '长寿村酸奶，200g*6杯', 35.80, 380, '乳品烘焙', '保加利亚菌种', 1876),
('蒙牛特仑苏', '有机纯牛奶，250ml*16盒', 88.00, 250, '乳品烘焙', '内蒙古', 2567),
('达能碧悠酸奶', '常温酸奶，135g*10杯', 42.00, 420, '乳品烘焙', '法国', 1234),
('手工全麦面包', '无糖无油，健康早餐，500g', 28.00, 180, '乳品烘焙', '本地烘焙', 567),
('进口黄油', '新西兰进口，烘焙专用，250g', 35.00, 200, '乳品烘焙', '新西兰', 892)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 插入商品数据（休闲零食类）
INSERT INTO products (name, description, price, stock, category, origin, sales, shop_id) 
SELECT v.*, s.id FROM (VALUES
('百草味坚果礼盒', '每日坚果，7种坚果组合，750g', 88.00, 400, '休闲零食', '浙江', 3456),
('三只松鼠碧根果', '香脆可口，手剥款，210g', 32.80, 500, '休闲零食', '美国', 2345),
('良品铺子猪肉脯', '肉质鲜嫩，甜辣口味，200g', 38.00, 350, '休闲零食', '湖北', 1876),
('来伊份蜜饯组合', '酸甜话梅芒果干等，500g装', 45.00, 280, '休闲零食', '上海', 1234),
('洽洽瓜子', '香瓜子，奶油味，500g', 18.80, 600, '休闲零食', '安徽', 4567),
('乐事薯片', '原味薯片，大桶装，104g*3桶', 35.90, 450, '休闲零食', '美国', 3245),
('奥利奥饼干', '夹心饼干，原味，388g', 22.80, 520, '休闲零食', '印尼', 2890),
('德芙巧克力', '丝滑牛奶巧克力，252g礼盒', 58.00, 300, '休闲零食', '中国', 2156)
) AS v(name, description, price, stock, category, origin, sales)
CROSS JOIN shops s WHERE s.name = '农优鲜生活馆';

-- 更新时间戳（可选，让数据看起来更真实）
UPDATE products SET created_at = NOW() - (RANDOM() * INTERVAL '30 days');
UPDATE products SET updated_at = created_at + (RANDOM() * INTERVAL '15 days');
UPDATE products SET published_at = created_at + (RANDOM() * INTERVAL '2 days');

-- 查看插入的数据
SELECT COUNT(*) as total_products FROM products;
SELECT category, COUNT(*) as count FROM products GROUP BY category ORDER BY count DESC;
