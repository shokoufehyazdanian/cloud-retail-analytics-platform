-- Athena queries on retail data stored in Amazon S3
-- Tables are created through AWS Glue Data Catalog


-- 1. Check raw sales data

SELECT *
FROM retail_raw.sales_raw
LIMIT 10;


-- 2. Calculate total sales by store

SELECT
    store_id,
    SUM(sales) AS total_sales
FROM retail_raw.sales_raw
GROUP BY store_id
ORDER BY total_sales DESC;


-- 3. Daily sales aggregation

SELECT
    d,
    SUM(sales) AS daily_sales
FROM retail_raw.sales_raw
GROUP BY d
ORDER BY d;


-- 4. Price analysis

SELECT
    item_id,
    AVG(sell_price) AS average_price
FROM retail_raw.prices_raw
GROUP BY item_id
ORDER BY average_price DESC;