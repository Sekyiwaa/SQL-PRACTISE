WITH timetable AS(
                    (SELECT train_id,
                            arrival_time AS TIME,
                            1 AS mark
                     FROM train_arrivals
                     UNION ALL SELECT train_id,
                                      departure_time AS TIME,
                                      -1 AS mark
                     FROM train_departures)
                  ORDER BY TIME,
                           mark DESC) ,
     cumsum AS
  (SELECT *,
          sum(mark) OVER (
                          ORDER BY TIME,
                                   mark DESC) AS trains_at_same_time
   FROM timetable)
SELECT MAX(trains_at_same_time) AS min_platforms
FROM cumsum