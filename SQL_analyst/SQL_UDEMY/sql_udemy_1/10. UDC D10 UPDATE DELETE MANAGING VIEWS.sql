/*
UDC D-10 ADVANCED - VIEWS AND DATA MANIPULATION
-- SQL COMMANDS: UPDATE, 
DELETE, CREATE TABLE AS, CREATE VIEW, 
CREATE MATERIALIZED VIEW, MANAGING VIEWS, IMPORT/EXPORT
*/

-- UPDATE CHALLENGE
-- 1. UPDATE ALL RENTAL PRICES THAT ARE 0.99 TO 1.99
select * from film
WHERE rental_rate = 0.99;

UPDATE film
SET rental_rate = 1.99
WHERE rental_rate = 0.99;

-- 2. THE CUSTOMER TABLE NEEDS TO BE ALTERED AS WELL:
-- 1 ADD THE COLUMN INITIALS(DATA TYPE VARCHAR (10))
-- 2 UPDATE THE VALUES TO THE ACTUAL INITIALS (F.S)
ALTER TABLE customer
ADD COLUMN initials VARCHAR(10);

UPDATE customer
SET initials = SUBSTRING(first_name from 1 for 1)||'.' || SUBSTRING(last_name from 1 for 1)||'.';
SELECT * FROM customer;

-- DELETION FROM TABLE CHALLENGE
-- DELETE ROWS WITH THE PAYMENT_ID 17064, 17067.
SELECT * FROM payment
WHERE payment_id IN(17064, 17067);

DELETE FROM payment
WHERE payment_id IN(17064, 17067)
RETURNING *;
-- CREATE TABLE AS (QUERY) CHALLENGE
-- CREATE A TABLE WITH FIRST NAME AND LAST NAME OF THE CUSTOMER AND THE TOTAL (SPENT) AMOUNT

CREATE TABLE customer_spendings
AS SELECT 
(c.first_name || ' ' || c.last_name) as name,
SUM(amount) as total_spent
FROM 
customer c
LEFT JOIN
payment p
ON
c.customer_id = p.customer_id
GROUP BY name;

SELECT * FROM customer_spendings;

/*  create table as vs. views: It is better to use views than create table as, 
because create table as stores data and makes a snapshot of it, so you need storage and data does not change
if there are changes in other tables. With views the data is not stored and data does change 
in relativity of the tables used for that view.
The view stores the statement. Views are used for reference, for non complex queries.
*/
-- CREATE VIEW CHALLENGE
/*
Create a view called films_category that shows a list of the film titles including their title,
length and category name ordered descendingly by the length.
Filter the results to only the movies in the category 'Action' and 'Comedy'. */

CREATE VIEW films_category
AS
SELECT 
f.title, f.length, c.name
FROM 
film f
JOIN
film_category fc
ON 
f.film_id = fc.film_id
JOIN
category c
ON
c.category_id = fc.category_id
WHERE c.name IN('Action', 'Comedy')
ORDER BY f.length DESC;


SELECT * FROM films_category;

-- managing viws challenge 
-- You can CREATE MATERIALIZED VIEW AND ALTER VIEW.
CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id;
/* 
You need to perform the following tasks:

1) Rename the view to v_customer_information.

2) Rename the customer_id column to c_id.

3) Add also the initial column as the last column to the view by replacing the view.
*/

ALTER VIEW v_customer_info
RENAME TO v_customer_information;
SELECT * FROM v_customer_information;
ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id;

CREATE OR REPLACE VIEW v_customer_information
AS
SELECT cu.customer_id as c_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country,
	SUBSTRING(first_name from 1 for 1)||'.' || SUBSTRING(last_name from 1 for 1)||'.' as initials
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id;

