SELECT 
    guest_id,
    RANK() OVER (ORDER BY age DESC) AS `rank`
FROM
    airbnb_guests
