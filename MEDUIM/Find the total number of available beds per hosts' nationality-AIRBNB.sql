SELECT h.nationality,
    SUM(a.n_beds) AS num_beds
FROM airbnb_apartments AS a
JOIN airbnb_hosts AS h
ON a.host_id = h.host_id
GROUP BY h.nationality
ORDER BY num_beds DESC
