select 

distinct a.brand_name,
consumable_count/count(distinct customer_id) *100
from
(select
distinct brand_name,
count(distinct case when p.product_family = 'CONSUMABLE' then customer_id end) as consumable_count
from online_orders o
join online_products p on o.product_id = p.product_id
group by 1)a, online_orders 
where consumable_count > 0
group by 1