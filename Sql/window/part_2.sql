-- 1

SELECT DISTINCT ON ("SHOPNUMBER")
    "SHOPNUMBER",
    "CITY",
    "ADDRESS",
    sum("QTY") OVER (PARTITION BY "SHOPNUMBER") AS SUM_QTY,
    sum("PRICE" * "QTY") OVER (PARTITION BY "SHOPNUMBER") AS SUM_QTY_PRICE
FROM "window".sales
JOIN "window".shops 
USING ("SHOPNUMBER")
JOIN "window".goods g
USING ("ID_GOOD")
WHERE "DATE" = '2016-01-02';

-- 2

SELECT DISTINCT ON ("DATE", "CITY")
	"DATE" AS DATE_,
	"CITY",
	sum("QTY" * "PRICE") OVER (PARTITION BY "CITY", "DATE") / 
	sum("QTY" * "PRICE") OVER (PARTITION BY "CITY") AS SUM_SALES_REL
FROM
    "window".sales
JOIN "window".goods USING ("ID_GOOD")
JOIN "window".shops USING ("SHOPNUMBER")
WHERE
	"CATEGORY" = 'ЧИСТОТА'
ORDER BY "CITY"

-- 3

WITH temp_table AS (SELECT
    "DATE" as DATE_,
    "SHOPNUMBER",
    "ID_GOOD",
    row_number() OVER (PARTITION BY "SHOPNUMBER", "DATE") AS rating_in_section
    FROM "window".sales
    JOIN "window".goods g
    USING ("ID_GOOD")
    ORDER BY "SHOPNUMBER", "DATE", rating_in_section
)
SELECT
    DATE_,
    "SHOPNUMBER",
    "ID_GOOD"
FROM temp_table
WHERE rating_in_section <= 3

-- 4

SELECT
    "DATE" AS DATE_,
    "SHOPNUMBER",
    "CATEGORY",
	lag(
	    sum("QTY" * "PRICE")) OVER (PARTITION BY "SHOPNUMBER", "CATEGORY" ORDER BY "DATE"
	) AS PREV_SALES
FROM
	"window".sales
JOIN "window".shops
		USING ("SHOPNUMBER")
JOIN "window".goods g
		USING ("ID_GOOD")
WHERE
	"CITY" = 'СПб'
GROUP BY
    "DATE", "SHOPNUMBER", "CATEGORY"
ORDER BY 
    "SHOPNUMBER", "CATEGORY", "DATE";