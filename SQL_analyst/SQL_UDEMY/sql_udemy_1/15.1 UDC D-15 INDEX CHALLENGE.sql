/*
UDC SQL D-15
INDEXES PARTITIONING AND QUERY OPTIMIZATION
*/
/* INDEX CHALLENGE.
EXECUTE THE QUERY:
SELECT * FROM flights f2
WHERE flight_no < (SELECT MAX (flight_no) FROM flights f1 
	WHERE F1.departure_airport=f2.departure_airport)
This query has a very bad performance
test indexes on different columns and compare their performance.
ALSO consider and index on multiple columns.
1. on which columns woud you place and index to get the best performance in the query?
*/
-- Query takes up to 30 seconds to be returned.
SELECT * FROM flights f2
WHERE flight_no < (SELECT MAX (flight_no) FROM flights f1 
	WHERE F1.departure_airport=f2.departure_airport);

-- Query takes 23 secs to return with flight_no indexed
CREATE INDEX flights_no_ind
ON flights(flight_no);

DROP INDEX flights_no_ind;

-- QUERY 24 SECS
CREATE INDEX flights_id_ind
ON flights(flight_id);
-- combination of two 24 secs
DROP INDEX flights_id_ind;

-- Query 22 secs
CREATE INDEX dep_airport_ind
ON flights(departure_airport);
DROP INDEX dep_airport_ind;
--23
CREATE INDEX sch_dep_ind
ON flights(scheduled_departure);
DROP INDEX sch_dep_ind;

-- 23 secs
CREATE INDEX aircraft_ind
ON flights(aircraft_code);
DROP INDEX aircraft_ind;

-- 23 secs
CREATE INDEX arr_airport_ind
ON flights(arrival_airport);
DROP INDEX arr_airport_ind;

-- 0.440 SECS WOW
CREATE INDEX flight_no_index
on flights(departure_airport, flight_no);
