WITH filtered_orders AS (
    SELECT 
        DATE_TRUNC('week', week::date) AS week_start,
        quantity 
    FROM 
        orders_analysis
    WHERE 
        EXTRACT(QUARTER FROM week::date) = 1 AND
        EXTRACT(YEAR FROM week::date) = 2023
)
SELECT 
    week_start AS week, 
    SUM(quantity) AS total_quantity
FROM 
    filtered_orders
GROUP BY 
    week_start
ORDER BY 
    week_start;