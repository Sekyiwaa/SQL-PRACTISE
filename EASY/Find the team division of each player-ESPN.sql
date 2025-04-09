SELECT
    players.player_name,
    teams.division
FROM
    college_football_teams teams 
INNER JOIN
    college_football_players players
ON
    teams.school_name = players.school_name;