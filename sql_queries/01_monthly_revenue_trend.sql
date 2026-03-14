-- ==============================================================================
-- BUSINESS QUESTION 1: Tren Volume Pesanan & Pendapatan Bulanan
-- Tujuan: Melihat pergerakan total pendapatan dan jumlah pesanan dari bulan ke bulan.
-- ==============================================================================

SELECT 
TO_CHAR(o.order_purchase_timestamp,'YYYY-MM') AS order_month,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(oi.price) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_orders_dataset o
ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY TO_CHAR(o.order_purchase_timestamp,'YYYY-MM')
ORDER BY order_month ASC;