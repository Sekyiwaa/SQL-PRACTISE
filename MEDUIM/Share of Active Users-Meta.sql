SELECT active_users/CAST(total_users AS FLOAT) AS active_users_share
FROM
  (SELECT COUNT(user_id) total_users,
          COUNT(CASE WHEN status = 'open' THEN 1 ELSE NULL END) AS active_users
   FROM fb_active_users
   WHERE country = 'USA') subq;