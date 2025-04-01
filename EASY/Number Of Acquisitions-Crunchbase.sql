SELECT CONCAT(YEAR(acquired_at), '-Q', QUARTER(acquired_at)) AS acquired_quarter,
       COUNT(id) AS cnt_acq
FROM crunchbase_acquisitions
WHERE acquired_at IS NOT NULL
GROUP BY YEAR(acquired_at),
         QUARTER(acquired_at)
ORDER BY cnt_acq DESC;