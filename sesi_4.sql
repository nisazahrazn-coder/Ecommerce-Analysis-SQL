-- Berapa jumlah order yang tercatat
SELECT COUNT(*) jumlah_order
FROM bigquery-public-data.thelook_ecommerce.orders;

-- Berapa jumlah item yang dibeli?
SELECT COUNT(*) jumlah_item
FROM bigquery-public-data.thelook_ecommerce.order_items;

-- Berapa jumlah order untuk masing-masing status?
SELECT status, COUNT(*) as jumlah_order
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY status;

-- Apa saja 10 produk terlaris berdasarkan jumlah order
SELECT product_id, COUNT(*) item_cnt
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY product_id
ORDER BY item_cnt DESC
LIMIT 10;

-- Berapa jumlah customer untuk masing-masing negara?
SELECT country, COUNT(*) jumlah_cust
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY country
ORDER BY jumlah_cust DESC
LIMIT 10;

-- Perbandingan performa masing2 status jumlah item, jumlah order, total sales, rata2 sale price
SELECT status, COUNT(*) jumlah_item, COUNT(DISTINCT order_id) jumlah_order, ROUND(SUM(sale_price), 2) total_sales, ROUND(AVG(sale_price), 2) avg_sale_price
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY 1
ORDER BY total_sales DESC

-- Berapa revenue yang dihasilkan
SELECT 
ROUND(SUM(sale_price) / 1000000, 2) total_revenue_in_million
FROM bigquery-public-data.thelook_ecommerce.order_items

-- Berapa total product dan rata-rata harga product per kategori
SELECT category, COUNT(*) total_item, AVG(retail_price) rata2_harga
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY category
ORDER BY rata2_harga DESC;

-- Berapa jumlah transaksi, jumlah sale price dan rata-rata nilai per transaksi(AOV) untuk masing-masing user ? TAmpilkan hanya 10 user dengan jumlah sale price tertinggi
SELECT user_id, COUNT(DISTINCT order_id) as jumlah_order, ROUND(SUM(sale_price),2) total_sale, ROUND(SUM(sale_price) / COUNT(DISTINCT order_id), 2) as AOV,
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY user_id
ORDER BY  total_sale DESC
LIMIT 10;

