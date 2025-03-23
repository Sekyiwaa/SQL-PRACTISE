WITH cte AS
  (SELECT *,
          rank() over(PARTITION BY cust_id, state
                      ORDER BY timestamp) rnk
   FROM cust_tracking)
SELECT c1.cust_id,
       sum(time_to_sec(TIMEDIFF(c2.timestamp, c1.timestamp)))/3600 hour_diff
FROM cte c1
JOIN cte c2 ON c1.cust_id = c2.cust_id
AND c1.state != c2.state
AND c1.rnk = c2.rnk
WHERE c1.state = 1
  AND c2.state = 0
GROUP BY c1.cust_id