/* UDC D-16 CTE'S (COMMON TABLE EXPRESSIONS)
*/

-- CTE CHALLENGE: WRITE EASY CTE
/* Objective:
Calculate the total rental count and total rental amount for each customer,  RENTAL COUNT RENTAL AMNT GROUP BY CUSTOMER_ID
and list customers who have rented more than the average number of films. <AVG

Context:
In the DVD rental business, we need to understand customer behavior by calculating how many movies each customer has rented and how much they have spent. 
We will then identify customers who rent movies more frequently than the average customer.

Setup:
The DVD rental database already includes the following tables:

customer

rental

payment

Challenge:
Create a CTE to calculate the total rental count and total rental amount for each customer.
Use the CTE to filter customers who have rented more than the average number of films.
Write your SQL query to achieve the above objectives. */
-- AVG RENTAL COUNT IS 26.789
-- AVG TOTAL_RENTAL_AMOUNT IS 112.540
WITH cte_a AS (
  SELECT customer_id, COUNT(*) AS rental_count, SUM(amount) AS total_rental_amount 
  FROM payment 
  GROUP BY customer_id
)
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  a.rental_count,
  a.total_rental_amount
FROM customer c
JOIN cte_a a ON c.customer_id = a.customer_id
WHERE a.rental_count > (
  SELECT AVG(rental_count) FROM cte_a
)
ORDER BY a.rental_count DESC;

-- MUTLIPLE CTES CHALLENGE first
/* Objective: 
Identify the customers who have spent more 
than the average amount on rentals
and list the films they have rented (film names)
*/
WITH cte_1 AS (
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_rental_amount 
FROM payment p
JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
),
cte_2 AS(
SELECT ct.customer_id, ct.first_name, ct.last_name, ct.total_rental_amount 
FROM cte_1 ct
WHERE ct.total_rental_amount > (SELECT AVG(total_rental_amount) FROM cte_1)
)
SELECT b.customer_id, b.first_name, b.last_name, b.total_rental_amount, f.film_id, f.title 
FROM cte_2 b
JOIN rental r
ON b.customer_id = r.customer_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON f.film_id = i.film_id;


/* MULTIPLE CTE CHALLENGE 2
Objective: Calculate the total rental count and total rental amount for each customer, 
identify customers who have rented more than the average number of films, and list the details of the films they have rented.
Context: In the DVD rental business, we need to understand customer behavior 
by calculating how many movies each customer has rented and how much they have spent. 
We will then identify customers who rent movies more frequently than the average customer and list the details of the films they have rented.
Note:
High-Rental Customers: Customers who have rented more than the average number of films.

Challenge:
Create a CTE to calculate the total rental count and total rental amount for each customer.

Create a CTE to calculate the average rental count across all customers.

Create a CTE to identify customers who have rented more than the average number of films (high-rental customers).

List the details of the films rented by these high-rental customers.

*/

WITH customer_totals AS (
    SELECT c.customer_id, c.first_name, c.last_name,
           COUNT(r.rental_id) AS rental_count,
           SUM(p.amount) AS total_amount
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
average_rental_count AS (
    SELECT AVG(rental_count) AS avg_rental_count
    FROM customer_totals
),
high_rental_customers AS (
    SELECT ct.customer_id, ct.first_name, ct.last_name, ct.rental_count, ct.total_amount
    FROM customer_totals ct
    JOIN average_rental_count arc ON ct.rental_count > arc.avg_rental_count
)
SELECT hrc.customer_id, hrc.first_name, hrc.last_name, hrc.rental_count, hrc.total_amount, f.film_id, f.title
FROM high_rental_customers hrc
JOIN rental r ON hrc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;


/* RECURSIVE CTE'S TOPIC CHALLENGE
Objective: Create an employee hierarchy table and use a recursive CTE to find all subordinates of a given employee.
Context: In a company, employees are managed in a hierarchical structure where each employee may have a manager. 
We need to find all subordinates of a particular manager, regardless of how many levels down they are in the hierarchy.
Challenge:
Use a recursive CTE to find all subordinates of a given employee.
*/
-- SETUP
-- Create the employee table
CREATE TABLE IF NOT EXISTS employee (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    manager_id INTEGER REFERENCES employee(employee_id)
);
 
-- Insert sample data to establish an employee hierarchy
INSERT INTO employee (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- Alice is the CEO, no manager
(2, 'Bob', 1),            -- Bob reports to Alice
(3, 'Charlie', 1),        -- Charlie reports to Alice
(4, 'David', 2),          -- David reports to Bob
(5, 'Eve', 2),            -- Eve reports to Bob
(6, 'Frank', 3);          -- Frank reports to Charlie

-- CHALLENGE
WITH RECURSIVE anchor_cte AS(
SELECT e.employee_id, e.name, e.manager_id, 1 AS level
FROM employee e
WHERE employee_id = 1

UNION ALL

SELECT e.employee_id, e.name, e.manager_id, st.level + 1 AS level
FROM employee e
JOIN anchor_cte st ON e.manager_id = st.employee_id
)
SELECT employee_id, name, manager_id, level FROM anchor_cte;