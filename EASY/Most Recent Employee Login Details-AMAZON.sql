SELECT id, worker_id, date_format(login_timestamp, '%Y-%m-%d %H:%i:%s') as login_timestamp, ip_address, country, region, city, device_type
FROM
(SELECT *, 
rank() OVER (PARTITION BY worker_id ORDER BY login_timestamp DESC) as rnk
FROM worker_logins) a
WHERE rnk = 1
ORDER BY login_timestamp;