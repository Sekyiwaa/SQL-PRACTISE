with q3_orders as
    (select territory_id, sum(order_value) q3_sum
    from fct_customer_sales s
    join map_customer_territory t
    using(cust_id)
    where (order_date between '2021-07-01' and '2021-09-30') 
    group by territory_id),
    
q4_orders as
    (select territory_id, sum(order_value) q4_sum
    from fct_customer_sales s
    join map_customer_territory t
    using(cust_id)
    where (order_date between '2021-10-01' and '2021-12-31') 
    group by territory_id)
    
select territory_id, ((q4_sum - q3_sum)/q3_sum) *100 sales_growth
from q3_orders
join q4_orders
using (territory_id)
where q3_sum != 0 and q4_sum !=0