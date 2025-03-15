WITH first_days AS
  (SELECT player_id,
          MIN(login_date) AS first_day
   FROM players_logins
   GROUP BY player_id)
SELECT CAST(COUNT(DISTINCT first_days.player_id) AS DECIMAL)/
  (SELECT COUNT(DISTINCT player_id) AS total_users
   FROM players_logins) AS retention_rate
FROM first_days
JOIN players_logins ON first_days.player_id = players_logins.player_id
WHERE DATEDIFF(login_date, first_day) = 1