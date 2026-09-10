-- ==================  String Functions for Cleansing & Transformation ====================

SELECT TRIM('   RIGHT   ');
SELECT LTRIM('  TRIM');
SELECT RTRIM('TRIM  ');

SELECT UPPER('hello');
SELECT LOWER('HELLO');
SELECT INITCAP('helLo');
-- #Hello

SELECT LENGTH('1234');
-- #4

SELECT SUBSTR('HELLO', 3);
-- #LLO
SELECT SUBSTRING('HHELO', 4);
-- #LO

SELECT LEFT('HELLO', 2);
-- #HE
SELECT RIGHT('HELLO', 3);
-- #LLO

SELECT REPLACE('HELLO WORLD', 'HELLO', 'HI');
-- #HI WORLD

SELECT SPLIT('HELLO WORLD', ' ');
-- #["HELLO","WORLD"]
SELECT SPLIT_PART('HELLO WORLD', ' ', 1);
-- #HELLO

SELECT CONCAT('HHELO', ' ', 'WORLD');
SELECT 'HELLO' || ' ' || 'WORLD';

SELECT LPAD('HELLO', 10, '@');
SELECT RPAD('HELLO', 7);


-- ============ REGEXP LIKE =====================

SELECT REGEXP_LIKE('ABC123', '[A-Z]+[0-9]+');
-- #TRUE

-- Check whether a value have a single number
SELECT REGEXP_LIKE('2', '[0-9]');
-- #TRUE

-- Check whther a value contains only numbers
SELECT REGEXP_LIKE('123', '[0-9]+');
-- #TRUE

-- Check whether a value contains a number:
SELECT REGEXP_LIKE('ABC123', '.*[0-9].*'); -- CONTAINS: USE: .*pattern.*
-- #TRUE

SELECT REGEXP_LIKE('123ABC', '.*^[0-9]+.*');
-- #TRUE

SELECT REGEXP_LIKE(
    'sai.Teja12@gmail12.com',
    '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);
-- #TRUE

-- | Symbol  | Meaning                            |
-- | ------- | ---------------------------------- |
-- | `^`     | Start of string                    |
-- | `$`     | End of string                      |
-- | `[]`    | Character class                    |
-- | `+`     | One or more                        |
-- | `*`     | Zero or more                       |
-- | `?`     | Zero or one                        |
-- | `{2,}`  | At least 2                         |
-- | `{2,5}` | 2 to 5                             |
-- | `.`     | Any character                      |
-- | `\.`    | Literal `.`                        |
-- | `\d`    | Digit (depending on regex context) |
-- | `\s`    | Whitespace                         |



-- ================ REGEXP_REPLACE ==================

SELECT REGEXP_REPLACE('ABC123', '[0-9]', '');
-- #ABC

-- Remove special characters
SELECT REGEXP_REPLACE('Hello@World#123!', '[^A-Za-z0-9]', '');  -- [^A-Za-z0-9] means Anything that is NOT a digit.

-- Replace multiple spaces with one space
SELECT REGEXP_REPLACE('HELLO    WORLD   SNOWFLAKE', ' +', ' ');

--  Extract and replace using groups: Can use parentheses () to create capturing groups.
SELECT REGEXP_REPLACE(
    '2026-09-10',
    '([0-9]{4})-([0-9]{2})-([0-9]{2})',
    '\\3/\\2/\\1'
);
-- In Snowflake replacement strings, capture groups are referenced using \1, \2, etc.; when writing them inside a SQL string literal, escaping can matter.


-- ===================== REGEXP_SUBSTR =======================
-- REGEXP_SUBSTR(string,pattern,position,occurrence)

SELECT REGEXP_SUBSTR('ABC123XYZ', '[0-9]+');

-- Extract a specific pattern
SELECT REGEXP_SUBSTR('ORDER ID: ORD12345', 'ORD[0-9]+');

-- Extract the second occurrence
SELECT REGEXP_SUBSTR('ABC123 DEF456 GHI789','[A-Z]+[0-9]+',1,2);
-- position = 1
-- occurrence = 2  MEANS: Start at character 1 and return the 2nd matching occurrence.


-- REGEXP_LIKE → Check
-- REGEXP_SUBSTR → Extract
-- REGEXP_REPLACE → Replace
