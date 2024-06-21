with cte as (select media_type,sum(cost) as total,
rank() over(order by sum(cost)  desc) as rnk
from online_sales_promotions
group by media_type)
 
select media_type,total
from cte
where rnk <= 2;