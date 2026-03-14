-- ==============================================================================
-- BUSINESS QUESTION 3: Analisis RFM (Recency, Frequency, Monetary)
-- Tujuan: Menghitung metrik dasar RFM untuk setiap pelanggan unik.
-- ==============================================================================

WITH ReferenceDate AS(
-- Tahap 1: Mencari tanggal transaksi paling terakhir di database sebagai titik acuan 'hari ini'
SELECT MAX(order_purchase_timestamp) AS ref_date
FROM olist_orders_dataset
WHERE order_status = 'delivered'
),
RFM_Base AS (
-- Tahap 2: Menghitung metrik dasar per pelanggan unik
SELECT
c.customer_unique_id,
MAX(o.order_purchase_timestamp) AS last_purchase_date,
COUNT(DISTINCT o.order_id) AS frequency,
SUM(oi.price) AS monetary
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
)
-- Tahap 3: Menghitung selisih hari untuk Recency dan menampilkan hasil akhir
SELECT
r.customer_unique_id,
-- Menghitung selisih hari antara titik acuan dengan tanggal belanja terakhir pelanggan
EXTRACT(DAY FROM(d.ref_date - r.last_purchase_date)) AS recency_days,
r.frequency,
r.monetary
FROM RFM_Base r
CROSS JOIN ReferenceDate d
ORDER BY r.monetary DESC, r.frequency DESC







