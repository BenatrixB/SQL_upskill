-- UDC-4
-- UPPER/LOWER/LENGTH
SELECT LOWER(first_name) AS L_first_name,
LOWER(last_name) L_last_name,
LOWER(email) L_email
FROM greencycles.public.customer
WHERE LENGTH(first_name) > 10 OR
LENGTH(last_name) > 10;

-- LEFT/RIGHT
SELECT RIGHT(email, 5) FROM public.customer;
-- FINDING THE '.' IN .ORG EMAIL.
SELECT LEFT(RIGHT(email, 4), 1) FROM public.customer;

-- CONCAT
SELECT LEFT(email, 1)||'***'||RIGHT(email, 19)
FROM public.customer;

-- POSITION
SELECT
LEFT(email, POSITION('.' IN email)-1)||', '||last_name
FROM public.customer;

-- SUBSTRING
SELECT 
LEFT(email, 1)||'***'|| SUBSTRING(email from POSITION('.' IN email) for 2 )||'***'||RIGHT(email, 19)
FROM public.customer;

SELECT
'***'|| SUBSTRING(email from POSITION('.' IN email)-1 for 3 )||'***'||RIGHT(email, 19)
FROM public.customer;

-- EXTRACT
SELECT EXTRACT(MONTH from payment_date), SUM(amount),
COUNT(*)
FROM public.payment
GROUP BY EXTRACT(MONTH from payment_date)
ORDER BY SUM(amount) DESC;

SELECT EXTRACT(DOW from payment_date), SUM(amount),
COUNT(*)
FROM public.payment
GROUP BY EXTRACT(DOW from payment_date)
ORDER BY SUM(amount) DESC;

SELECT EXTRACT(WEEK from payment_date), customer_id, SUM(amount),
COUNT(*)
FROM public.payment
GROUP BY customer_id, EXTRACT(WEEK from payment_date)
ORDER BY SUM(amount) DESC;

-- TO_CHAR

SELECT TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') AS date,
SUM(amount) AS total_amnt,
COUNT(*)
FROM public.payment
GROUP BY date
ORDER BY total_amnt;

SELECT TO_CHAR(payment_date, 'Mon, YYYY') AS date,
SUM(amount) AS total_amnt,
COUNT(*)
FROM public.payment
GROUP BY date
ORDER BY total_amnt;

SELECT TO_CHAR(payment_date, 'Dy, hh:mi') AS date,
SUM(amount) AS total_amnt,
COUNT(*)
FROM public.payment
GROUP BY date
ORDER BY total_amnt DESC;
-- INTERVALS &  TIMESTAMPS
SELECT customer_id, return_date - rental_date AS rental_interval
FROM public.rental
WHERE customer_id = 35
ORDER BY rental_interval DESC;

SELECT customer_id, AVG(return_date - rental_date) AS rental_interval
FROM public.rental
GROUP BY customer_id
ORDER BY rental_interval DESC;


