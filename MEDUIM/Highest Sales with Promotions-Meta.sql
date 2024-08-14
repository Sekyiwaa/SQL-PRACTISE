WITH cte AS (
    SELECT
        promotion_id
        , product_id
        , SUM(units_sold) AS total_units_sold
    FROM online_orders
    GROUP BY 1, 2
    ORDER BY 1, 2
)

, cte2 AS (
    SELECT
        promotion_id
        , product_id
        , total_units_sold
        , RANK() OVER(PARTITION BY promotion_id ORDER BY total_units_sold DESC) AS sales_rank
    FROM cte
)

SELECT
    promotion_id
    , product_id
    , total_units_sold
FROM cte2
WHERE sales_rank = 1