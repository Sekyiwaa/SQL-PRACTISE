with both_regions as (
    select region_1 as region, variety, price
    from winemag_p1
        where region_1 is not null and price is not null
    union
    select region_2 as region, variety, price
    from winemag_p1
    where region_2 is not null and price is not null
),
cheapest as (
    select region, variety as cheapest_variety, dense_rank() over(partition by region order by price asc) rnk
    from both_regions
),
    expensivest as (
    select region, variety as expensivest_variety, dense_rank() over(partition by region order by price desc) rnk
    from both_regions
)
select c.region, c.cheapest_variety, e.expensivest_variety
from cheapest c
join expensivest e
on c.region = e.region
where c.rnk = 1 and e.rnk = 1
;