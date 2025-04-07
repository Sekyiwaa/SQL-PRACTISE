WITH industries AS
  (SELECT industry,
          avg(sales) AS sales
   FROM forbes_global_2010_2014
   GROUP BY industry)
SELECT industry
FROM industries
WHERE sales =
    (SELECT min(sales)
     FROM industries);