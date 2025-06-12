-- UDC D5 Math functions and operators

-- Math functions and operators
-- Task: increase the prices for films that are more expensive to replace
-- Create a list of films inc relation of rental_rate/replacement_cost
-- where the rental rate is less than 4% of the replacement cost
	SELECT film_id, 
	ROUND(rental_rate/replacement_cost*100, 2)  AS proc
	FROM public.film
	WHERE ROUND(rental_rate/replacement_cost*100, 2) < 4
	ORDER BY 2 ASC;
-- CASE WHEN & SUM
-- Other db will be used therefore it will appear in the other sql file 5.1 UDC 5...
-- 3. Create a movie tier list in the following way:
		-- Rating 'PG' OR 'PG-13' OR length > 210 min - Great rating or long
		-- Description contains 'Drama' AND length > 90 min - Long drama
		-- Description contains 'Drama' AND length < 90 min - Short drama
		-- Rental_rate is less than 1$ - Very cheap
-- How to filter in only those 4 tiers (No null tier)
SELECT * FROM public.film;
SELECT title,
CASE
	WHEN (rating = 'PG' OR rating = 'PG-13') OR length > 210 THEN 'Tier 1. Great rating or long'
	WHEN description LIKE '&Drama%' AND length > 90 THEN 'Tier 2. Long drama'
	WHEN description LIKE '&Drama%' AND length < 90 THEN 'Tier 3. Short drama'
	WHEN rental_rate < 1 THEN 'Tier 4. Very cheap'
END as tiers
FROM public.film
WHERE CASE
	WHEN (rating = 'PG' OR rating = 'PG-13') OR length > 210 THEN 'Tier 1. Great rating or long'
	WHEN description LIKE '&Drama%' AND length > 90 THEN 'Tier 2. Long drama'
	WHEN description LIKE '&Drama%' AND length < 90 THEN 'Tier 3. Short drama'
	WHEN rental_rate < 1 THEN 'Tier 4. Very cheap'
END IS NOT NULL;
-- CAST & COALESCE
SELECT
rental_date,
COALESCE(CAST(return_date AS VARCHAR), 'NOT RETURNED') AS return_date
FROM public.rental
ORDER BY rental_date DESC;

