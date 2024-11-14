WITH query_windows AS (
    SELECT 
        searchid, 
        "year", 
        "month", 
        "day", 
        userid, 
        ts, 
        devicetype, 
        deviceid, 
        query,
        lead(query) OVER w AS next_query,
        CASE
            WHEN lead(query) OVER w ISNULL THEN 1
            WHEN (lead(ts) OVER w - ts) > 180 THEN 1
            WHEN length(lead(query) OVER w) < length(query) AND (lead(ts) OVER w - ts) > 60  THEN 2
            ELSE 0
        END AS is_final
    FROM "window".query
    WINDOW w AS (PARTITION BY "userid", "deviceid" ORDER BY ts)
)
SELECT *
FROM query_windows
WHERE is_final IN (1,2)
AND devicetype = 'android'