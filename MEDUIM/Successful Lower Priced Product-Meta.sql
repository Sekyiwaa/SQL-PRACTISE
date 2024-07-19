WITH cte AS
  (SELECT product_id
  FROM online_orders
  GROUP BY product_id
  HAVING avg(cost_in_dollars) >= 3
  AND count(*) >= 2)
SELECT cte.product_id,
  brand_name
FROM cte
JOIN online_products ON cte.product_id = online_products.product_id
