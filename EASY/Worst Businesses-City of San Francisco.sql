WITH violations_by_year AS
  (SELECT business_name,
          EXTRACT(YEAR
                  FROM inspection_date) AS YEAR,
          COUNT(*) AS n_violations
   FROM sf_restaurant_health_violations
   WHERE violation_id IS NOT NULL
   GROUP BY business_name,
            YEAR),
     ranked_violations AS
  (SELECT business_name,
          YEAR,
          n_violations,
          ROW_NUMBER() OVER (PARTITION BY YEAR
                             ORDER BY n_violations DESC) AS yearly_position
   FROM violations_by_year)
SELECT YEAR,
       business_name,
       n_violations AS violation_count
FROM ranked_violations
WHERE yearly_position = 1;