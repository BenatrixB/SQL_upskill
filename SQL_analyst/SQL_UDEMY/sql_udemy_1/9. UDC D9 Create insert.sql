-- UDC D9 MANAGE TABLES
-- CREATE TABLE
CREATE TABLE online_sales (
"transaction_id" SERIAL PRIMARY KEY,
"customer_id" INT REFERENCES customer(customer_id),
"film_id" INT REFERENCES film(film_id),
"amount" NUMERIC(5, 2) NOT NULL,
"promotion_code" VARCHAR(10) DEFAULT 'None'
);

INSERT INTO online_sales
(transaction_id, customer_id, film_id, amount, promotion_code)
VALUES 
(1, 124, 65, 14.99, 'PROMO2022'),
(2, 225, 231, 12.99, 'JULYPROMO'),
(3, 119, 53, 15.99, 'SUMMERDEAL');

CREATE TABLE director(
"director_id" SERIAL PRIMARY KEY,
"director_account_name" VARCHAR(20) UNIQUE,
"first_name" VARCHAR(50),
"last_name" VARCHAR(50),
"date_of_birth" DATE,
"address_id" INT REFERENCES address(address_id)
);
/*
1. director_account_name to VARCHAR(20)
2. drop the default on last_name
3. add the constrain not null to last_name
4. add the column email of data type VARCHAR(40)
5. rename the director_account_name to account_name
6. rename the table from director to directors
*/
ALTER TABLE director
ALTER COLUMN  director_account_name TYPE VARCHAR(30),
ALTER COLUMN last_name SET NOT NULL,
ADD COLUMN email VARCHAR(40);

ALTER TABLE director
RENAME director_account_name TO account_name;

ALTER TABLE director
RENAME TO directors;

-- DATA CHECKS
CREATE TABLE songs(
song_id SERIAL PRIMARY KEY,
song_name VARCHAR(30) NOT NULL,
genre VARCHAR(30) DEFAULT 'Not defined',
price NUMERIC(4,2) CHECK(price>=1.99),
release_date DATE CONSTRAINT date_check CHECK(release_date BETWEEN '01-01-1950' AND CURRENT_DATE));

