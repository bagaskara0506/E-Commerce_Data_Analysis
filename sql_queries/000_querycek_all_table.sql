-- Cek Table olist_customers_dataset
-- SELECT * FROM olist_customers_dataset;
-- Hapus Semua Data di Table
-- TRUNCATE TABLE olist_customers_dataset;
-- Merubah tipe data kolom customer_zip_code_prefix dari Integer ke VARCHAR(10) agar tidak kehilangan leading zero atau angka 0 di depan
-- ALTER TABLE olist_customers_dataset
-- ALTER COLUMN customer_zip_code_prefix TYPE VARCHAR(10);


-- Cek Table olist_geolocation_dataset
-- SELECT * FROM olist_geolocation_dataset;
-- SELECT COUNT(*) FROM olist_geolocation_dataset;
-- WHERE geolocation_zip_code_prefix = '1034';
-- WHERE geolocation_lat = '-23.543343';
-- WHERE geolocation_lng = '-46.63929204800168';
-- Merubah tipe data kolom geolocation_zip_code_prefix dari Integer ke VARCHAR(10) agar tidak kehilangan leading zero atau angka 0 di depan
-- ALTER TABLE olist_geolocation_dataset
-- ALTER COLUMN geolocation_zip_code_prefix TYPE VARCHAR(10);
-- Hapus Semua Data di Table
-- TRUNCATE TABLE olist_geolocation_dataset;

-- Cek 2 Table Bersamaan : olist_customers_dataset & olist_geolocation_dataset
-- ==============================================================================
-- DATA QUALITY CHECK
-- Tujuan: Memastikan seluruh baris data CSV berhasil masuk ke database (tidak ada yang terpotong).
-- Penjelasan Query:
-- 1. COUNT(*) : Menghitung total keseluruhan baris pada tabel.
-- 2. Teks Statis ('Nama Tabel') : Membuat kolom label buatan agar hasil keluaran mudah diidentifikasi.
-- 3. UNION ALL : Menggabungkan hasil dari beberapa query SELECT menjadi satu tabel output secara vertikal (ke bawah).
-- ==============================================================================
-- SELECT 'Tabel Customers' AS nama_tabel, COUNT(*) AS jumlah_baris 
-- FROM olist_customers_dataset
-- UNION ALL
-- SELECT 'Tabel Geolocation' AS nama_tabel, COUNT(*) AS jumlah_baris 
-- FROM olist_geolocation_dataset;

-- Cek Table olist_order_items_dataset
-- SELECT * FROM olist_order_items_dataset
-- SELECT COUNT(*) FROM olist_order_items_dataset;
-- WHERE shipping_limit_date >= '2018-06-12' AND shipping_limit_date < '2018-06-13';
-- WHERE product_id = '4aa6014eceb682077f9dc4bffebc05b0';
-- WHERE order_id = 'fffbee3b5462987e66fb49b1c5411df2';

-- Cek Table olist_order_payments_dataset
-- SELECT * FROM olist_order_payments_dataset
-- SELECT COUNT(*) FROM olist_order_payments_dataset
-- WHERE order_id = '0406037ad97740d563a178ecc7a2075c';

-- Cek Table olist_order_reviews_dataset
-- SELECT * FROM olist_order_reviews_dataset
-- SELECT COUNT(*) FROM olist_order_reviews_dataset;
-- WHERE review_id = '4b49719c8a200003f700d3d986ea1a19';
-- WHERE order_id = '4d483bf690ca21bdc005df9b623673c7';
-- WHERE review_creation_date >= '2017-03-21' AND review_creation_date < '2017-03-22';
-- Cek apakah import rusak dengan Cek ada kolom yang NULL aneh atau tidak:
-- SELECT *
-- FROM olist_order_reviews_dataset
-- WHERE review_creation_date IS NULL;

-- Cek Table olist_orders_dataset
-- SELECT * FROM olist_orders_dataset
-- SELECT COUNT(*) FROM olist_orders_dataset
-- WHERE order_id = '880675dff2150932f1601e1c07eadeeb';
-- WHERE customer_id = '8e1ec396e317ff4c82a03ce16a0c3eb3';
-- WHERE order_status = 'canceled';
-- WHERE order_approved_at >= '2018-08-15' AND order_approved_at < '2018-08-16';

-- Cek Table olist_products_dataset
-- SELECT * FROM olist_products_dataset
-- SELECT COUNT(*) FROM olist_products_dataset
-- WHERE product_id = 'a0b7d5a992ccda646f2d34e418fff5a0';
-- WHERE product_category_name = 'esporte_lazer';
-- WHERE product_weight_g = '2200' AND product_id = '16280ca280a86fee2ba3c928ed04439f';

-- Cek Table olist_sellers_dataset 
-- SELECT * FROM olist_sellers_dataset
-- SELECT COUNT(*) FROM olist_sellers_dataset
-- WHERE seller_city = 'lages - sc';
-- WHERE seller_id = '411f3b52d857390502ee4e4d5ceabc2d';

-- Cek Table product_category_name_translation
-- SELECT * FROM product_category_name_translation
-- SELECT COUNT(*) FROM product_category_name_translation
-- WHERE product_category_name = 'casa_conforto_2';
-- WHERE product_category_name_english = 'signaling_and_security';


-- RELATIONSHIP SANITY CHECK (Uji Relasi)
-- Tujuan: Memastikan tabel pesanan (Orders) terhubung sempurna dengan detail harganya (Order Items)
-- SELECT 
--     o.order_id,
--     o.order_status,
--     o.customer_id,
--     oi.order_item_id,
--     oi.product_id,
--     oi.price,
-- 	oi.freight_value
-- FROM 
--     olist_orders_dataset o
-- JOIN 
--     olist_order_items_dataset oi 
--     ON o.order_id = oi.order_id;
