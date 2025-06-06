SELECT
    product_name, brand_name, price, rating
FROM
    innerwear_amazon_com
WHERE
    (product_name, mrp) NOT IN
        (SELECT DISTINCT
            product_name,
            mrp
        FROM
            (
                SELECT product_name,mrp
                FROM innerwear_macys_com
                    UNION ALL
                SELECT product_name,mrp FROM innerwear_topshop_com
            ) as mha
        );