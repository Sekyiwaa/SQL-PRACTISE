SELECT
    cust_id,
    COUNT(*) as n_times
FROM dim_customer
GROUP BY
    cust_id
HAVING
   COUNT(*) > 1
