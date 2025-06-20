-- UDC D5 Math functions and operators
-- CASE WHEN & SUM
-- hands om practice 
SELECT 
COUNT(*) AS num_of_flights,
CASE
	WHEN actual_departure IS NULL THEN 'TBC'
	WHEN actual_departure-scheduled_departure < '00:05' THEN 'ONT'
	WHEN actual_departure-scheduled_departure > '01:00' THEN 'VLT'
	ELSE 'BLT'
END AS is_late
FROM bookings.flights
GROUP BY is_late;
-- the chals
-- 1. How many tickets where sold in the categories:
	-- Low price tickets (label: LPT) COND total_amount < 20000
	-- Medium price tickets ( label: MPT) COND total_amount BETWEEN 20000 AND 150000
	-- High price tickets (label: HPT) COND total_amount >= 150000
SELECT 
COUNT(*),
CASE
	WHEN total_amount < 20000 THEN 'LPT'
	WHEN total_amount BETWEEN 20000 AND 150000 THEN 'MPT'
	ELSE 'HPT'
END AS ticket_price
FROM bookings.bookings
GROUP BY ticket_price
ORDER BY COUNT(*) DESC;
-- Hight price (HPT) count = 29994
-- Could make a CTE and filter only the HPT in the output

-- 2. Find out how many flights are scheduled for departure in the following seasons:
	-- Winter (Dec, Jan, Feb)
	-- Spring (Mar, Apr, May)
	-- Summer (Jun, Jul, Aug)
	-- Fall (Sep, Oct, Nov)

SELECT COUNT(*) AS flights,
CASE 
	WHEN EXTRACT(month from scheduled_departure) IN(12, 1, 2) THEN 'Winter'
	WHEN EXTRACT(month from scheduled_departure) <= 5 THEN 'Spring'
	WHEN EXTRACT(month from scheduled_departure) <= 8 THEN 'Summer'
	ELSE 'Fall'
END as season
FROM bookings.flights
GROUP BY season
ORDER BY flights;

-- 3.
-- CAST & COALESCE