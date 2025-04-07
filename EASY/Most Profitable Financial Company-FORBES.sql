WITH max_profits AS
  (SELECT MAX(profits) AS max_profit
   FROM forbes_global_2010_2014
   WHERE sector = 'Financials')
SELECT company,
       continent
FROM forbes_global_2010_2014
JOIN max_profits ON forbes_global_2010_2014.profits = max_profits.max_profit
WHERE sector = 'Financials';