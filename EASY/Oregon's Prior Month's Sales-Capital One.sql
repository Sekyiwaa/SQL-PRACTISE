SELECT 
    SUM(cost_in_dollars * units_sold) AS total_sales
FROM 
    online_orders as o 
INNER JOIN
    online_customers as c
ON o.customer_id = c.id 
WHERE MONTH(date)= 4
AND c.state = 'Oregon';