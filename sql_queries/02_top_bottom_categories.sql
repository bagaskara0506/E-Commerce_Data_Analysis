-- ==============================================================================
-- BUSINESS QUESTION 2: Top 5 & Bottom 5 Kategori Produk
-- Tujuan: Mengisolasi 5 kategori penyumbang revenue terbesar dan 5 terkecil secara spesifik.
-- ==============================================================================

WITH CategoryRevenue AS(
-- Tahap 1: Menghitung total revenue untuk semua kategori (disimpan di memori sementara)
SELECT
pct.product_category_name_english AS product_category,
COUNT(oi.order_id) AS total_items_sold,
SUM(oi.price) AS total_revenue
FROM olist_orders_dataset o 
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation pct
ON p.product_category_name = pct.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pct.product_category_name_english
)

-- Tahap 2: Mengambil 5 Tertinggi
(SELECT
'Top 5 Highest' AS performance_group,
product_category,
total_items_sold,
total_revenue
FROM CategoryRevenue
ORDER BY total_revenue DESC
LIMIT 5)

UNION ALL

-- Tahap 3: Mengambil 5 Terendah
SELECT
'Bottom 5 Lowest' AS performance_group,
product_category,
total_items_sold,
total_revenue
FROM(
SELECT
-- Ambil 5 revenue terkecil
product_category,
total_items_sold,
total_revenue
FROM CategoryRevenue
ORDER BY total_revenue ASC
LIMIT 5)t
-- diurutkan data revenue terkecil dari yang terbesar ke yang kecil
ORDER BY total_revenue DESC;