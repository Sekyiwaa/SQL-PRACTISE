SELECT c.id,
    c.first_name,
    SUM(total_order_cost)
FROM orders o 
JOIN customers c ON c.id = o.cust_id
GROUP BY c.id,
        c.first_name
ORDER BY c.first_name ASC