SELECT DISTINCT user_id
FROM rc_users
WHERE status = 'free'
  AND user_id NOT IN
    (SELECT user_id
     FROM rc_calls
     WHERE date BETWEEN '2020-04-01' AND '2020-04-30'
     );