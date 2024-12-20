SELECT p.prod_sku_id,p.market_name
FROM
    fct_customer_sales f
RIGHT JOIN dim_product p ON f.prod_sku_id = p.prod_sku_id
WHERE f.prod_sku_id IS NULL