# 1. Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM retail_sales;

# 2. Total Sales
SELECT ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales;

# 3. Total Profit
SELECT ROUND(SUM(profit),2) AS Total_Profit
FROM retail_sales;

# 4. Average Sales
SELECT ROUND(AVG(sales),2) AS Average_Sales
FROM retail_sales;

# 5. Average Profit
SELECT ROUND(AVG(profit),2) AS Average_Profit
FROM retail_sales;

# 6. Minimum and Maximum Sales
SELECT
MIN(sales) AS Minimum_Sales,
MAX(sales) AS Maximum_Sales
FROM retail_sales;

# 7. Total Quantity Sold
SELECT SUM(quantity) AS Total_Quantity
FROM retail_sales;

# 8. Number of Customers
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM retail_sales;


# 9. Number of Products
SELECT COUNT(DISTINCT product_id) AS Total_Products
FROM retail_sales;

#10. Number of Categories
SELECT COUNT(DISTINCT category) AS Categories
FROM retail_sales;


# 11. Number of Sub-Categories
SELECT COUNT(DISTINCT sub_category) AS Sub_Categories
FROM retail_sales;

# 12. Sales by Category
SELECT
category,
ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales
GROUP BY category
ORDER BY Total_Sales DESC;

# 13. Profit by Category

SELECT
category,
ROUND(SUM(profit),2) AS Total_Profit
FROM retail_sales
GROUP BY category
ORDER BY Total_Profit DESC;

# 14. Sales by Region
SELECT
region,
ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales
GROUP BY region
ORDER BY Total_Sales DESC;

# 15. Profit by Region
SELECT
region,
ROUND(SUM(profit),2) AS Total_Profit
FROM retail_sales
GROUP BY region
ORDER BY Total_Profit DESC;

# 16. Sales by Segment
SELECT
segment,
ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales
GROUP BY segment
ORDER BY Total_Sales DESC;

# 17. Top 10 States by Sales

SELECT
state,
ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;

# 18. Top 10 Cities by Sales
SELECT
city,
ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;

# 19. Most Sold Categories
SELECT
category,
SUM(quantity) AS Quantity_Sold
FROM retail_sales
GROUP BY category
ORDER BY Quantity_Sold DESC;

# 20. Average Discount
SELECT ROUND(AVG(discount),2) AS Average_Discount
FROM retail_sales;