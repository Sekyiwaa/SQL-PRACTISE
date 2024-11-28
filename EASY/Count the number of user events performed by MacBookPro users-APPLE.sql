SELECT 
    event_name,
    COUNT(*) AS n_events
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY n_events DESC