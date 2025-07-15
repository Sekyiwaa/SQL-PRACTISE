SELECT qb,
    SUM(`int`) AS most_interceptions
FROM qbstats_2015_2016
WHERE year = 2016
GROUP BY qb
ORDER BY SUM('int') DESC;