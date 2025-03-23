SELECT t.`month`,
       AVG(t.monthly_revenue) OVER(
                                   ORDER BY t.`month` ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS avg_revenue
FROM
  (SELECT DATE_FORMAT(created_at, '%Y-%m') AS MONTH,
          sum(purchase_amt) AS monthly_revenue
   FROM amazon_purchases
   WHERE purchase_amt>0
   GROUP BY DATE_FORMAT(created_at, '%Y-%m')
   ORDER BY DATE_FORMAT(created_at, '%Y-%m')) t
ORDER BY t.`month` ASC