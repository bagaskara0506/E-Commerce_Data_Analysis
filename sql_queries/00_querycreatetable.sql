--1. Tabel Customers
CREATE TABLE olist_customers_dataset (
customer_id VARCHAR(255),
customer_unique_id VARCHAR(255),
customer_zip_code_prefix INT,
customer_city VARCHAR(255),
customer_state VARCHAR(5)
);

--2. Tabel Geolocation
CREATE TABLE olist_geolocation_dataset (
geolocation_zip_code_prefix INT,
geolocation_lat FLOAT,
geolocation_lng FLOAT,
geolocation_city VARCHAR(255),
geolocation_state VARCHAR(5)
);

--3. Tabel Order Items
CREATE TABLE olist_order_items_dataset (
order_id VARCHAR(255),
order_item_id INT,
product_id VARCHAR(255),
seller_id VARCHAR(255),
shipping_limit_date TIMESTAMP,
price NUMERIC,
freight_value NUMERIC
);

--4. Tabel Order Payments
CREATE TABLE olist_order_payments_dataset (
order_id VARCHAR(255),
payment_sequential INT,
payment_type VARCHAR(50),
payment_installments INT,
payment_value NUMERIC
);

--5. Tabel Order Reviews
CREATE TABLE olist_order_reviews_dataset (
review_id VARCHAR(255),
order_id VARCHAR(255),
review_score INT,
review_comment_title TEXT,
review_comment_message TEXT,
review_creation_date TIMESTAMP,
review_answer_timestam TIMESTAMP
);

--6. Tabel Orders
CREATE TABLE olist_orders_dataset (
order_id VARCHAR(255),
customer_id VARCHAR(255),
order_status VARCHAR(50),
order_purchase_timestamp  TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP
);

--7. Tabel Products
CREATE TABLE olist_products_dataset (
product_id VARCHAR(255),
product_category_name VARCHAR(255),
product_name_lenght INT,
product_description_lenght INT,
product_photos_qty INT,
product_weight_g INT,
product_lenght_cm INT,
product_height_cm INT,
product_width_cm INT
);

--8. Tabel Sellers
CREATE TABLE olist_sellers_dataset (
seller_id VARCHAR(255),
seller_zip_code_prefix VARCHAR(10),
seller_city VARCHAR(255),
seller_state VARCHAR(5)
);

--9. Tabel Category Translation
CREATE TABLE product_category_name_translation (
product_category_name VARCHAR(255),
product_category_name_english VARCHAR(255)
);