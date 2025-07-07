SELECT COUNT(DISTINCT h.host_id)
FROM airbnb_hosts AS h
JOIN airbnb_apartments AS a
ON h.host_id = a.host_id
AND h.nationality <> a.country
