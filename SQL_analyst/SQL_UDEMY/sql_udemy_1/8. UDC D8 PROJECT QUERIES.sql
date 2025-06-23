-- UDC 8 PROJECT/CHALLANGES
-- 14 QUERIES
-- 1. Create a list of all the different (distinct) replacement costs of the films.
-- Question: What's the lowest replacement cost? Answer: 9.99
	SELECT DISTINCT(replacement_cost) FROM film 
	ORDER BY replacement_cost ASC
	limit 1; -- Answer 9.99 correct
-- 2. Write a query that gives an overview of how many films have replacements costs in the following cost ranges
		-- low: 9.99 - 19.99
		-- medium: 20.00 - 24.99
		-- high: 25.00 - 29.99
 -- Question: How many films have a replacement cost in the "low" group? ANSWER 514
SELECT
	COUNT(*),
	CASE
		WHEN replacement_cost BETWEEN 	9.99 AND 19.99 THEN 'low'
		WHEN replacement_cost BETWEEN 	20.00 AND 24.99 THEN 'medium'
		WHEN replacement_cost BETWEEN 	25.00 AND 29.99 THEN 'high'
	END as cost_category
FROM film
WHERE CASE
		WHEN replacement_cost BETWEEN 	9.99 AND 19.99 THEN 'low'
		WHEN replacement_cost BETWEEN 	20.00 AND 24.99 THEN 'medium'
		WHEN replacement_cost BETWEEN 	25.00 AND 29.99 THEN 'high'
	END  = 'low' 
GROUP BY cost_category;

-- Question 3:
-- Level: Moderate
-- Topic: JOIN
-- Task: Create a list of the film titles including their title, length, and category name ordered descendingly by length. 
-- Filter the results to only the movies in the category 'Drama' or 'Sports'.
-- Question: In which category is the longest film and how long is it?
-- Answer: Sports and 184
SELECT * FROM film_category
WHERE category_id = 6;
SELECT * FROM category;
-- Kategorija turi many to one ryšį filmams. Viena kategorija gali turėti daug filmų.
-- film --> film_category --> category (name)
SELECT f.title, f.length, c.name FROM film f
INNER JOIN film_category fc
	ON f.film_id = fc.film_id
INNER JOIN category c
	ON fc.category_id = c.category_id
WHERE c.name = 'Drama' OR c.name = 'Sports'
ORDER BY f.length DESC
LIMIT 3; -- Answer: 184 sports
 

-- Question 4:
-- Level: Moderate
-- Topic: JOIN & GROUP BY
-- Task: Create an overview of how many movies (titles) there are in each category (name).
-- Question: Which category (name) is the most common among the films?
-- Answer: Sports with 74 titles
--> SELECT f.title, f.length, c.name FROM film f
SELECT  c.name, COUNT(*)AS CNT_of_TITLES
FROM film f
INNER JOIN film_category fc
	ON f.film_id = fc.film_id
INNER JOIN category c
	ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(*) DESC
limit 3;



-- Question 5:
-- Level: Moderate
-- Topic: JOIN & GROUP BY
-- Task: Create an overview of the actors' first and last names and in how many movies they appear in.
-- Question: Which actor is part of most movies??
-- Answer: Susan Davis with 54 movies
SELECT a.first_name, a.last_name, COUNT(*) as num_movies_of_actor FROM actor a 
INNER JOIN film_actor fa
	ON a.actor_id = fa.actor_id
INNER JOIN film f
	ON f.film_id = fa.film_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(*) DESC
LIMIT 3; -- Correct
-- Question 6:
-- Level: Moderate
-- Topic: LEFT JOIN & FILTERING
-- Task: Create an overview of the addresses that are not associated to any customer.
-- Question: How many addresses are that?
-- Answer: 4
SELECT 
c.customer_id, first_name, c.last_name, a.address
FROM 
address a
LEFT JOIN
cuStomer c
ON
a.address_id = c.address_id
WHERE customer_id IS NULL
LIMIT 5; -- Correct
	


-- Question 7:
-- Level: Moderate
-- Topic: JOIN & GROUP BY
-- Task: Create the overview of the sales  to determine the from which city 
-- (we are interested in the city in which the customer lives, not where the store is) most sales occur.
-- Question: What city is that and how much is the amount?
-- Answer: Cape Coral with a total amount of 221.55
-- address --> city (city_id), address_id to customer(addrss_id) --> cutomer_id with payments
SELECT 
ci.city, SUM(p.amount) AS sum_amnt
FROM 
address a
JOIN
customer c
ON
a.address_id = c.address_id
JOIN
city ci
ON 
a.city_id = ci.city_id
JOIN
payment p
ON
c.customer_id = p.customer_id
GROUP BY 
ci.city
ORDER BY SUM
(p.amount) DESC
LIMIT 3; -- Correct :D


