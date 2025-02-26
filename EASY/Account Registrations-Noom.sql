SELECT DATE_FORMAT(started_at, '%Y-%m') AS started_month,
COUNT(*) AS n_registrations
FROM noom_signups
GROUP BY 1