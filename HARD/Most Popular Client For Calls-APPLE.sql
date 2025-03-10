WITH cte AS
  (SELECT user_id,
          100 * (sum(if(event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent'), 1, 0))/count(*)) AS percentage
   FROM fact_events
   GROUP BY 1
   HAVING percentage >= 50),
     cte2 AS
  (SELECT client_id,
          count(*) AS cnt
   FROM fact_events
   WHERE user_id IN
       (SELECT DISTINCT user_id
        FROM cte)
   GROUP BY 1)
SELECT client_id
FROM cte2
WHERE cnt =
    (SELECT max(cnt)
     FROM cte2)