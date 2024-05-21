SELECT
    SUM(CASE WHEN user1 != 1 AND user2 != 1 THEN 1 ELSE 0 END) 
FROM
    facebook_friends;