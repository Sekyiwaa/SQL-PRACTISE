SELECT jan.source_currency,
       jul.exchange_rate - jan.exchange_rate AS difference
FROM sf_exchange_rate jan
JOIN sf_exchange_rate jul ON jan.source_currency = jul.source_currency
WHERE jan.date = '2020-01-01'
  AND jul.date = '2020-07-01'