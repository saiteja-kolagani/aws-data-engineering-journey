-- ============Data Types & Conversion===========

-- VARCHAR
-- NUMBER(P,S)
-- BOOLEAN
-- DATE
-- TIME
-- TIMESTAMP_NTZ
-- TIMESTAMP_LTZ 
-- TIMESTAMP_TZ 
-- VARIANT 
-- ARRAY 
-- OBJECT

-- ================================================

-- COVERSION FUNCTIONS ==========================

SELECT SYSTEM$TYPEOF('HELLO');

SELECT CAST(123 AS VARCHAR);
SELECT 123::VARCHAR;

SELECT TRY_TO_DATE('2020-04-19');
SELECT TRY_TO_NUMBER('123Y');
-- #NULL

SELECT TO_BOOLEAN(1);
-- #TRUE

