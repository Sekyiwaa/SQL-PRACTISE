SELECT DISTINCT cust_id, customers.first_name, FIRST_VALUE(total_order_cost) OVER (PARTITION BY cust_id ORDER BY total_order_cost) AS lowest_price_per_group
FROM orders
JOIN customers ON customers.id = orders.cust_id;