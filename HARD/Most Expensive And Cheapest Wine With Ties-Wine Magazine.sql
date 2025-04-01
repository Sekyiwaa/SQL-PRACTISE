WITH cte1 AS
  (SELECT region_1 AS region,
          variety,
          price
   FROM winemag_pd
   UNION ALL SELECT region_2 AS region,
                    variety,
                    price
   FROM winemag_pd),
     cte2 AS
  (SELECT *,
          RANK() OVER(PARTITION BY region
                      ORDER BY price DESC) AS expensive_rank,
          RANK() OVER(PARTITION BY region
                      ORDER BY price) AS cheap_rank
   FROM cte1
   WHERE region IS NOT NULL
     AND price IS NOT NULL ),
     expensive AS
  (SELECT DISTINCT region,
          variety as expensive_variety
   FROM cte2
   WHERE expensive_rank = 1),
   cheap as (SELECT DISTINCT region,
          variety as cheap_variety
   FROM cte2
   WHERE cheap_rank = 1)
SELECT a.region AS region,
       expensive_variety    AS most_expensive_variety,
       cheap_variety AS cheapest_variety
FROM expensive a JOIN cheap b ON a.region = b.region
ORDER BY region DESC;