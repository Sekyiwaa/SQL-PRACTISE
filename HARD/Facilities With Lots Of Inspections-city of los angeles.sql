WITH cte1_rk AS
  (SELECT facility_name,
          DATE_FORMAT(activity_date, '%Y') Yearx,
          COUNT(*),
          RANK() OVER (PARTITION BY FACILITY_NAME
                       ORDER BY count(*) DESC) RK
   FROM los_angeles_restaurant_health_inspections
   GROUP BY facility_name,
            DATE_FORMAT(activity_date, '%Y'))
SELECT facility_name
FROM
  (SELECT facility_name,
          Yearx,
          count(*) OVER (PARTITION BY FACILITY_NAME) AS n_rows
   FROM cte1_rk
   WHERE rk=1
   GROUP BY facility_name,
            Yearx) sq
WHERE n_rows =1
AND Yearx = '2017'