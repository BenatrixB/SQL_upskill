-- UDC D-11 WINDOW FUNCTIONS
-- WINDOW FUCNTION OVER(PARTITION BY) CHALL
/*
Write a qery that returns that list of movies including
- film_id (order by)
- title
- length
- category
- average lenght of movies in that category (round)
*/
SELECT 
f.film_id, f.title, f.length, c.name AS category,
ROUND(AVG(length) OVER(PARTITION BY name), 2) AS avg_length,
ROUND(AVG(length) OVER(PARTITION BY name), 2) - length AS diff
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
ORDER BY f.film_id;

/*
Write a query that returns all payment details including
the number of paymetns that were made by this customer and that amount
order the results by payment_id
*/
SELECT
*,
COUNT(*) OVER(PARTITION BY customer_id, amount) AS cnt_cstmr_amnt
FROM
payment
ORDER BY payment_id;

-- RANK CHALLENGE
/*
Write query that returns the custormers name, the country
and how many payments they have. For that use exsisting view customer_list.
Afterwards create a ranking of the top customers with the most sales for each country.
Filter the results to only the top 3 cutomers per country.
*/
SELECT * FROM(
SELECT
cl.name,
cl.country,
COUNT(*),
RANK()OVER(PARTITION BY country ORDER BY COUNT(*) DESC)
FROM
customer_list cl
JOIN
payment p
ON
cl.id = p.customer_id
GROUP BY cl.name, cl.country) subq
WHERE rank IN(1,2,3)
ORDER BY rank;


SELECT * FROM(
SELECT
cl.name,
cl.country,
COUNT(*),
FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) DESC)
FROM
customer_list cl
JOIN
payment p
ON
cl.id = p.customer_id
GROUP BY cl.name, cl.country) subq
WHERE rank IN(1,2,3)
ORDER BY rank;

-- LEAD LAG CHALLENGE
/* 
Write a query that returns the revenue of the day and the revenue of the previous day
*/
SELECT 
SUM(amount),
DATE(payment_date) AS day,
LAG (SUM(amount)) OVER(ORDER BY DATE(payment_date)) as prev_day,
SUM(amount) - LAG (SUM(amount)) OVER(ORDER BY DATE(payment_date)) as diff,
ROUND((((SUM(amount) - LAG (SUM(amount)) OVER(ORDER BY DATE(payment_date)))
/ LAG (SUM(amount)) OVER(ORDER BY DATE(payment_date)))*100),2) as prc_growth
FROM payment
GROUP BY DATE(payment_date)