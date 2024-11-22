SELECT 
    transaction_id
FROM 
    boi_transactions
WHERE 
    DATE_FORMAT(time_stamp, '%a') IN ('Sat', 'Sun')
    OR DATE (time_stamp) IN ('2022-12-25', '2022-12-26')
    OR DATE_FORMAT(time_stamp, '%H:%i') <'09:00'
    OR DATE_FORMAT(time_stamp, '%H:%I') > '16:00'