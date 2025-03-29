WITH january_sales AS
  (SELECT *
   FROM sales_data
   WHERE MONTH(sales_date) = 1
     AND YEAR(sales_date) = 2024),
     ranked_sales AS
  (SELECT *,
          DENSE_RANK() OVER (PARTITION BY product_category
                             ORDER BY total_sales DESC) AS sales_rank
   FROM january_sales)
SELECT product_category,
       seller_id,
       total_sales,
       market_place,
       sales_date
FROM ranked_sales
WHERE sales_rank <= 3
ORDER BY product_category,
         sales_rank;