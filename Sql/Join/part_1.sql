-- 1.1

SELECT                                                         
	name,                               
	c.customer_id, 
	MAX(shipment_date - order_date) AS delivery_time
FROM public.customers c                 
JOIN orders o                           
ON o.customer_id = c.customer_id        
GROUP BY c.customer_id, name
ORDER BY delivery_time DESC 
LIMIT 1;

-- 1.2

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS order_count,
        AVG(shipment_date - order_date) AS avg_delivery_time,
        SUM(order_ammount) AS total_order_sum
    FROM orders
    GROUP BY customer_id
),
max_orders AS (
    SELECT MAX(order_count) AS max_order_count
    FROM customer_orders
)
SELECT
    co.customer_id,
    co.order_count,
    co.avg_delivery_time,
    co.total_order_sum
FROM customer_orders co
JOIN max_orders mo ON co.order_count = mo.max_order_count
ORDER BY co.total_order_sum DESC;

-- 1.3
SELECT
    o.customer_id,
    c.name AS customer_name,
    COUNT(CASE WHEN o.shipment_date > o.order_date + INTERVAL '5 days' THEN 1 END) AS delayed_count,
    COUNT(CASE WHEN o.order_status = 'Cancel' THEN 1 END) AS canceled_count,
    SUM(o.order_ammount) AS total_order_sum
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id 
GROUP BY o.customer_id, c.name
HAVING COUNT(CASE WHEN o.shipment_date > o.order_date + INTERVAL '5 days' THEN 1 END) > 0
    OR COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) > 0
ORDER BY total_order_sum DESC;