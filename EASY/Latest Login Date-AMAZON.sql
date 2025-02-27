SELECT 
  player_id, 
  MAX(login_date) 
FROM 
  players_logins 
GROUP BY 
  player_id;
