#1. Check total number of records
SELECT COUNT(*) AS total_records
FROM retail_sales;

#2. Check table structure
DESCRIBE retail_sales;

#3. Check for NULL values in each important column
SELECT
    SUM(order_id IS NULL) AS order_id_nulls,
    SUM(order_date IS NULL) AS order_date_nulls,
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(customer_name IS NULL) AS customer_name_nulls,
    SUM(city IS NULL) AS city_nulls,
    SUM(state IS NULL) AS state_nulls,
    SUM(category IS NULL) AS category_nulls,
    SUM(sub_category IS NULL) AS sub_category_nulls,
    SUM(product_name IS NULL) AS product_name_nulls,
    SUM(sales IS NULL) AS sales_nulls,
    SUM(quantity IS NULL) AS quantity_nulls,
    SUM(discount IS NULL) AS discount_nulls,
    SUM(profit IS NULL) AS profit_nulls
FROM retail_sales;

#4. Check for duplicate rows
SELECT *,
       COUNT(*) AS duplicate_count
FROM retail_sales
GROUP BY
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
HAVING COUNT(*) > 1;

#5. Find blank values
SELECT *
FROM retail_sales
WHERE customer_name = ''
   OR city = ''
   OR state = ''
   OR category = ''
   OR sub_category = '';
   
#6. Check for negative sales
SELECT *
FROM retail_sales
WHERE sales < 0;
