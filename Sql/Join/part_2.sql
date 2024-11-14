WITH top_category AS (
    SELECT 
        p.product_category,
        sum(order_ammount) AS total_sales
    FROM "join".orders o
    JOIN "join".products p
    ON o.product_id = p.product_id 
    GROUP BY p.product_category
),
top_product_per_category AS (
    -- DISTINCT ON оставляет только одну запись с максимальной суммой продаж
    -- т.к. дальше идет ORDER BY product_category, total_sum DESC
    SELECT DISTINCT ON (ms.product_category)
        ms.product_category,
        ms.product_name,
        ms.total_sum
    FROM (
        SELECT
            p.product_category,
            p.product_name,
            SUM(o.order_ammount) AS total_sum
        FROM "join".orders o
        JOIN "join".products p ON p.product_id = o.product_id
        GROUP BY p.product_category, p.product_name
    ) AS ms
    ORDER BY 
        ms.product_category, ms.total_sum DESC
)
SELECT
    tc.product_category,
    total_sales AS category_sales,
    product_name AS top_product_name,
    total_sum AS top_product_sales
FROM top_category tc 
LEFT JOIN top_product_per_category tp
ON tc.product_category = tp.product_category
ORDER BY category_sales DESC
-- LIMIT 1