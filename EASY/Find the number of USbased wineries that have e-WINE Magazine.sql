SELECT COUNT(DISTINCT winery) AS n_wineries
FROM winemag_p1
WHERE country = 'US' AND price >= 200;