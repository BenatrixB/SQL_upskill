-- SQL DATA CLEANING PROJECT
-- DATA WAS IMPORTED FROM A CSV FILE
SELECT *
FROM layoffs;

-- 1. REMOVE DUPLICATES
-- 2. STANDARDIZE THE DATA
-- 3. NULL VALUES OR BLANK VALUES
-- 4. REMOVE ANY COLUMNS

-- CREATING THE STAGEING
CREATE TABLE layoffs_staging
LIKE layoffs;
-- INSERTING DATA FROM 
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- CHECKUP
SELECT *
FROM layoffs_staging;

-- REMOVING DUPLICATES
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS ROW_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS ROW_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE ROW_num > 1;
-- 7 DUPLICATES FOUND

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- DELETING DUPLICATE ROWS
-- YOU CANNOT DELETE DUPLICATES ON THE CTE IN MYSQL (BUT IN MC SERVER THERE IS DIFFERENT)
-- FOR DELETION YOU NEED TO CREATE NEW TABLE WITH ROW NUM
-- THEN INSERT THE CTE AS INSERT INTO
CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `ROW_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_staging_2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS ROW_num
FROM layoffs_staging;
-- COMPLETE DELETION
DELETE
FROM layoffs_staging_2
WHERE ROW_num > 1;
-- CHECK UP
SELECT *
FROM layoffs_staging_2
WHERE ROW_num > 1;

-- STANDARDIZING DATA

-- trriming company around whitespace
SELECT company, TRIM(company)
FROM layoffs_staging_2;

UPDATE layoffs_staging_2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging_2
ORDER BY  1;
-- standardizing industry names
SELECT *
FROM layoffs_staging_2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging_2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';
-- check up for location
SELECT DISTINCT location
FROM layoffs_staging_2
ORDER BY 1;
-- check up for country
SELECT DISTINCT country
FROM layoffs_staging_2
ORDER BY 1;
-- standardizing country names
SELECT DISTINCT  country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging_2
WHERE country LIKE 'United States%'
ORDER BY 1;

UPDATE layoffs_staging_2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- standardizing date format
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging_2;

UPDATE layoffs_staging_2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging_2;

-- converting to date column
ALTER TABLE layoffs_staging_2
MODIFY COLUMN `date` DATE;

-- NULLS
SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging_2
WHERE company = 'Airbnb';

UPDATE layoffs_staging_2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
    WHERE (t1.industry IS NULL OR t1.industry = '')
    AND t2.industry IS NOT NULL;
    
UPDATE layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
    AND t2.industry IS NOT NULL;
    
-- REMOVING COLS AND ROWS
DELETE
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2;

ALTER TABLE layoffs_staging_2
DROP COLUMN ROW_num;