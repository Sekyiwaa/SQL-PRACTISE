WITH daily_total_earned AS
  (SELECT CAST(order_timestamp AS DATE) AS today,
          merchant_id,
          ROUND(SUM(total_amount_earned), 2) AS daily_total
   FROM order_details
   GROUP BY today,
            merchant_id),
     highest_totals AS
  (SELECT today,
          MAX(daily_total) AS highest_total
   FROM daily_total_earned
   GROUP BY today)
SELECT DATE_ADD(d.today, INTERVAL 1 DAY),
       name
FROM daily_total_earned d
JOIN highest_totals h ON d.today = h.today
AND d.daily_total = h.highest_total
JOIN merchant_details ON merchant_details.id = d.merchant_id;