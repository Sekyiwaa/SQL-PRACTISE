with cte as (select date,sum(consumption) as max_t
from
    (select * from fb_eu_energy
    UNION ALL
    select *from fb_asia_energy
    UNION ALL
    select * from fb_na_energy) as data
group by date)
select * from cte
where max_t=(select max(max_t) from cte);
