WITH customer_summary AS
  (SELECT st.store_brand,
          tr.customer_id,
          COUNT(DISTINCT tr.transaction_id) AS total_transactions,
          SUM(tr.sales) AS total_sales,
          SUM(tr.sales) / COUNT(DISTINCT tr.transaction_id) AS avg_basket_size
   FROM wfm_transactions tr
   INNER JOIN wfm_stores st ON tr.store_id = st.store_id
   WHERE YEAR(tr.transaction_date) = 2017
   GROUP BY st.store_brand,
            tr.customer_id),
     segmented_customers AS
  (SELECT *,
          CASE
              WHEN avg_basket_size > 30 THEN 'High'
              WHEN avg_basket_size BETWEEN 20 AND 30 THEN 'Medium'
              ELSE 'Low'
          END AS SEGMENT
   FROM customer_summary)
SELECT store_brand AS brand,
       SEGMENT,
       COUNT(DISTINCT customer_id) AS number_customers,
       SUM(total_transactions) AS total_transactions,
       SUM(total_sales) AS total_sales,
       SUM(total_sales) / SUM(total_transactions) AS avg_basket_size
FROM segmented_customers
GROUP BY store_brand,
         SEGMENT
ORDER BY store_brand,
         SEGMENT;