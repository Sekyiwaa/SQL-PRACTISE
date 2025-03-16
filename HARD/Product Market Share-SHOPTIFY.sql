WITH sales_per_brand_territory AS
  (SELECT prod_brand,
          territory_id,
          count(*) n_sales
   FROM fct_customer_sales s
   JOIN map_customer_territory t ON s.cust_id = t.cust_id
   JOIN dim_product p ON s.prod_sku_id = p.prod_sku_id
   WHERE YEAR(order_date) = 2021
     AND QUARTER(order_date) = 4
   GROUP BY prod_brand,
            territory_id)
SELECT territory_id,
       prod_brand,
       n_sales / SUM(n_sales) OVER(PARTITION BY territory_id) * 100 AS market_share
FROM sales_per_brand_territory