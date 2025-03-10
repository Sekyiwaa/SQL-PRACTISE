SELECT origin,
       destination,
       min(cost)
FROM
  (WITH connections AS
     (SELECT f0.origin origin0,
             f0.destination destination0,
             f0.cost cost0,
             f1.origin origin1,
             f1.destination destination1,
             f1.cost cost1,
             f2.origin origin2,
             f2.destination destination2,
             f2.cost cost2
      FROM da_flights f0
      LEFT JOIN da_flights f1 ON f0.destination = f1.origin
      LEFT JOIN da_flights f2 ON f1.destination = f2.origin) 
  SELECT origin0 AS origin,
         destination0 AS destination,
         cost0 AS cost
   FROM connections
   UNION ALL SELECT origin0 AS origin,
                    destination1 AS destination,
                    cost0+cost1 AS cost
   FROM connections
   UNION ALL SELECT origin0 AS origin,
                    destination2 AS destination,
                    cost0+cost1+cost2 AS cost
   FROM connections) list
WHERE destination IS NOT NULL
  AND cost IS NOT NULL
GROUP BY origin,
         destination;