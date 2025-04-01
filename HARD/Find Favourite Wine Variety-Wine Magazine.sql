SELECT
    taster_name,
    variety
FROM
    (SELECT
        taster_name,
        variety,
        n_tastings,
        rank()
        OVER(PARTITION BY taster_name ORDER BY n_tastings DESC) AS rank_num
    FROM
        (SELECT 
            taster_name,
            variety,
            count(*) AS n_tastings
        FROM winemag_p2
        WHERE
            taster_name is not NULL
        GROUP BY
            taster_name,
            variety) base
    ) middle
WHERE
    middle.rank_num = 1;