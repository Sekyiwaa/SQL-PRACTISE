WITH cte AS
  (SELECT restaurant_id,
          MONTH(order_placed_time) AS MONTH,
          SUM(sales_amount) > 100 AS above_100
   FROM delivery_orders d
   JOIN order_value v ON d.delivery_id = v.delivery_id
   WHERE YEAR(order_placed_time) = 2021
     AND actual_delivery_time IS NOT NULL
   GROUP BY restaurant_id,
            MONTH)
SELECT MONTH,
       100.0 * avg(CASE
                       WHEN above_100 = TRUE THEN 1
                       ELSE 0
                   END) AS perc_over_100
FROM cte
GROUP BY MONTH;