-- Maven toys sales data prep
-- In this query Mave toys sales data will be prepared and modelled for data visualization
-- 1. DATA MUST BE IMPORTED FROM CSV FILE AND THE SCHEMA MUST BE CONNECTED
-- Need to change data types of cols: Product_Cost, Product_Price - they must be DataType Double.
-- We will need to connect the price and cost to already sales that happened to understand how much revenue we made

-- IMPORTING SALES TABLE TO DB: 1. created manually, 2. Data imported from csv file (hard part)
CREATE TABLE sales (
Sale_ID INT,
`date` VARCHAR(255),
Store_ID INT,
Product_ID INT,
Units INT
);
-- IMPORTED VIA MYSQL CLIENT CMD
-- DATA IMPORT CHECK
SELECT * FROM sales;

-- IMPORTING CALENDAR TABLE TO DB: 1. created manually, 2. Data imported from csv file (hard part)
CREATE TABLE calendar(
`date` VARCHAR(255)
);
-- IMPORTED VIA MYSQL CLIENT CMD
-- DATA IMPORT CHECK
SELECT * FROM calendar;

-- IMPORTING PRODUCTS TABLE TO DB: 1. created manually, 2. Data imported from csv file (hard part)
CREATE TABLE products (
Product_ID INT,
Product_Name VARCHAR(255),	
Product_Category VARCHAR(255),	
Product_Cost VARCHAR(255),	
Product_Price VARCHAR(255)
);
-- IMPORTED VIA MYSQL CLIENT CMD
-- DATA IMPORT CHECK
SELECT * FROM products;

-- IMPORTING INVENTORY TABLE TO DB: 1. created manually, 2. Data imported from csv file (hard part)
CREATE TABLE inventory (
Store_ID INT,
Product_ID INT,
Stock_On_Hand INT
);
-- IMPORTED VIA MYSQL CLIENT CMD
-- DATA IMPORT CHECK
SELECT * FROM inventory;
-- IMPORTING STORES TABLE TO DB: 1. created manually, 2. Data imported from csv file (hard part)
CREATE TABLE stores (
Store_ID INT,
Store_Name VARCHAR(255),
Store_City VARCHAR(255),
Store_Location VARCHAR(255),
Store_Open_Date VARCHAR(255)
);
-- IMPORTED VIA MYSQL CLIENT CMD
-- DATA IMPORT CHECK
SELECT * FROM stores;
