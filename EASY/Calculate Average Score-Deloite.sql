SELECT project_id,
    AVG(score) AS average_score
FROM project_data
GROUP BY project_id
HAVING COUNT(DISTINCT team_member_id) >1