-- 1

SELECT
    seller_id,
    COUNT(category) AS total_categ,
    AVG(rating) AS avg_rating,
    SUM(revenue) AS total_revenue,
    CASE
        WHEN SUM(revenue) < 50000 THEN 'poor'
        WHEN SUM(revenue) > 50000 THEN 'rich'
    END AS seller_type
FROM public.sellers
WHERE category != 'Bedding'
GROUP BY seller_id
HAVING COUNT(category) > 1
ORDER BY seller_id;

-- 2

WITH sellers_mod AS (
    SELECT
        seller_id,
        COUNT(category) AS total_categ,
        AVG(rating) AS avg_rating,
        SUM(revenue) AS total_revenue,
        MIN(date_reg) as date_reg,
        MAX(delivery_days) - MIN(delivery_days) AS delivery_difference,
        CASE
            WHEN SUM(revenue) < 50000 THEN 'poor'
            WHEN SUM(revenue) > 50000 THEN 'rich'
        END AS seller_type
    FROM public.sellers
    WHERE category != 'Bedding'
    GROUP BY seller_id
    HAVING COUNT(category) > 1
    ORDER BY seller_id
),
avg_time AS (
    SELECT max(delivery_difference) FROM sellers_mod
)
SELECT 
    seller_id,
    (('2024-09-11'::date - date_reg) / 30) as month_from_registration,
    (SELECT avg_time.max FROM avg_time) AS max_delivery_difference
FROM sellers_mod
WHERE seller_type = 'poor' 

-- 3 

WITH sellers_mod AS (
    SELECT
        seller_id,
        COUNT(category) AS total_categ,
        SUM(revenue) AS total_revenue,
        MIN(date_reg) as date_reg,
        ARRAY_AGG(category) AS categories
    FROM public.sellers
    WHERE EXTRACT(YEAR FROM date_reg) = 2022
    GROUP BY seller_id
    HAVING COUNT(category) = 2
)
SELECT 
    seller_id, 
    CONCAT(categories[1], ' - ', categories[2]) AS category_pair 
FROM sellers_mod
WHERE total_revenue > 75000