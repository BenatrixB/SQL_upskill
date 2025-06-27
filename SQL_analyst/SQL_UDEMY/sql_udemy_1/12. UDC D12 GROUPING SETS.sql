-- UDC D-12 GROUPING SETS, ROLLUPS, SELF-JOINS.
-- GROUPING SETS CHALLENGE
/*
Write a query that return the sum of the amount for each
customer (first_name and last_name) and each staff_id.
Also add the overall revenue per customer.
*/
-- FIRST_NAME LAST NAME STAFFID SUM
SELECT 
c.first_name, last_name,
p.staff_id, SUM(p.amount) as amnt_spent,
ROUND(100*SUM(amount)/FIRST_VALUE(SUM(amount)) OVER(PARTITION BY first_name, last_name
ORDER BY SUM(amount) DESC),2) as proc
FROM
customer c
JOIN
payment p
ON 
c.customer_id = p.customer_id
GROUP BY
GROUPING SETS(
	(first_name, last_name),
	(first_name, last_name, p.staff_id)
);
/*
Write a query that returns all grouping sets in all combinations of customer_id,
date and title with the aggregation of the payment amount.
*/
SELECT 
p.customer_id,
DATE(p.payment_date),
f.title,
SUM(p.amount)
FROM 
payment p
JOIN 
rental r
ON 
r.rental_id = p.rental_id
JOIN
inventory i
ON
i.inventory_id = r.inventory_id
JOIN
film f
ON
f.film_id = i.film_id
GROUP BY
CUBE(p.customer_id,
DATE(p.payment_date),
f.title
);
-- Self join
SELECT
f1.title,
f2.title,
f2.length
FROM film f1
LEFT JOIN film f2
ON f1.length=f2.length
AND
f1.title<>f2.title
ORDER BY length DESC;