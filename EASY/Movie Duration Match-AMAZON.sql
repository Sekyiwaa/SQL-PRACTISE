SELECT
    fs.flight_id,
    ec.movie_id,
    ec.duration AS movie_duration
FROM
    flight_schedule fs
JOIN
    entertainment_catalog ec ON ec.duration <= fs.flight_duration
WHERE
    fs.flight_id = 101
ORDER BY
    ec.duration;