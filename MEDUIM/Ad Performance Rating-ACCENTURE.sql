SELECT product_id,
       SUM(quantity) AS total_sold,
       CASE
           WHEN SUM(quantity) >= 30  THEN 'Outstanding'
           WHEN SUM(quantity) BETWEEN 20 AND 29 THEN 'Satisfactory'
           WHEN SUM(quantity) BETWEEN 10 AND 19 THEN 'Unsatisfactory'
           WHEN SUM(quantity) <= 9 THEN 'Poor'
       END AS ad_performance
FROM marketing_campaign
GROUP BY 1
ORDER BY 2 DESC;