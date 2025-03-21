SELECT service_name,
    status_of_order,
    SUM(number_of_orders)  AS orders
FROM 
    uber_orders
GROUP BY 
    service_name,
    status_of_order