SELECT
    COUNT(DISTINCT p.post_id) AS n_posts_with_a_like
FROM
    facebook_posts p
INNER JOIN
    facebook_reactions r 
ON
    p.post_id = r.post_id AND 
    r.reaction = 'like';