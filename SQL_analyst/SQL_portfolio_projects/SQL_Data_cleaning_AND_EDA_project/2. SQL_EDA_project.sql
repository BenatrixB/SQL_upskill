-- SQL EXPLANATORY DATA ANALYSIS PROJECT

SELECT *
FROM layoffs_staging_2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging_2;

SELECT location, industry, SUM(total_laid_off)
from layoffs_staging_2
WHERE percentage_laid_off = 1 AND total_laid_off IS NOT NULL
GROUP BY location, industry;

SELECT industry, `date`, SUM(total_laid_off)
from layoffs_staging_2
WHERE percentage_laid_off = 1 AND total_laid_off IS NOT NULL
GROUP BY industry, `date`
ORDER BY `date`;

SELECT *
FROM layoffs_staging_2
WHERE percentage_laid_off = 1;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging_2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY industry
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

-- Rolling total of laid off per month
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging_2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

WITH Rolling_total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging_2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;


-- RANKING BY COMPANY BY YEAR (WHICH COMPANY LAID OFF THE MOST PEOPLE EVERY YEAR?)
SELECT company, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company, YEAR(`date`)
), company_year_rank AS
( -- 2nd CTE in a CTE :D
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5; -- Top 5 Companies every year by layoffs