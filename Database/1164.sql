WITH tmp AS (
    SELECT
        product_id,
        new_price
    FROM
        Products
    WHERE
        (product_id, change_date) IN (
            SELECT
                product_id,
                max(change_date)
            FROM
                Products
            WHERE
                change_date <= '2019-08-16'
            GROUP BY
                product_id
        )
)
SELECT
    product_id,
    COALESCE(tmp.new_price, 10) AS price
FROM
    Products
    LEFT JOIN tmp USING (product_id)
GROUP BY
    product_id,
    tmp.new_price;
