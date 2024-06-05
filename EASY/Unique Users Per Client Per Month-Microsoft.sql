SELECT  
    COUNT(DISTINCT user_id) as num_users,
    client_id,
    MONTH(time_id) as month
FROM
    fact_events
GROUP BY
    client_id,
     month;
     
 