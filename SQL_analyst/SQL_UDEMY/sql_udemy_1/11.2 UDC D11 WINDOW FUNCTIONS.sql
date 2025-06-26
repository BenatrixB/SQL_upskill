-- UDC D-11 CHAL
/*
Write a query that returns the running total
of how late the flights sre (difference between actual_arrival and scheduled_arrival)
ordered by filight_id including the departure aorport
As a second query, claculate the same running total but partitions also by the departure airport
*/
SELECT flight_id, departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(ORDER BY flight_id, departure_airport)
FROM
flights
ORDER BY flight_id, departure_airport;


SELECT flight_id, departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(PARTITION BY departure_airport ORDER BY flight_id, departure_airport)
FROM
flights
ORDER BY flight_id, departure_airport;
