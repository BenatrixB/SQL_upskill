ALTER DATABASE greencycles SET timezone TO 'Europe/Berlin'; 

-- WHERE

SELECT COUNT(*) AS payments_by_ID100
FROM public.payment
WHERE customer_id = 100;

SELECT last_name
FROM public.customer
WHERE first_name = 'ERICA';
--MATTHEWS

-- WHERE operators
--  Where return dates is null
SELECT COUNT(*) AS rentals_not_returned 
FROM public.rental
WHERE return_date is null;

-- payment amount less then or = 2$
SELECT payment_id, amount
FROM public.payment
WHERE amount <= 2;

SELECT COUNT(*) AS num_of_payments_underequal_2$
FROM public.payment
WHERE amount <= 2;
-- WHERE AND/OR
-- IDS: 322 346 354 less then 2$ OR Greater then 10
SELECT *
FROM public.payment
WHERE (customer_id = 322
OR customer_id = 346
OR customer_id = 354)
AND (amount < 2 OR amount > 10)
ORDER BY customer_id ASC, amount DESC;
-- BETWEEN
SELECT COUNT(*) AS num_of_faulty_payments
FROM public.payment
WHERE 
amount BETWEEN 1.99 AND 3.99
AND
payment_date BETWEEN '2020-01-26' AND '2020-01-27 23:59';

-- IN
SELECT *
FROM public.payment
WHERE customer_id IN(12, 25, 67, 93, 124, 234)
AND
amount IN(4.99, 7.99, 9.99)
AND payment_date BETWEEN '2020-01-01 0:00' AND '2020-01-31 23:59';

-- LIKE
-- hOW MANY MOVIES WITH 'Documentray' IN THE DESCRIPTION?
SELECT COUNT(*) AS num_of_Documentary
FROM public.film
WHERE description LIKE '%Documentary%'; -- 101

SELECT COUNT(*) AS num_of_customers
FROM public.customer
WHERE first_name LIKE '___'
AND (last_name LIKE '%X' OR last_name LIKE '%Y'); --3

-- MAIN DAY CHALLANGE
-- 1
SELECT COUNT(*) AS no_of_movies
FROM public.film
WHERE description LIKE '%Saga%'
AND (title LIKE 'A%' OR title LIKE '%R'); -- 14
-- 2
SELECT * 
FROM public.customer
WHERE first_name LIKE '%ER%'
AND first_name LIKE '_A%'
ORDER BY last_name DESC; -- 5 rows

-- 3
SELECT COUNT(*)
FROM public.payment
WHERE (amount = 0
OR amount BETWEEN 3.99 AND 7.99) 
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02'; -- 56 ROWS RETURNED
