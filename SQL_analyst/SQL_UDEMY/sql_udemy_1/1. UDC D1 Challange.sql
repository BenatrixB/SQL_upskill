
-- LIST OF DISTINCT DISTRICTS
SELECT DISTINCT district
FROM public.address
ORDER BY district ASC;

-- LATEST RENTAL DATE
SELECT *
FROM public.rental
ORDER BY rental_date DESC
LIMIT 1; -- 2020-02-14 17:16:03+02

-- HOW MANY FILMS DOES THE COMPANY HAVE?
SELECT COUNT(DISTINCT film_id) AS count_of_all_movies
FROM public.film; -- 1000

-- HOW MANY DISTICNT LAST_NAMES OF THE CUSTOMERS THERE ARE?
SELECT COUNT(DISTINCT last_name) AS count_of_disticnt_last_names
FROM public.customer; -- 599
