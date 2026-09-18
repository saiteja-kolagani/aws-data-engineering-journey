CREATE TABLE SAMPLE_DATA(
	INTEGER_COL INTEGER,
	BIGINT_COL BIGINT,
	NUMERIC_COL NUMERIC(10, 2),
	DECIMAL_COL DECIMAL,
	REAL_COL REAL,
	DOUBLE_COL DOUBLE PRECISION,
	VARCHAR_COL VARCHAR(255),
	TEXT_COL TEXT,
	BOOLEAN_COL BOOLEAN,
	DATE_COL DATE,
	TIME_COL TIME,
	TIMESTAMP_COL TIMESTAMP,
	TIMESTAMPTZ_ZONE_COL TIMESTAMPTZ,
	UUID_COL UUID,
	JSON_COL JSON,
	JSONB_COL JSONB,
	ARRAY_COL TEXT[]
);

INSERT INTO SAMPLE_DATA (
    INTEGER_COL,
    BIGINT_COL,
    NUMERIC_COL,
    DECIMAL_COL,
    REAL_COL,
    DOUBLE_COL,
    VARCHAR_COL,
    TEXT_COL,
    BOOLEAN_COL,
    DATE_COL,
    TIME_COL,
    TIMESTAMP_COL,
    TIMESTAMPTZ_ZONE_COL,
    UUID_COL,
    JSON_COL,
    JSONB_COL,
    ARRAY_COL
) VALUES (
2147483647, 
9223372036854775807, 
97053559.95, 
970.5355995,
97053.55995,
9.705355995,
'Sai Teja Kolagani',
'I am a Data Engineer',
TRUE,
'18-09-2026',
'09:21:45',
'18-09-2026 09:21:45',
'18-09-2026 09:21:45+5:30',
'550e8400-e29b-41d4-a716-446655440000',
'{"name": "Sai Teja Kolagani", "role": "AWS Data Engineer"}',
'{"skills": ["AWS", "SQL", "Python"]}',
ARRAY['AWS', 'SQL', 'Python']
);

-- "integer_col"	"bigint_col"	"numeric_col"	"decimal_col"	"real_col"	"double_col"	"varchar_col"	"text_col"	"boolean_col"	"date_col"	"time_col"	"timestamp_col"	"timestamptz_zone_col"	"uuid_col"	"json_col"	"jsonb_col"	"array_col"
-- 2147483647	9223372036854775807	97053559.95	970.5355995	97053.56	9.705355995	"Sai Teja Kolagani"	"I am a Data Engineer"	true	"2026-09-18"	"09:21:45"	"2026-09-18 09:21:45"	"2026-09-18 09:21:45+05:30"	"550e8400-e29b-41d4-a716-446655440000"	"{""name"": ""Sai Teja Kolagani"", ""role"": ""AWS Data Engineer""}"	"{""skills"": [""AWS"", ""SQL"", ""Python""]}"	"{AWS,SQL,Python}"


SELECT TO_CHAR(TIMESTAMPTZ_ZONE_COL, 'YYYY-MM-DD')
FROM SAMPLE_DATA;

-- "to_char"
-- "2026-09-18"

SELECT TO_DATE('2026-09-18', 'YYYY/MM/DD');

-- "to_date"
-- "2026-09-18"