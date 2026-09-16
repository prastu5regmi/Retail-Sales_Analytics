-- ------------------------------------------------------------
-- Quick sanity-check queries 
-- ------------------------------------------------------------
 SELECT COUNT(*) FROM dim_date;
 SELECT COUNT(*) FROM dim_customer;
 SELECT COUNT(*) FROM dim_product;
 SELECT COUNT(*) FROM fact_sales;

 SELECT d.year, d.month_name, SUM(f.line_total) AS monthly_revenue
 FROM fact_sales f
 JOIN dim_date d ON f.date_key = d.date_key
 GROUP BY d.year, d.month, d.month_name
 ORDER BY d.year, d.month;
 
 SELECT SUM(line_total) AS total_revenue FROM fact_sales;
 
 SELECT f.invoice, d.full_date, c.country, p.description, f.quantity, f.price, f.line_total
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_customer c ON f.customer_key = c.customer_key
JOIN dim_product p ON f.product_key = p.product_key
LIMIT 20;
