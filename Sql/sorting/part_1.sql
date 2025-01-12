-- 1

SELECT 
    city,
    CASE
        WHEN age BETWEEN 0 AND 20 THEN 'young'
        WHEN age BETWEEN 21 AND 49 THEN 'adult'
        ELSE 'old'
    END AS age_category,
    COUNT(id) AS customer_count
FROM public.users
GROUP BY city, age_category
ORDER BY city, customer_count DESC;

-- 2

SELECT 
    category,
    ROUND(AVG(price), 2) AS avg_price
FROM public.products
WHERE 
    name LIKE '%Hair%' OR 
    name LIKE '%Home%'
GROUP BY category;