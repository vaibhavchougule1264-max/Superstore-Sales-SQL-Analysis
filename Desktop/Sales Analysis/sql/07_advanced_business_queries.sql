# 1. Rank customers based on total sales
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM retail_sales
GROUP BY customer_name;

# 2. Dense Rank customers based on profit
SELECT
    customer_name,
    ROUND(SUM(profit),2) AS total_profit,
    DENSE_RANK() OVER(ORDER BY SUM(profit) DESC) AS profit_rank
FROM retail_sales
GROUP BY customer_name;

# 3. Top 5 customers by sales
WITH customer_sales AS
(
    SELECT
        customer_name,
        ROUND(SUM(sales),2) AS total_sales,
        ROW_NUMBER() OVER(ORDER BY SUM(sales) DESC) AS rn
    FROM retail_sales
    GROUP BY customer_name
)
SELECT *
FROM customer_sales
WHERE rn <= 5;

# 4. Running Total of Sales
SELECT
    order_date,
    sales,
    SUM(sales) OVER(ORDER BY order_date) AS running_sales
FROM retail_sales;

# 5. Running Profit
SELECT
    order_date,
    profit,
    SUM(profit) OVER(ORDER BY order_date) AS running_profit
FROM retail_sales;

# 6. Average Sales by Category using Window Function
SELECT
    category,
    product_name,
    sales,
    ROUND(AVG(sales) OVER(PARTITION BY category),2) AS avg_category_sales
FROM retail_sales;

# 7. Highest Selling Product in each Category
WITH product_sales AS
(
SELECT
    category,
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rn
FROM retail_sales
GROUP BY category, product_name
)

SELECT *
FROM product_sales
WHERE rn = 1;

# 8. Highest Profit Product in each Category
WITH product_profit AS
(
SELECT
    category,
    product_name,
    ROUND(SUM(profit),2) AS total_profit,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(profit) DESC) AS rn
FROM retail_sales
GROUP BY category, product_name
)

SELECT *
FROM product_profit
WHERE rn = 1;

# 9. Sales greater than average sales
SELECT *
FROM retail_sales
WHERE sales >
(
SELECT AVG(sales)
FROM retail_sales
);

# 10. Profit greater than average profit
SELECT *
FROM retail_sales
WHERE profit >
(
SELECT AVG(profit)
FROM retail_sales
);

# 11. Customers whose sales are above average customer sales
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY customer_name
HAVING SUM(sales) >
(
SELECT AVG(total_sales)
FROM
(
SELECT SUM(sales) AS total_sales
FROM retail_sales
GROUP BY customer_name
) t
);

# 12. Category-wise contribution to total sales
SELECT
    category,
    ROUND(SUM(sales),2) AS category_sales,
    ROUND(
        SUM(sales) * 100 /
        (SELECT SUM(sales) FROM retail_sales),
        2
    ) AS sales_percentage
FROM retail_sales
GROUP BY category;

# 13. Product with Maximum Profit
SELECT *
FROM retail_sales
WHERE profit =
(
SELECT MAX(profit)
FROM retail_sales
);

# 14. Product with Minimum Profit
SELECT *
FROM retail_sales
WHERE profit =
(
SELECT MIN(profit)
FROM retail_sales
);

# 15. Create a View for Top Customers
CREATE VIEW top_customers AS
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY customer_name;

# View the View
SELECT *
FROM top_customers;

# 16. Create a View for Regional Sales
CREATE VIEW regional_sales AS
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region;

SELECT *
FROM regional_sales;

# 17. Percentage of Sales by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(
        SUM(sales)*100/
        (SELECT SUM(sales) FROM retail_sales),
        2
    ) AS sales_percentage
FROM retail_sales
GROUP BY region;

# 18. Find Duplicate Order IDs
SELECT
    order_id,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY order_id
HAVING COUNT(*) > 1;

# 19. Customer Lifetime Sales
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS lifetime_sales
FROM retail_sales
GROUP BY customer_name
ORDER BY lifetime_sales DESC;

# 20. Top 3 Products in each Category
WITH ranked_products AS
(
SELECT
    category,
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    DENSE_RANK() OVER
    (
        PARTITION BY category
        ORDER BY SUM(sales) DESC
    ) AS product_rank
FROM retail_sales
GROUP BY category, product_name
)

SELECT *
FROM ranked_products
WHERE product_rank <= 3;