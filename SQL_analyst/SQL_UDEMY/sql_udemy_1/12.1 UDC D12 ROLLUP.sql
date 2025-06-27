-- ROLLUP
/*
Write a query that calculates 
a booking amount rollup for the hierarchy of quarter, month, week in month and day.
*/
SELECT
EXTRACT(quarter from book_date) as quarter,
EXTRACT(month from book_date) as month,
TO_CHAR(book_date, 'w') as week_in_month,
DATE(book_date),
SUM(total_amount)
FROM bookings
GROUP BY 
ROLLUP(
EXTRACT(quarter from book_date),
EXTRACT(month from book_date),
TO_CHAR(book_date, 'w'),
DATE(book_date) 
)
ORDER BY 1,2,3,4
;