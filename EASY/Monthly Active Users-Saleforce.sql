SELECT account_id,COUNT(DISTINCT user_id) as user_count
FROM sf_events
WHERE MONTH(date)= 1
AND YEAR(date)= 2021
GROUP BY account_id;