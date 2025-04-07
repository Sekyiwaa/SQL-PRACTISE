SELECT account_id,
       COUNT(DISTINCT IF(record_date BETWEEN '2021-01-01' AND '2021-01-31', user_id, NULL)) / COUNT(DISTINCT IF(record_date BETWEEN '2020-12-01' AND '2020-12-31', user_id, NULL))  AS ratio
FROM sf_events
GROUP BY account_id