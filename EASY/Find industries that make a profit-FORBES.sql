SELECT
    industry,
    min(sales) AS min_sales,
    avg(profits) AS avg_profit
FROM
    forbes_global_2010_2014
GROUP BY 
    industry
HAVING 
    avg(profits) > 0
ORDER BY
    min_sales ASC