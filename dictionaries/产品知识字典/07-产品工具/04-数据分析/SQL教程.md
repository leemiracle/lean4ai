# SQL教程

## 概述
SQL(Structured Query Language)是用于管理关系型数据库的标准语言,产品经理掌握SQL可以独立进行数据查询和分析,提高数据驱动决策能力。

## 核心语法

### 数据查询(SELECT)
```sql
-- 基础查询
SELECT column1, column2
FROM table_name;

-- 条件查询
SELECT *
FROM table_name
WHERE condition;

-- 排序
SELECT *
FROM table_name
ORDER BY column DESC;

-- 限制结果数量
SELECT *
FROM table_name
LIMIT 10;
```

### 聚合函数
```sql
-- 计数
SELECT COUNT(*) FROM table_name;

-- 求和
SELECT SUM(column) FROM table_name;

-- 平均值
SELECT AVG(column) FROM table_name;

-- 最大值
SELECT MAX(column) FROM table_name;

-- 最小值
SELECT MIN(column) FROM table_name;
```

### 分组统计(GROUP BY)
```sql
-- 分组统计
SELECT category, COUNT(*) as count
FROM table_name
GROUP BY category;

-- 分组筛选
SELECT category, COUNT(*) as count
FROM table_name
GROUP BY category
HAVING count > 10;
```

### 多表关联(JOIN)
```sql
-- 内连接
SELECT a.*, b.name
FROM table_a a
INNER JOIN table_b b ON a.id = b.a_id;

-- 左连接
SELECT a.*, b.name
FROM table_a a
LEFT JOIN table_b b ON a.id = b.a_id;

-- 右连接
SELECT a.*, b.name
FROM table_a a
RIGHT JOIN table_b b ON a.id = b.a_id;
```

## 快捷键

| 快捷键 | 功能 |
|--------|------|
| Ctrl+Enter | 执行SQL |
| Ctrl+Shift+Enter | 执行选中部分 |
| Ctrl+S | 保存查询 |
| Ctrl+C | 复制 |
| Ctrl+V | 粘贴 |
| Ctrl+/ | 注释/取消注释 |
| Ctrl+Shift+F | 格式化SQL |
| Ctrl+Space | 自动补全 |
| F5 | 刷新结果 |
| Ctrl+D | 复制当前行 |

## 使用指南

### 基础查询
```sql
-- 查询所有用户
SELECT * FROM users;

-- 查询指定字段
SELECT user_id, username, email
FROM users;

-- 添加条件
SELECT * FROM users
WHERE status = 'active'
AND created_at > '2024-01-01';

-- 模糊查询
SELECT * FROM users
WHERE username LIKE '%张%';

-- 多值匹配
SELECT * FROM users
WHERE city IN ('北京', '上海', '广州');
```

### 排序与分页
```sql
-- 排序
SELECT * FROM orders
ORDER BY created_at DESC;

-- 多字段排序
SELECT * FROM orders
ORDER BY status ASC, created_at DESC;

-- 分页查询
SELECT * FROM orders
ORDER BY created_at DESC
LIMIT 10 OFFSET 0;
```

### 聚合统计
```sql
-- 统计用户数
SELECT COUNT(*) as total_users
FROM users;

-- 按日期统计订单
SELECT DATE(created_at) as date,
       COUNT(*) as order_count,
       SUM(amount) as total_amount
FROM orders
GROUP BY DATE(created_at)
ORDER BY date DESC;

-- 分组统计
SELECT city,
       COUNT(*) as user_count,
       AVG(age) as avg_age
FROM users
GROUP BY city
HAVING user_count > 100;
```

### 表关联
```sql
-- 查询用户订单
SELECT u.username,
       o.order_id,
       o.amount,
       o.created_at
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE u.status = 'active';

-- 多表关联
SELECT u.username,
       o.order_id,
       p.product_name,
       oi.quantity
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
```

## 实战案例

### 案例1:日活用户统计
```sql
-- 每日活跃用户数
SELECT DATE(login_time) as date,
       COUNT(DISTINCT user_id) as dau
FROM user_login_log
WHERE login_time >= '2024-01-01'
GROUP BY DATE(login_time)
ORDER BY date DESC;

-- 周活跃用户
SELECT DATE_FORMAT(login_time, '%Y-%u') as week,
       COUNT(DISTINCT user_id) as wau
FROM user_login_log
GROUP BY DATE_FORMAT(login_time, '%Y-%u')
ORDER BY week DESC;

-- 月活跃用户
SELECT DATE_FORMAT(login_time, '%Y-%m') as month,
       COUNT(DISTINCT user_id) as mau
FROM user_login_log
GROUP BY DATE_FORMAT(login_time, '%Y-%m')
ORDER BY month DESC;
```

