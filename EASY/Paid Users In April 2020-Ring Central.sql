SELECT COUNT(DISTINCT user_id)
FROM rc_calls
WHERE date BETWEEN '2020-04-01' AND '2020-04-30'
AND user_id IN
    (SELECT user_id
    FROM rc_users
    WHERE status = 'paid')