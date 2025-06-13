-- UDC 6 JOINS
-- INNER JOINS
-- Joinuose labai svarbu, kaip logi6kai apjungti lenteles. Kokia logine seka jungiame keles lenteles.
-- Svarbu suprasti kas tose lentelėse yra, suprasti duomenų modelį, kad jungimas būtų tikslingas, ypač, jei jungiame keletą lentelių vienu query.
-- INNER JOIN, OUTER JOIN, LEFT JOIN, RIGHT JOIN.
-- inner join yra ten kur intersectina duomenys iš lentelių (nepaima tuščių ar nesijungiančių reikšmių.)
-- INNER  JOIN
-- Airlaine company wants to understand in which category they sell most tickets
-- How many people choose seats in the category
	-- Bussiness
	-- Economy
	-- Comfort
-- three tables must be joined - seats, flights, boarding passes.
-- looking up the tables
SELECT * FROM seats; -- has fare_cond with category labels and two keys seat_no (joins boarding passes) and aircraft_code (joins flights)
SELECT * FROM flights; -- has filgth_id key(joins boarding passes), has aircraft_code key (join seats)
SELECT * FROM boarding_passes; -- has seat_no key (joins seats), has flight_id key (joins flights)
-- All the tables can be joined
-- Join logic? 
-- boarding_passes and flights must be joined by flight_id
-- 
SELECT st.fare_conditions, COUNT(*)
FROM boarding_passes bp
INNER JOIN flights fl
	ON bp.flight_id = fl.flight_id
INNER JOIN seats st
	ON st.seat_no = bp.seat_no 
	AND st.aircraft_code = fl.aircraft_code
GROUP BY st.fare_conditions
ORDER BY 2 DESC;
-- Multiple joins are a bit hard
-- You need to understand entity relationships for that.

-- FULL OUTER JOIN

-- ALL ROWS  from all tables.
SELECT COUNT(*) AS num_of_no_boarding_passes
FROM boarding_passes b
FULL OUTER JOIN tickets t
	ON b.ticket_no = t.ticket_no
WHERE b.ticket_no IS NULL;
-- 127899 tickets with no boarding pass.

-- LEFT OUTER JOIN

-- Only the left table rows and the ones that connect(intersect).
SELECT *
FROM aircrafts_data a
LEFT JOIN flights f
	ON a.aircraft_code = f.aircraft_code
WHERE f.aircraft_code IS NULL;
-- Only one aircraft is not being used
-- chal
-- What are their most popular seats
-- Which seat was chosen most frequently
-- Make sure all seats are included even if they have never been booked.
-- other question is - are there any seats that have never been booked before?
-- Kokias lenteles naudoti reikai pirma i6siai6kinti.
-- Tikrai seats reikia su seat_no ir tikriausiai ticket su t
-- Reikia suprasti, kad booke neb8tinai yra boarding_pass
-- WHICH SEAT
SELECT s.seat_no, COUNT(*) FROM seats s
LEFT JOIN boarding_passes bp
	ON s.seat_no = bp.seat_no
GROUP BY s.seat_no
ORDER BY 2 DESC;
--WHICH LINE
SELECT RIGHT(s.seat_no,1), COUNT(*) FROM seats s
LEFT JOIN boarding_passes bp
	ON s.seat_no = bp.seat_no
GROUP BY RIGHT(s.seat_no,1)
ORDER BY 2 DESC;

-- RIGHT OUTTER JOIN  -- NOT VERY USED BECAUSE LEFT JOIN IS USED
SELECT * FROM aircrafts_data a
RIGHT JOIN flights f
	ON a.aircraft_code = f.aircraft_code
WHERE F.AIRCRAFT_CODE IS NULL;
-- MULTIPLE JOIN CONDITIONS
SELECT bp.seat_no, ROUND(AVG(tf.amount), 2)
FROM boarding_passes bp
INNER JOIN ticket_flights tf
	ON bp.ticket_no = tf.ticket_no
	AND bp.flight_id = tf.flight_id
GROUP BY bp.seat_no
ORDER BY ROUND(AVG(tf.amount), 2) DESC;

-- MULTIPLE TABLE JOINS
SELECT f.flight_id, tf.ticket_no, t.passenger_name, f.scheduled_arrival FROM tickets t
INNER JOIN ticket_flights tf
	ON t.ticket_no = tf.ticket_no
INNER JOIN flights f
	ON tf.flight_id = f.flight_id;





