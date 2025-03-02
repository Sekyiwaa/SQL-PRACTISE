SELECT SUM(order_total) AS revenue
FROM amazon_sales
WHERE YEAR(order_date) =2021;