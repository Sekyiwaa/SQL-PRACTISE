WITH avg_duration AS (
    SELECT location
        , AVG(DATEDIFF(signup_stop_date, signup_start_date)) AS avg_signup_duration
    FROM signups
    GROUP BY location
)
, avg_amt AS (
    SELECT s.location
        , AVG(t.amt) AS avg_transaction_amount
    FROM signups s
    LEFT JOIN transactions t
    ON s.signup_id = t.signup_id
    GROUP BY s.location
)
SELECT d.location
    , d.avg_signup_duration
    , a.avg_transaction_amount
    , a.avg_transaction_amount / d.avg_signup_duration AS ratio
FROM avg_duration d
JOIN avg_amt a
ON d.location = a.location
ORDER BY ratio DESC;


# AVG(TIMESTAMPDIFF(DAY, signup_start_date, signup_stop_date))  AS avg_signup_duration
# AVG(DATEDIFF(signup_stop_date, signup_start_date)) AS avg_signup_duration