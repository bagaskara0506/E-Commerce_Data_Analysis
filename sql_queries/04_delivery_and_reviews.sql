WITH DeliveryData AS (
SELECT
o.order_id,
EXTRACT(DAY FROM(o.order_delivered_customer_date - o.order_purchase_timestamp)) AS delivery_days,
r.review_score
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
AND r.review_score IS NOT NULL
)

SELECT
CASE
WHEN delivery_days <= 5 THEN '1. Sangat Cepat (0-5 Hari)'
WHEN delivery_days <= 10 THEN '2. Cepat (6-10 Hari)'
WHEN delivery_days <= 15 THEN '3. Normal (11-15 Hari)'
ELSE '4. Lambat (> 15 Hari)'
END AS delivery_speed_category,
COUNT(order_id) AS total_order,
ROUND(AVG(review_score),2) AS avg_review_score
FROM DeliveryData
GROUP BY delivery_speed_category
ORDER BY delivery_speed_category ;