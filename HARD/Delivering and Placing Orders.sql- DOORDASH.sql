# Pearson's correlation coefficient
# p = E[XY] - E[X]E[Y]
#     --------------------------------------------
#     SQRT(E[X^2] - E[X]^2)* SQRT(E[Y^2] - E[Y]^2)

with cte as (
    select restaurant_id
    , avg(order_total) as x
    , avg(timestampdiff(minute, customer_placed_order_datetime, delivered_to_consumer_datetime)) as y
    from delivery_details
    group by 1
)
select (avg(x*y) - avg(x)*avg(y)) / (
    sqrt(avg(x*x) - power(avg(x), 2)) *
    sqrt(avg(y*y) - power(avg(y), 2))
) as corr
from cte