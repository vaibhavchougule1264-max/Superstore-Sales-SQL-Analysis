# 1. Top 10 Customers by Sales
SELECT customer_name,
       ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

# 2. Top 10 Most Profitable Customers
SELECT customer_name,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

# 3. Top 10 Selling Products
SELECT product_name,
       ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

# 4. Top 10 Products by Quantity Sold
SELECT product_name,
       SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10;

# 5. Top 10 Loss Making Products

SELECT product_name,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY product_name
ORDER BY total_profit
LIMIT 10;

# 6. Category with Highest Sales
SELECT category,
		ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

# 7. Sub-Category with Highest Profit
SELECT sub_category,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY sub_category
ORDER BY total_profit DESC;

# 8. Region-wise Sales
SELECT region,
       ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;

# 9. Region-wise Profit
SELECT region,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region
ORDER BY total_profit DESC;

# 10. State with Highest Sales
SELECT state,
       ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

# 11. City with Highest Profit
SELECT city,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;

# 12. Average Discount by Category
SELECT category,
       ROUND(AVG(discount),2) AS avg_discount
FROM retail_sales
GROUP BY category;

# 13. Ship Mode Performance
SELECT ship_mode,
       ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

# 14. Customer Segment Performance
SELECT segment,
       ROUND(SUM(sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY segment
ORDER BY total_sales DESC;

# 15. Products with Negative Profit
SELECT product_name,
       sales,
       profit
FROM retail_sales
WHERE profit < 0
ORDER BY profit;

# 16. Orders with High Discount (>30%)
SELECT order_id,
       customer_name,
       product_name,
       discount,
       sales
FROM retail_sales
WHERE discount > 0.30
ORDER BY discount DESC;

# 17. Monthly Sales Trend
SELECT
MONTH(order_date) AS month_no,
MONTHNAME(order_date) AS month_name,
ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_no;

# 18. Yearly Sales Trend
SELECT
YEAR(order_date) AS year,
ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY YEAR(order_date)
ORDER BY year;

# 19. Highest Profit Order
SELECT *
FROM retail_sales
ORDER BY profit DESC
LIMIT 1;

# 20. Lowest Profit Order
SELECT *
FROM retail_sales
ORDER BY profit
LIMIT 1;