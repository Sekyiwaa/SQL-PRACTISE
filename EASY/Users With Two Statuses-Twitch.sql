SELECT user_id
FROM twitch_sessions
GROUP BY user_id
HAVING COUNT(DISTINCT session_type)= 2