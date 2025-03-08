SELECT day_of_week,
    COUNT(category) AS n_occurences
FROM sf_crime_incidents_2014_01
GROUP BY day_of_week
ORDER BY n_occurences DESC