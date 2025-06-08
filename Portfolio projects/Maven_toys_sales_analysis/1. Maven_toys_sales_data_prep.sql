-- Maven toys sales data prep
-- In this query Mave toys sales data will be prepared and modelled for data visualization
-- 1. DATA MUST BE IMPORTED FROM CSV FILE AND THE SCHEMA MUST BE CONNECTED
-- products table imported
SELECT * FROM products;
-- Need to change data types of cols: Product_Cost, Product_Price - they must be DataType Double.
-- We will need to connect the price and cost to already sales that happened to understand how much revenue we made


-- sales table imported
SELECT * FROM sales;
LOAD DATA LOCAL INFILE '"C:\Users\ThinkPad\OneDrive\Desktop\SQL_upskill_rep\SQL_upskill\Portfolio projects\Maven_toys_sales_analysis\Maven_Toys_sales_data\Maven Toys Data\sales.csv"'
INTO TABLE sales
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


