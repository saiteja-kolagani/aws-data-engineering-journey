SELECT 'FIRST' ~ 'first'; 
-- false

SELECT 'FIRST' ~* 'first';
-- true

SELECT 'FIRST' !~ 'first';
-- true

SELECT 'FIRST' !~* 'first';
-- false



SELECT RAW_NAME, 
INITCAP(TRIM(
REGEXP_REPLACE(REGEXP_REPLACE(RAW_NAME, '[^a-zA-Z ]', '', 'g'),
'\s+', ' ', 'g'
))) AS NAME
FROM (
	VALUES
	('monkey!! D Luffy@'),
	('  MoNkey12 D @@#Roger'),
	(' D4&   Ace  '),
	('12Joy   Boy'),
	('RoroNoa Zoro    '),
	('Vinsmok234e Sanji&')
) AS T(RAW_NAME);

-- "raw_name"	"name"
-- "monkey!! D Luffy@"	"Monkey D Luffy"
-- "  MoNkey12 D @@#Roger"	"Monkey D Roger"
-- " D4&   Ace  "	"D Ace"
-- "12Joy   Boy"	"Joy Boy"
-- "RoroNoa Zoro    "	"Roronoa Zoro"
-- "Vinsmok234e Sanji&"	"Vinsmoke Sanji"



SELECT ORDER_ID, REGEXP_MATCHES(ORDER_ID, '[0-9]{4}', 'g')
FROM (
	VALUES
	('ORD-2026-001'),
	('ORD-2025-002'),
	('ORD-2025-003')
) AS T(ORDER_ID)

-- "order_id"	"regexp_matches"
-- "ORD-2026-001"	"{2026}"
-- "ORD-2025-002"	"{2025}"
-- "ORD-2025-003"	"{2025}"


SELECT ID, REGEXP_SPLIT_TO_TABLE(SKILLS, ',') AS SKILL
FROM (
	VALUES
	(101, 'AWS, SQL, PYTHON'),
	(102, 'GCP, C++'),
	(103, 'AZURE, JAVA')
) AS T(ID, SKILLS)

-- "id"	"skill"
-- 101	"AWS"
-- 101	" SQL"
-- 101	" PYTHON"
-- 102	"GCP"
-- 102	" C++"
-- 103	"AZURE"
-- 103	" JAVA"


SELECT ORDER_ID, SUBSTRING(ORDER_ID FROM 10 FOR 2) AS COUNTRY_CODE
FROM (
	VALUES
	('ORD-2026-IN-0121'),
	('ORD-2026-US-0424'),
	('ORD-2026-PT-0214')
) AS T(ORDER_ID)

-- "order_id"	"country_code"
-- "ORD-2026-IN-0121"	"IN"
-- "ORD-2026-US-0424"	"US"
-- "ORD-2026-PT-0214"	"PT"