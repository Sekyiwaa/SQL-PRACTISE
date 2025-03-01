SELECT DISTINCT signup_id 
FROM transactions
WHERE MONTH(transaction_start_date) IN (4,5)