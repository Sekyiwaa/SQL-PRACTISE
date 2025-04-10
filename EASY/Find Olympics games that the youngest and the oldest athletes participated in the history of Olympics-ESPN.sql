SELECT
    main.*
FROM 
    olympics_athletes_events main
INNER JOIN
    (SELECT
        min(age) AS min_age,
        max(age) AS max_age
    FROM 
        olympics_athletes_events) tmp
ON 
    main.age = tmp.min_age OR 
    main.age = tmp.max_age;