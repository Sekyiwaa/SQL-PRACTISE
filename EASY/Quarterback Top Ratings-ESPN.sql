WITH cte AS
  (SELECT qb,
          rate,
          RANK() OVER(
                      ORDER BY rate DESC) rnk
   FROM qbstats_2015_2016
   WHERE rate IS NOT NULL)
SELECT qb,
       rate
FROM cte
WHERE rnk <= 10;