WITH cte AS (
  SELECT 
    la.facility_name,
    la.score,
    la.activity_date,
    a.max_date,
    LAG(la.activity_date, 1) OVER(PARTITION BY la.facility_name ORDER BY la.activity_date) AS prev_activity_date,
    DATEDIFF(la.activity_date, LAG(la.activity_date, 1) OVER(PARTITION BY la.facility_name ORDER BY la.activity_date)) AS number_of_days_between_high_scoring_inspections
  FROM 
    los_angeles_restaurant_health_inspections AS la
  JOIN (
    SELECT 
      facility_name,
      MAX(activity_date) AS max_date
    FROM 
      los_angeles_restaurant_health_inspections
    GROUP BY 
      facility_name
  ) a ON la.facility_name = a.facility_name
  WHERE 
    la.facility_name LIKE '%RESTAURANT%' 
    AND la.score = (
      SELECT MAX(score) 
      FROM los_angeles_restaurant_health_inspections
    )
)
SELECT 
  facility_name,
  score,
  activity_date,
  prev_activity_date,
  number_of_days_between_high_scoring_inspections
FROM 
  cte
WHERE 
  activity_date = max_date
ORDER BY 
  activity_date ASC;