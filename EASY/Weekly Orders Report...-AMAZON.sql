WITH filtered_orders AS
  (SELECT stage_of_order,
          DATE_SUB(WEEK, INTERVAL (CASE
                                       WHEN WEEKDAY(WEEK) = 6 THEN 0
                                       ELSE WEEKDAY(WEEK) + 1
                                   END) DAY) AS week_start,
          quantity
   FROM orders_analysis
   WHERE QUARTER(WEEK) = 1
     AND YEAR(WEEK) = 2023)
SELECT DATE_FORMAT(week_start, '%Y-%m-%d') AS WEEK,
       SUM(quantity) AS total_quantity
FROM filtered_orders
GROUP BY week_start
ORDER BY week_start;