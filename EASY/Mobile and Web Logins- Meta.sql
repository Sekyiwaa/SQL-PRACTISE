SELECT m.date,
       COUNT(DISTINCT m.user_id) AS n_users
FROM mobile_logs m JOIN web_logs w ON m.user_id = w.user_id AND m.date = w.date
GROUP BY m.date;