### 案例2:用户留存分析
```sql
-- 次日留存
SELECT a.register_date,
       COUNT(DISTINCT a.user_id) as new_users,
       COUNT(DISTINCT b.user_id) as retained_users,
       ROUND(COUNT(DISTINCT b.user_id) * 100.0 / COUNT(DISTINCT a.user_id), 2) as retention_rate
FROM (
    SELECT user_id, DATE(created_at) as register_date
    FROM users
    WHERE created_at >= '2024-01-01'
) a
LEFT JOIN (
    SELECT DISTINCT user_id, DATE(login_time) as login_date
    FROM user_login_log
) b ON a.user_id = b.user_id AND b.login_date = DATE_ADD(a.register_date, INTERVAL 1 DAY)
GROUP BY a.register_date
ORDER BY a.register_date;
```

### 案例3:销售数据分析
```sql
-- 商品销售排行
SELECT p.product_name,
       COUNT(DISTINCT o.order_id) as order_count,
       SUM(oi.quantity) as total_quantity,
       SUM(oi.quantity * oi.price) as total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
  AND o.created_at >= '2024-01-01'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 20;

-- 每日销售趋势
SELECT DATE(created_at) as date,
       COUNT(*) as order_count,
       SUM(amount) as revenue,
       AVG(amount) as avg_order_amount
FROM orders
WHERE status = 'completed'
  AND created_at >= '2024-01-01'
GROUP BY DATE(created_at)
ORDER BY date;
```

### 案例4:用户行为漏斗
```sql
-- 转化漏斗分析
SELECT
    '访问首页' as step,
    COUNT(DISTINCT user_id) as users
FROM page_views
WHERE page = 'home' AND date = '2024-01-01'

UNION ALL

SELECT
    '浏览商品' as step,
    COUNT(DISTINCT user_id) as users
FROM page_views
WHERE page = 'product' AND date = '2024-01-01'
AND user_id IN (
    SELECT DISTINCT user_id
    FROM page_views
    WHERE page = 'home' AND date = '2024-01-01'
)

UNION ALL

SELECT
    '加入购物车' as step,
    COUNT(DISTINCT user_id) as users
FROM cart_items
WHERE date = '2024-01-01'
AND user_id IN (
    SELECT DISTINCT user_id
    FROM page_views
    WHERE page = 'product' AND date = '2024-01-01'
);
```

## 最佳实践

### 1. 查询优化
- 使用索引字段过滤
- 避免SELECT *
- 合理使用LIMIT
- 减少子查询嵌套

### 2. 代码规范
```sql
-- 使用大写关键字
SELECT user_id, username
FROM users
WHERE status = 'active';

-- 合理缩进
SELECT
    user_id,
    username,
    email
FROM users
WHERE status = 'active'
ORDER BY created_at DESC;

-- 添加注释
-- 查询活跃用户
SELECT * FROM users WHERE status = 'active';
```

### 3. 性能考虑
- 大表先过滤再关联
- 使用EXPLAIN分析执行计划
- 避免在WHERE中使用函数
- 合理使用临时表

### 4. 安全注意
- 使用参数化查询
- 避免SQL注入
- 合理设置权限
- 敏感数据脱敏

## 进阶技巧

### 窗口函数
```sql
-- 排名
SELECT *,
       ROW_NUMBER() OVER (ORDER BY score DESC) as rank
FROM students;

-- 分组排名
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY class ORDER BY score DESC) as class_rank
FROM students;

-- 移动平均
SELECT date,
       revenue,
       AVG(revenue) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as ma7
FROM daily_revenue;
```

### CASE表达式
```sql
-- 条件分类
SELECT user_id,
       CASE
           WHEN total_amount >= 10000 THEN '高价值'
           WHEN total_amount >= 1000 THEN '中价值'
           ELSE '低价值'
       END as user_level
FROM users;
```

### 日期函数
```sql
-- 日期格式化
SELECT DATE_FORMAT(created_at, '%Y-%m-%d') as date;

-- 日期计算
SELECT DATE_ADD(created_at, INTERVAL 7 DAY) as expire_date;

-- 日期差
SELECT DATEDIFF(end_date, start_date) as days;
```

## 常见问题

### Q: 如何处理NULL值?
A: 使用IS NULL或IS NOT NULL判断,或使用COALESCE、IFNULL函数

### Q: 如何去重统计?
A: 使用DISTINCT关键字,如COUNT(DISTINCT user_id)

### Q: 如何优化慢查询?
A: 使用EXPLAIN分析,添加索引,减少扫描数据量

## 学习资源
- SQL教程网站
- 数据库官方文档
- 练习平台(LeetCode/HackerRank)
- 实战项目练习

## 应用场景
- 用户数据分析
- 业务指标统计
- 产品效果评估
- 运营数据监控
- 报表数据提取
