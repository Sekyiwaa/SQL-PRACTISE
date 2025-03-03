SELECT id_user, AVG(n_searches) AS n_average_searches
FROM airbnb_searches
GROUP BY
    id_user