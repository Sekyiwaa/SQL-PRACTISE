WITH cte1 AS
  (SELECT hire_date AS dateaq,
          1 AS COUNT
   FROM uber_employees
   UNION ALL SELECT termination_date,
                    -1 AS COUNT
   FROM uber_employees
   WHERE termination_date IS NOT NULL ),
     sum_cte AS
  (SELECT dateaq,
          sum(COUNT) OVER (
                           ORDER BY dateaq) AS maxemp
   FROM cte1) ,
     result_cte AS
  (SELECT a.id,
          b.dateaq,
          b.maxemp,
          ROW_NUMBER() OVER (PARTITION BY a.id
                             ORDER BY b.maxemp DESC, b.dateaq ASC) AS rnk
   FROM uber_employees a
   JOIN sum_cte b ON b.dateaq BETWEEN a.hire_date AND COALESCE(a.termination_date, CURRENT_DATE()))
SELECT id,
       maxemp,
       dateaq
FROM result_cte
WHERE rnk = 1;