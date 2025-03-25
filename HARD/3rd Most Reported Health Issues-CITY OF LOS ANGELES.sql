WITH cte AS(
SELECT 
    pe_description,
    COUNT(*),
    DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk FROM los_angeles_restaurant_health_inspections
WHERE REGEXP_LIKE(facility_name,'cafe|juice|tea')
GROUP BY 1)


select
    distinct facility_name
from 
    los_angeles_restaurant_health_inspections
WHERE REGEXP_LIKE(facility_name,'cafe|juice|tea')
    and
    pe_description in (select distinct pe_description from cte where rnk = 3)