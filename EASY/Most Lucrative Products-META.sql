with cte as (select product_id ,sum(cost_in_dollars*units_sold ) as revenue,rank() 
over(order by sum(cost_in_dollars*units_sold )desc) as rnk
from online_orders
where MONTH(DATE) BETWEEN 1 AND 6
GROUP BY product_id)
select product_id,revenue
from cte
where rnk <=5;