-- Question 8:
-- Level: Moderate to difficult
-- Topic: JOIN & GROUP BY
-- Task: Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".
-- Question: Which country, city has the least sales?
-- Answer: United States, Tallahassee with a total amount of 50.85.
SELECT
co.country, ci.city, SUM(amount) as sum_amnt
FROM
city ci
JOIN
country co
ON
ci.country_id = co.country_id
JOIN
address a
ON
a.city_id = ci.city_id
JOIN
customer cu
ON
a.address_id = cu.address_id
JOIN 
payment p
ON 
cu.customer_id = p.customer_id
GROUP BY co.country, ci.city
ORDER BY SUM(amount) ASC
LIMIT 3; -- Correct

-- Question 9:
-- Level: Difficult
-- Topic: Uncorrelated subquery
-- Task: Create a list with the average of the sales amount each staff_id has per customer.
-- Question: Which staff_id makes on average more revenue per customer?
-- Answer: staff_id 2 with an average revenue of 56.64 per customer.

--> subquery in where ?id=(Subq)
SELECT 
staff_id,
ROUND(AVG(TOTAL), 2) AS total_avg
FROM 
	(SELECT 
	staff_id,
	customer_id,
	SUM
	(amount) total
	FROM 
	payment
	GROUP BY staff_id, customer_id) subq
GROUP BY  
staff_id
ORDER BY 
ROUND(AVG(TOTAL), 2) DESC
LIMIT 1;



-- Question 10:
-- Level: Difficult to very difficult
-- Topic: EXTRACT + Uncorrelated subquery
-- Task: Create a query that shows average daily revenue of all Sundays.
-- Question: What is the daily average revenue of all Sundays?
-- Answer: 1410.65
SELECT ROUND(AVG(total), 2)
FROM
	(SELECT 
	DATE(payment_date), EXTRACT(DOW FROM payment_date),
	SUM(amount) AS total
	FROM payment
	WHERE EXTRACT(DOW FROM payment_date) = 0
	GROUP BY 
	DATE(payment_date), EXTRACT(DOW FROM payment_date)) Subq;
-- Question 11:
-- Level: Difficult to very difficult
-- Topic: Correlated subquery
-- Task: Create a list of movies - with their length and their replacement cost 
-- - that are longer than the average length in each replacement cost group.
-- Question: Which two movies are the shortest on that list and how long are they?
-- Answer: CELEBRITY HORN and SEATTLE EXPECTATIONS with 110 minutes.

SELECT 
title,
length,
replacement_cost
FROM 
film f1
WHERE length > (SELECT
	AVG(length) FROM film f2
	WHERE f1.replacement_cost = f2.replacement_cost)
ORDER BY length ASC
limit 2;

-- Question 12:
-- Level: Very difficult
-- Topic: Uncorrelated subquery
-- Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.
-- Example:
-- If there are two customers in "District 1" where one customer has a total (lifetime)
-- spent of $1000 and the second customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
-- So, first, you need to calculate the total per customer and then the average of these totals per district.
-- Question: Which district has the highest average customer lifetime value?
-- Answer: Saint-Denis with an average customer lifetime value of 216.54.
SELECT 
district,
ROUND(AVG(total),2) 
FROM (SELECT 
	c.customer_id,
	district, 
	SUM(amount) AS total
	FROM payment p
	INNER JOIN customer c
	ON p.customer_id = c.customer_id
	INNER JOIN address a
	ON a.address_id = c.address_id
	GROUP BY district, c.customer_id) subq
GROUP BY district
ORDER BY 2 DESC;


;



-- Question 13:
-- Level: Very difficult
-- Topic: Correlated query
-- Task: Create a list that shows all payments including the payment_id, amount, and the film category (name) plus the total amount that was made in this category. 
-- Order the results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.
-- Question: What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?
-- Answer: Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that category is 16055.
SELECT
title,
amount,
name,
payment_id,
(SELECT SUM(amount) FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c1
ON c1.category_id=fc.category_id
WHERE c1.name=c.name)
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
ORDER BY name;
-- Bonus question 14:
-- Level: Extremely difficult
-- Topic: Correlated and uncorrelated subqueries (nested)
-- Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
-- Question: Which is the top-performing film in the animation category?
-- Answer: DOGMA FAMILY with 178.70.

SELECT
title,
name,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
GROUP BY name,title
HAVING SUM(amount) =     (SELECT MAX(total)
			  FROM 
                                (SELECT
			          title,
                                  name,
			          SUM(amount) as total
			          FROM payment p
			          LEFT JOIN rental r
			          ON r.rental_id=p.rental_id
			          LEFT JOIN inventory i
			          ON i.inventory_id=r.inventory_id
				  LEFT JOIN film f
				  ON f.film_id=i.film_id
				  LEFT JOIN film_category fc
				  ON fc.film_id=f.film_id
				  LEFT JOIN category c1
				  ON c1.category_id=fc.category_id
				  GROUP BY name,title) sub
			   WHERE c.name=sub.name)