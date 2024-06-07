SELECT 
    c.first_name,
    c.last_name,
    c.city,
    o.order_details
FROM
    customers as c
LEFT JOIN
    orders as o
ON 
    o.cust_id = c.id
ORDER BY 
    c.first_name,
    o.order_details ASC;