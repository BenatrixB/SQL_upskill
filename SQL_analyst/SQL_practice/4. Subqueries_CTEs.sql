-- SUBQUERIES
SELECT *
FROM employee_demographics
WHERE employee_id IN 
		(SELECT employee_id -- CANNOT MAKE MULTIPLE COLS IN SUBQ
			FROM employee_salary
			WHERE dept_id = 1)
;

SELECT first_name, salary,
(SELECT AVG(salary) FROM employee_salary) AS avg_salary
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM 
	(SELECT gender, 
    AVG(age) AS avg_age,
	MAX(age) AS max_age,
    MIN(age) AS min_age,
    COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS AGG_TABLE
;

-- WINDOW FUNCTIONS
SELECT gender, AVG(salary) 
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
GROUP BY gender;

SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
;

SELECT d.first_name, d.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
;

SELECT d.first_name, d.last_name, gender, SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
;

SELECT d.first_name, d.last_name, gender, 
SUM(salary) OVER(PARTITION BY gender ORDER BY d.employee_id) AS rolling_total
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
;

SELECT d.first_name, d.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS ROW_num, -- ROW NUMBER TIK PARODO EILUTĖS NUMERĮ, KARTAIS FOR PRIMARY KEY NAUDINGA.
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS RANK_num, -- RANK SU DUPLICATAIS REIKŠMĖS DUODA TOKĮ PAT SKAIČIŲ
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS DENSE_RANK_num -- DUODA RANK NE PAGAL POZICIJĄ, BET PAGAL VERTĘ
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
;

-- !!!! CTEssss !!!
WITH CTE_example (GENDER, AVG_SAL, MAX_SAL, MIN_SAL, COOUNT_SAL)AS
(
SELECT gender, AVG(salary) AS avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal 
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
GROUP BY gender
)

SELECT AVG(avg_sal)
FROM CTE_example;
-- YOU CANNOT RETRIEVE THE CTE AFTER ONE SELECT
WITH CTE_example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_ex2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary> 50000
)
SELECT *
FROM CTE_example
JOIN CTE_ex2
	ON CTE_example.employee_id = CTE_ex2.employee_id;
    
-- TEMPORARY TABLES
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar (50),
favorite_movie varchar(100)
);

INSERT INTO temp_table
VALUES('Ben', 'Bnaldo', 'Fight club');

SELECT *
FROM temp_table;

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;

-- STORED PROCEDURES
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();

-- PARAMETERS
DELIMITER $$
CREATE PROCEDURE large_salaries4(NEW_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = NEW_employee_id
	;
END $$
DELIMITER ;

CALL large_salaries4(1);


-- TRIGGERS AND EVENTS
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;


DELIMITER $$
CREATE TRIGGER emp_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Random', 'Rondomers', 'Randomizer', 1000000, NULL);

-- EVENTS (SCHEDULING/AUTOMATOR)
SELECT *
FROM employee_demographics;
DELIMITER $$
CREATE EVENT delete_ret
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE 
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'evemt%';


