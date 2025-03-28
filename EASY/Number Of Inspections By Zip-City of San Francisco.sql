select year(inspection_date) as year,
sum(case when month(inspection_date)=1 then 1 else 0 end) as january,
sum(case when month(inspection_date)=5 then 1 else 0 end) as may,
sum(case when month(inspection_date)=11 then 1 else 0 end) as november
from sf_restaurant_health_violations
where business_postal_code=94102
group by year