WITH base as (select 
    business_id,
    COUNT(*) AS violation_cnt,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
from sf_restaurant_health_violations
WHERE LOWER(risk_category) LIKE '%high risk%'
GROUP BY 1)

SELECT 
    sf.*
FROM 
    base b 
    JOIN sf_restaurant_health_violations sf 
ON 
    b.business_id = sf.business_id
WHERE rnk = 1