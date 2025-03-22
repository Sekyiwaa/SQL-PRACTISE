SELECT year,
       current_year_host,
       prev_year_host,
       round(((current_year_host - prev_year_host)/(cast(prev_year_host AS decimal)))*100) estimated_growth
FROM
  (SELECT year,
          current_year_host,
          LAG(current_year_host, 1) OVER (ORDER BY year) AS prev_year_host
   FROM
     (SELECT YEAR(host_since) AS year,
             count(id) current_year_host
      FROM airbnb_search_details
      WHERE host_since IS NOT NULL
      GROUP BY YEAR(host_since)
      ORDER BY year) t1) t2