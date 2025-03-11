with cte as (select restaurant_id, sum(order_total) as total,
percent_rank() over(order by sum(order_total)) as pct from doordash_delivery
where extract(year from customer_placed_order_datetime) = 2020 and 
extract(month from customer_placed_order_datetime) = 5
GROUP BY 1)


select restaurant_id, total as total_order
FROM cte
WHERE pct < 0.02