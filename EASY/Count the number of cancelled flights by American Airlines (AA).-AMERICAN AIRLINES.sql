SELECT COUNT(*) AS n_flights
FROM us_flights
WHERE unique_carrier = 'AA' AND cancelled = 1