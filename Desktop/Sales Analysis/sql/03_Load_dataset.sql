LOAD DATA INFILE 'C:/Users/Admin/Desktop/Sales Analysis/Dataset/superstore_sales.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;