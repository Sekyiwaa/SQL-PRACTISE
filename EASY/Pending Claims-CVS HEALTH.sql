SELECT COUNT(*) AS n_claims
FROM cvs_claims
WHERE date_accepted IS NULL AND
    date_rejected IS NULL AND
    MONTH(date_submitted) = 12 AND
    YEAR(date_submitted) = 2021
    