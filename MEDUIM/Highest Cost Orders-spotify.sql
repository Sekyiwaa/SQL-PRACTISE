WITH daily_sums AS (
  SELECT c.first_name,
         o.order_date,
         SUM(o.total_order_cost) AS total_daily_cost
  FROM orders o
  JOIN customers c ON o.cust_id = c.id
  WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
  GROUP BY c.first_name, o.order_date
),
ranked_sums AS (
  SELECT first_name,
         order_date,
         total_daily_cost,
         RANK() OVER (ORDER BY total_daily_cost DESC) AS rnk
  FROM daily_sums
)
SELECT first_name,
       order_date,
       total_daily_cost AS max_cost
FROM ranked_sums
WHERE rnk = 1;