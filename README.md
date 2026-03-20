# Olist Store E-Commerce Business Performance & RFM Analysis

> Proyek ini bertujuan untuk menganalisa kumpulan Data Pesanan Olist Store yang berisi data informasi 100.000 pesanan dari tahun 2016 sampai 2018 yang di proses dari berbagai marketplace brasil. Proyek ini berfokus pada extraksi data menggunakan PostgreSQL, Lalu memproses Analisa dan visualisasi Business Performance & RFM Analysis dengan Python, Untuk visualisasi tambahan dashboard interactive menggunakan Looker Studio

> Dataset mentah : 
1. Kaggle - Brazilian E-Commerce Public Dataset by Olist
[Kagle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Business Problems Solved : 
1. **Monthly Revenue Trends :** Bagaimana tren volume Orders dan Revenue perusahaan dari bulan ke bulan ?
2. **Customer Retention (RFM) :** Bagaimana karakteristik pelanggan dan mengetahui kemampuan bisnis dalam mempertahankan pelanggan untuk membeli, meningkatkan intensitas kunjungan dan spending (*Recency, Frequency, Monetary*) ?
3. **Product Performance :** Kategori produk apa yang menyumbang pendapatan tertinggi  dan terendah ?
4. **Logistics & Satisfaction :** Korelasi antara lamanya waktu pengiriman dengan tingkat kepuasan pelanggan ?

## Tech Stack & Tools :
1. **Relational Database :** PostgreSQL (pgAdmin 4)
> Data Loading, Data Quality Check, JOINs, Multiple JOINs, CTEs, Aggregation.
2. **Programming Language :** Python 3
> Data Loading, Data manipulation, Data Analysis, Logic Mapping, persentil calculation (qcut), Visualisasi.
3. **Libraries :** Pandas, NumPy, Matplotlib, Seaborn.
4. **Business Intelligence :** Google Looker Studio.
5. **IDE :** Visual Studio Code (Extensions : Jupyter by Microsoft)

## Proses Data :
1. **Data Collection :**
> Proses mengumpulkan data didapat dari data public Kaggle 
> [Kaggle - Brazilian E-Commerce Public Dataset by Olist] 
Data berisi beberapa file mentah csv :
- olist_orders_dataset
- olist_products_dataset
- olist_sellers_dataset
- product_category_name_translation
- olist_customers_dataset
- olist_geolocation_dataset
- olist_order_items_dataset
- olist_order_payments_dataset
- olist_order_reviews_dataset

> Folder File : E-Commerce_Data_Analysis\data\raw

2. **Data Cleaning/Preprocessing :**
Memproses seluruh data collection untuk di cleaning dan disiapkan sebagai bahan analisa dengan PostgreSQL, Berikut hasil cleaning PostgreSQL terdiri dari file :
> - 00_querycreatetable
Membuat table sql sebagai wadah import file csv hasil collection.
> - 000_querycek_all_table 
Cek hasil & keberfungsian hasil membuat tabel dan import file csv collection.
> - 01_monthly_revenue_trend
Membuat query untuk melihat trend pendapatan bualanan dan total ordernya
`Tabel yang digunakan : olist_order_items_dataset & olist_orders_dataset`
> - 02_top_bottom_categories
Membuat query untuk melihat kategori produk dengan 5 pendapatan tertinggi dan terendah.
`Tabel yang digunakan : olist_orders_dataset, olist_order_items_dataset, olist_products_dataset, & product_category_name_translation.`
> - 03_rfm_customer_segmentation
Memuat query data kunjungan terakhir, jumlah kunjungan dan biaya belanja yang dikeluarkan konsumen
`Tabel yang digunakan : olist_orders_dataset, olist_customers_dataset, & olist_order_items_dataset`

> Folder File : E-Commerce_Data_Analysis\sql_queries

3. **Data Analysis**
Hasil pengolahan data cleaning sebelumnya menghasilkan 4 file csv analisis :
- monthly_revenue_trend (Tren pendapatan bulanan)
- top_bottom_categories (Kategori produk dengan pendapatan tertinggi dan terendah)
- rfm_base_data (Segmentasi Pelanggan)
- delivery_vs_reviews (Hubungan pengiriman dan review pelanggan)

> Folder File : E-Commerce_Data_Analysis\data\processed

4. **Visualisasi**
Proses visualisasi data dengan membuat RFM Customer Segmentasi & Business Performance EDA (Exploratory Data Analysis)

> Folder File : E-Commerce_Data_Analysis\notebooks

6. **Interpretasi Data**
Memberikan makna, tafsiran, dan menarik kesimpulan dari hasil analisis data 

> Folder Readme : E-Commerce_Data_Analysis\README.md

## Key Insights & Strategic Recommendations :
### 1. Customer Retention (RFM Analysis
![RFM Segmentation Chart](dashboards/rfm_segmentation_chart.png)

- **Krisis Retensi Pelanggan :**  Mayoritas pelanggan memiliki intensitas kunjungan hanya sekali dengan total presentasi `97%`.
- **Pelanggan Loyal Sangat Sedikit :** Hanya sekitar `3%` (2.801 orang) yang pernah melakukan pembelian kedua atau lebih.

- **Rekomendasi Tindakan (Actionable Insight)** :
Tim Marketing Olist Store direkomendasikan untuk tidak hanya berfokus pada akuisisi pelanggan baru, Tetapi memaksimalkan pelanggan yang sudah pernah berkunjung agar dapat berkunjung Kembali dengan meluncurkan kampanye Customer Retention. Seperti Program loyalitas poin, pemberian diskon pembelian kedua, media sosial bertarget

### 2. Revenue Trend & Seasonality
![Monthly Revenue Trend](dashboards/monthly_revenue_trend_chart.png)

- **Puncak Pendapatan (Peak Season) :** Pada periode November 2017 terjadi lonjakan pendapatan cukup signifikan. Hal ini bertepatan dengan momentum **Black Friday**, Yang merupakan **event diskon e-comerce besar - besaran** menjelang natal  terbesar

- **Rekomendasi Tindakan :**
Memaksimalkan sistem dan server aplikasi berjalan baik untuk menerima lonjakan traffic, Kesiapan ketersediaan produk, Memaksimalkan alokasi budget marketing untuk promosi pada minggu ke 4 di Q4 (November)

### 3. Product Performance (Top & Bottom Categories)
![Top and Bottom Categories](dashboards/top_bottom_categories.png)

- **Kategori Unggulan :** `Health Beauty`, `Watches Gifts`, dan `Bed Bath Table` adalah tiga pilar utama penyumbang pendapatan terbesar bagi Olist Store.
- **Kategori Kurang Peminat :** Produk seperti `Security and Services` dan `Fashion Childrens Clothes` 

- **Rekomendasi Tindakan : **
Fokuskan algoritma rekomendasi halaman depan aplikasi pada produk 3 produk unggulan. Untuk 5 produk terendah peminat perlu dilakukan evaluasi apakah perlu adanya penghapusan item atau pengurangan stok agar tidak memenuhi stok dan menambah daftar expire.

### 4. Delivery vs Customer Satisfaction
![Delivery vs Reviews](dashboards/delivery_vs_reviews.png)

- **Dampak Fatal Keterlambatan :** Terdapat korelasi negatif dari lamanya waktu pengiriman dengan hasil kepuasan pelanggan. Semakin lama pengiriman, Semakin rendah tingkat kepuasan pelanggan. Pengiriman yang memakan waktu pengiriman lebih dari 15 Hari membuat rata - rata **review score** menjadi anjlok drastis ke angka **3.57%**.

- **Rekomendasi Tindakan :** 
**Kepuasan pelanggan di bawah 4** akan mempengaruhi tingkat kepercayaan konsumen terhadap toko dan produk, Oleh karena itu tim logistik perlu melakukan **evaluasi terhadap mitra logistik** terkait penanganan keterlambatan, Misal memberikan penalti jika terjadi keterlambatan atau mencari mitra logistik baru yang dapat menjamin dan memenuhi **SLA** (Service Level Agreement) terkait waktu pengiriman

**Repository Structure :**
- **dashboards/:** Berisi gambar hasil visualisasi data dengan format **(PNG)** hasil EDA Python dan File laporan Visualisasi Data (PDF) dari **Looker Studio**.
- **data/processed/raw :** Berisi file CSV hasil unduh Dataset Mentah di Kaggle - Brazilian E-Commerce Public Dataset by Olist
> (Catatan: Data mentah tidak diunggah karena batasan ukuran file. Sebagai gantinya anda dapat mengunduh pada link data mentah di bagian atas)
- **data/processed/ :** Berisi file CSV Data Cleaning hasil ekstraksi SQL yang siap dianalisa.
- **sql_queries/ :** Kumpulan query untuk proses Analisa terkait Business Questions.
- **notebooks/ :** File Jupyter Notebook (.ipynb) yang berisi proses data EDA, yang berisi Segmentasi pelanggan, dan pengolahan data lainnya menggunakan python.


**[KLIK DI SINI UNTUK MELIHAT INTERACTIVE DASHBOARD LOOKER STUDIO]**
(https://lookerstudio.google.com/reporting/1a808948-4b81-45cb-a9c1-5cd7950ee41b)

**Tip:** Anda dapat menggunakan dashboard ini sebagai template untuk data Olist Anda sendiri. Buka tautan di atas, klik ikon tiga titik di pojok kanan atas, pilih Make a copy (Buat salinan), dan hubungkan dengan dataset CSV Anda!