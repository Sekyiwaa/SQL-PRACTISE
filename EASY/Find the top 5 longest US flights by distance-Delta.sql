SELECT DISTINCT
    origin,
    dest,
    distance
FROM
    us_flights
ORDER BY distance DESC
LIMIT  5;