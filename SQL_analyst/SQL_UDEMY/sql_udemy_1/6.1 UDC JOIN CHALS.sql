-- UDC 6 joins
SELECT pa.*, first_name, last_name
FROM public.payment pa	
INNER JOIN customer cu
	ON pa.customer_id = cu.customer_id;

SELECT first_name, last_name, payment.* FROM payment
INNER JOIN staff
ON staff.staff_id = payment.staff_id
WHERE staff.staff_id = 2;

-- CHAL WIHT JOINS
-- THE COMPANY WANTS TO RUN A PHONE CALL CAMPAING ON ALL CUSTOMERS IN TEXAS(=district)
-- WHAT ARE THE CUSTOMERS(first_name, last_name, phone_number and teyr district) from texas?
-- Are there any old addresses that are not related to any customer?
SELECT first_name, last_name FROM customer;
SELECT * FROM address;
-- For texasians
SELECT c.first_name, c.last_name, a.phone, a.district
FROM customer c
INNER JOIN address a
	ON c.address_id = a.address_id
WHERE a.district = 'Texas';
-- for old addresses
SELECT c.first_name, c.last_name, a.phone, a.district
FROM customer c
RIGHT JOIN address a
	ON c.address_id = a.address_id
WHERE c.address_id IS NULL;

--JOINING MULTIPLE TABLES
-- CORPORATE WANTS TO CUSTOMIZE THEIR CAMPAIGNS TO CUSTOMERS DEPENDING ON THE COUNTRY THEY ARE FROM
-- WHICH CUSTOMERS ARE FROM bRAZIL?
-- WRITE A QUERY TO GET A FIRST_NAME, LAST_NAME, EMAIL, AND THE COUNTRY FROM ALL CUSTOMERS FROM bRAZIL
-- matching key look up
SELECT * FROM customer; -- customer id store id address id . RA cu
SELECT * FROM country; -- country_id there is no matching key of the tables RA co
SELECT * FROM city; -- city id and country id present. RA ct
SELECT * FROM address; -- address id city id. RA ad
-- CUSTOMER JOINS ADDRESS -> ADDRESS JOINS CITY -> CITY JOINS COUNTRY (THE SCALE)
-- THE MAIN QUERY
SELECT cu.first_name, cu.last_name, cu.email, co.country
FROM customer cu
INNER JOIN address ad
	ON cu.address_id = ad.address_id
INNER JOIN city ct
	ON ad.city_id = ct.city_id
INNER JOIN country co
	ON ct.country_id = co.country_id
WHERE co.country = 'Brazil';

-- ADDITIONAL CHALS
-- WHICH TITLE HAS GEORGE LINTON RENTED THE MOST OFTEN?
-- ASNWER SHOULD BE CADDYSHACK JEDI - 3 TIMES
SELECT * FROM customer -- HAS CUSTOMER ID, STORE ID, ADDRESS ID
WHERE first_name LIKE 'GEORGE' AND last_name LIKE'LINTON';


-- THE IDEA IS: CONNECT CUSTOMER VIA CUSTOMER ID TO RENTAL, THEN WITH INVENTORY ID CONNECT RENTAL WITH INVENTORY
-- THEN WITH FILM_ID CONNECT TO FILM RETRIEVE TITLE COLUMN.

SELECT cu.first_name, cu.last_name, fl.title, COUNT(*) AS times_rented FROM customer cu
JOIN rental re
	ON	 cu.customer_id = re.customer_id
JOIN inventory inv
	ON	re.inventory_id = inv.inventory_id
JOIN film fl
	ON inv.film_id = fl.film_id
WHERE first_name LIKE 'GEORGE' AND last_name LIKE'LINTON'
GROUP BY cu.first_name, cu.last_name, fl.title
ORDER BY COUNT(*) DESC
LIMIT 1;
-- I GET THE CORRECT ANSWER :)
