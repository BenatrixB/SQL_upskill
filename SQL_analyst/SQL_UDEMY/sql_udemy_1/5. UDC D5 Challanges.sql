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
-- CAST & COALESCE

