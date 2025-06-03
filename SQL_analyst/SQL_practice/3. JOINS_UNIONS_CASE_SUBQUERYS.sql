-- JOINS
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT ed.employee_id, age, occupation FROM employee_demographics ed
INNER JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

SELECT * FROM employee_demographics ed
LEFT JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

SELECT * FROM employee_demographics ed
RIGHT JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

SELECT * FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
;

-- SELF JOIN
SELECT emp1.employee_id AS emp_santa, 
emp1.first_name, 
emp1.last_name,
emp2.employee_id AS emp_id,
emp2.first_name,
emp2.last_name 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id;
    
-- JOINING MULTIPLE TABLES TOGETHTHER
SELECT * FROM employee_demographics ed
INNER JOIN employee_salary es
	ON ed.employee_id = es.employee_id
INNER JOIN parks_departments pd
	ON es.dept_id = pd.department_id
;

-- UNIONS
SELECT age, gender FROM employee_demographics
UNION
SELECT first_name, last_name FROM employee_salary; 

SELECT first_name, last_name FROM employee_demographics
UNION ALL
SELECT first_name, last_name FROM employee_salary; 

SELECT first_name, last_name, 'Old Man' AS label 
FROM employee_demographics 
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS label 
FROM employee_demographics 
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly paid emp' AS label
FROM employee_salary 
WHERE salary > 70000
ORDER BY first_name, last_name; 

-- string functions
SELECT LENGTH('SKYFALL');

SELECT first_name, LENGTH(first_name) FROM employee_demographics
ORDER BY 2;

SELECT UPPER('skyfall');
SELECT LOWER('SKYFALL');
SELECT first_name, UPPER(first_name) 
FROM employee_demographics;
SELECT first_name, LOWER(first_name) 
FROM employee_demographics;

SELECT TRIM('      SKY     ');
SELECT LTRIM('     SKY     ');
SELECT RTRIM('        SKY        ');

SELECT first_name, LEFT(first_name, 1)
FROM employee_demographics;
SELECT first_name, RIGHT(first_name, 1)
FROM employee_demographics;

SELECT first_name, 
RIGHT(first_name, 1),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('An', first_name) AS LOC
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;

SELECT first_name, last_name,
	CASE
		WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Old'
        WHEN age >= 50 THEN 'Too old'
    END AS label
FROM employee_demographics;

-- Pay increase ans bonus
-- < 5000 5%
-- > 5000 7%
-- Finance dep = 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary*0.05)
    WHEN salary > 50000 THEN salary + (salary*0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary*.10
END AS yearly_bonus
FROM employee_salary;