-- ADVANCED UDC D-7
-- UNIONS
SELECT first_name, 'actor' as origin
FROM actor
UNION 
SELECT first_name, 'customer' FROM customer
UNION
SELECT UPPER(first_name), 'staff' FROM staff
ORDER BY 2 DESC

-- SUBQUERY
SELECT 
*
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

SELECT * FROM payment
WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name = 'ADAM');

SELECT * FROM payment
WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name LIKE'A%');
-- chal -- SELECT ALL OF THE FILMS WHERE THE LENGTH IS LONGER THAN THE AVERAGE OF ALL FILMS
SELECT * FROM film
WHERE length > (SELECT AVG(length) FROM film);
--chal -- RETURN ALL THE FILMS THAT ARE AVAILABLE IN THE INVETORY IN STORE 2 MORE THAN 3 TIMES
-- jOINS FILM HAS FILM_ID -> INVENTORY FILM_ID (USE STORE ID IN THE WHERE CLAUSE)
SELECT * FROM film
WHERE film_id IN(SELECT film_id FROM inventory WHERE store_id = 2 GROUP BY film_id HAVING COUNT(*) > 3);

-- RETURN ALL CUSTOMERS FIRST NAMES AND LAST NAMES THAT HAVE MADE A PAYMENT ON '2020-01-25'
SELECT first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE payment_date BETWEEN '2020-01-25 00:00' AND '2020-01-26 00:00');

--RETURN ALL CUSTOMERS FIRS_NAMES AND EMAIL ADDEESSES THAT HAVE SPENT A MORE THAN 30$
SELECT first_name, email FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment GROUP BY customer_id HAVING SUM(amount)>30);

-- RETURN ALL THE CUSTOMERS FIRST AND LAST NAMES THAT ARE FROM CALIFORNIA (district from adress) AND HAVE SPENT MORE THAN 100 IN TOTAL
SELECT first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment GROUP BY customer_id HAVING SUM(amount)>100)
AND customer_id IN(SELECT customer_id FROM customer co JOIN address ad ON co.address_id = ad.address_id WHERE ad.district = 'California')

-- SUBQ INFROM
SELECT ROUND(AVG(total_amount), 2) as avg_lifetime_spent
FROM
(SELECT customer_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id) as subquery;


-- WHAT IS THE AVERAGE TOTAL AMOUNT SPENT PER DAY(AVERAGE DAILY REVENUE)?
-- 1644..
SELECT ROUND(AVG(total_amount), 2) as avg_total_daily_amnt FROM (
SELECT SUM(amount) AS total_amount, DATE(payment_date) FROM payment  GROUP BY DATE(payment_date)) as subq;

-- SUBQ IN SELECT
SELECT *, (SELECT ROUND(AVG(amount), 2) FROM payment) FROM payment;
-- !!! WE CANNOT USE MULTIPLE VALUES , WE CAN ONLY USE ONE ROW, LIMIT 1 CAN HELP)
-- SHOW ALL THE PAYMENTS TOGETHER WITH HOW MUCH THE PAYMENT AMOUNT IS BELOW THE MAX PAYMENT AMOUNT
SELECT *, ROUND((SELECT AVG(amount) FROM payment) - amount, 2) AS devation_from_avg FROM payment;
SELECT *, ROUND((SELECT MAX(amount) FROM payment) - amount, 2) AS difference_from_MAX FROM payment;
SELECT *, ROUND((SELECT MIN(amount) FROM payment) - amount, 2) AS difference_from_MIN FROM payment;
SELECT *, ROUND((SELECT COUNT(*) FROM payment) - amount, 2) AS difference_from_COUNT FROM payment;
SELECT *, ROUND((SELECT SUM(amount) FROM payment) - amount, 2) AS difference_from_COUNT FROM payment;

-- CORRELATED SUBQURYS !!!
-- SHOW ONLY THOSE PAYMENTS THAT HAVE THE HIGHEST AMOUNT PER CUSTOMER
SELECT * FROM payment p1
WHERE amount = (SELECT MAX(amount) FROM payment p2 WHERE p1.customer_id = p2.customer_id);

SELECT * FROM payment p1
WHERE amount = (SELECT AVG(amount) FROM payment p2 WHERE p1.customer_id = p2.customer_id);
-- SHOW ONLY THOSE MOVIE TITLES, THEIR ASSOCIATED FILM_ID AND REPLACEMENT_COST
-- WITH THE LOWEST REPLACEMENT_COSTS FOR EACH RATING CATEGORY ALSO SHOW RATING
SELECT film_id, title, replacement_cost, rating FROM film f1
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film f2 WHERE f1.rating = f2.rating);

-- SHOW ONLY THOSE MOVIE TITLES, THEIR ASSOCIATED FILM_ID 
-- AND THE LENGTH THAT HAVE THE HIGHEST LENGTH IN EACH RATING CATEGORY
-- ALSO SHOW THE RATING
SELECT film_id, title, rating, length FROM film f1
WHERE length = (SELECT MAX(length) FROM film f2 WHERE f1.rating = f2.rating);

-- CORRELATED SUBQ IN THE SELECT CLAUSE
SELECT *,
	(SELECT MAX(amount) 
	FROM payment p2
	WHERE p1.customer_id = p2.customer_id)
FROM payment p1;

-- SHOW ALL OF THE PAYMENTS PLUS THE TOTAL AMOUNT FOR EVERY CUSTOMER
-- AS WELL AS THE NUMBER OF PAYMENTS OF EACH CUTOMER.
SELECT *, 
	(SELECT SUM(amount) FROM payment p2
		WHERE p1.customer_id = p2.customer_id), 
	(SELECT COUNT(*) FROM payment p3
		WHERE p1.customer_id = p3.customer_id)
FROM payment p1 ORDER BY customer_id;

-- SHOW ONLY THOSE FILMS WITH THE HIGHEST REPLACEMENT COSTS IN THEIR RATING CATEGORY
-- PLUS SHOW THE AVERAGE REPLACEMENT_COST IN THEIR RATING CATEGORY

SELECT title, rating, replacement_cost as highest_replacement_cost_by_rating, 
	(SELECT ROUND(AVG(replacement_cost),2) FROM film f3
		WHERE f1.rating = f3.rating) AS avg_by_rating
FROM film f1
WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film f2
		WHERE f1.rating = f2.rating)
ORDER BY avg_by_rating DESC;

-- SHOW ONLY THOSE PAYMENTS WITH THE HIGHEST PAYMENT 
-- FOR EACH CUSTOMERS FIRST NAME INCLUDING THE PAYMENT_ID OF THAT PAYMENT
-- PAYMENT AND CUSTOMER MUST JOIN
SELECT first_name, amount FROM customer c1
	INNER JOIN payment p1
		ON c1.customer_id = p1.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2
				WHERE p1.customer_id = p2.customer_id);
		