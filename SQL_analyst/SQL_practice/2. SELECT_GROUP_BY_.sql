-- SELECT STATEMENT
SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name FROM employee_demographics;

SELECT first_name, last_name, birth_date, age, age + 10, (age + 10) * 10 +10
FROM employee_demographics;
-- PEMDAS...

SELECT DISTINCT first_name FROM employee_demographics;
SELECT DISTINCT first_name, gender FROM employee_demographics;

-- WHERE CLAUSE
SELECT * FROM employee_salary WHERE first_name = 'Leslie';
SELECT * FROM employee_salary WHERE salary > 50000;
SELECT * FROM employee_salary WHERE salary < 50000;
-- Only two people earn less than 50k.

SELECT * FROM employee_demographics WHERE  gender = 'Female';
-- 4 Females
SELECT * FROM employee_demographics WHERE  gender != 'Female';
-- 7 Males.

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01';
-- 6 people born after 1985
SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01' AND gender = 'male';
-- 4 males are born after 1985
SELECT * FROM employee_demographics WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;
-- 	LIKE statement
-- % And or _ 
SELECT * FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT * FROM employee_demographics
WHERE first_name LIKE '%a%';

-- GROUP BY
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;
SELECT first_name FROM employee_demographics GROUP BY gender;

SELECT occupation, salary FROM employee_salary GROUP BY occupation, salary;
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender;

-- ORDER BY
SELECT * FROM employee_demographics
ORDER BY first_name DESC;
SELECT * FROM employee_demographics
ORDER BY 5, 4 DESC;

-- having
SELECT gender, AVG(age) FROM employee_demographics
WHERE AVG(age)> 40
GROUP BY gender;

SELECT gender, AVG(age) FROM employee_demographics
GROUP BY gender
HAVING AVG(age)> 40;

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE '%manager%' 
GROUP BY occupation
HAVING AVG(salary) > 75000;

-- limit and aliasing
SELECT * FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 3;
-- PIRMAS SKAICIUS LIMIT YRA NUO KURIOS POZ PRADET, O ANTRAS KIEK OUTPUTAS DUODA ROWS.

-- ALSIASING
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING  AVG(age)> 40;




