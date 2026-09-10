-- =========== EXECUTION ORDER ===========
-- 1. FROM
-- 2. JOIN
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. SELECT
--    └── Window Functions
-- 7. DISTINCT
-- 8. ORDER BY
-- 9. LIMIT

SELECT C.ID, SUM(T.GROSS_AMOUNT) AS TOTAL_GROSS_AMOUNT,
ROW_NUMBER() OVER(ORDER BY SUM(T.GROSS_AMOUNT) DESC) AS RN
FROM CUSTOMERS C
INNER JOIN "TRANSACTIONS" T
ON C.ID = T.CUSTOMER_ID
WHERE C.AGE > 25
GROUP BY C.ID
HAVING SUM(T.GROSS_AMOUNT) > 10000.00
QUALIFY RN <= 10
ORDER BY TOTAL_GROSS_AMOUNT DESC;
-- LIMIT 50 OFFSET 3;
-- ======================================

-- ================== CASE, COALESCE, and comparison/logical operators =====================
SELECT
ID, NAME, AGE,
CASE 
    WHEN AGE < 18 THEN 'CHILD'
    WHEN AGE >= 18 AND AGE <= 28 THEN 'YOUNG AGE'
    WHEN AGE BETWEEN 29 AND 45 THEN 'MIDDLE AGE'
    ELSE 'OLD AGE'
END AS AGE_FACTOR,
GENDER
FROM CUSTOMERS
WHERE GENDER ILIKE 'FEMALE';
-- ================================================================

--  ============== Common NULL and filtering mistakes ==================
SELECT NULL <> 'ABC'; 
-- #null

SELECT NULL = NULL;
-- #null

SELECT NULL IS NULL;
-- #TRUE

SELECT '1' NOT IN ('1', '2', '3');
-- #FALSE

SELECT '1' NOT IN ('1', '2', '3', NULL);
-- #FALSE 
-- '1' <> '1' #FALSE
-- AND
-- '1' <> '2' #TRUE
-- AND
-- '1' <> '3' #TRUE
-- AND
-- '1' <> NULL #UNKNOWN
-- FALSE AND anything = FALSE

SELECT '4' IN ('1', '2', '3', NULL);
-- #null
-- '4' <> '1'    → TRUE
-- '4' <> '2'    → TRUE
-- '4' <> '3'    → TRUE
-- '4' <> NULL   → UNKNOWN
-- TRUE AND TRUE AND TRUE AND UNKNOWN = UNKNOWN

SELECT COUNT(*) FROM VALUES (1), (2), (3), (4), (5), (5), (4);
-- #7

SELECT COUNT(DISTINCT column1)
FROM VALUES
    (1), (2), (3), (4), (5), (5), (4);
-- #5

SELECT COUNT(*) FROM VALUES (1), (2), (3), (4), (5), (5), (4), (NULL), (NULL);
-- #9

SELECT COUNT(COLUMN1) FROM VALUES (1), (2), (3), (4), (5), (5), (4), (NULL), (NULL);
-- #7

SELECT 'ABC' = 'abc';
-- #FALSE

SELECT LOWER('ABC') = 'abc';
-- #TRUE

SELECT 'ABC' = UPPER('abc');
-- #TRUE

SELECT 'ABC' ILIKE 'abc';
-- #TRUE