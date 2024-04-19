WITH tmp AS (
    SELECT
        product_id,
        min(year) AS first_year
    FROM
        sales
    GROUP BY
        product_id
)
SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM
    Sales AS s
    JOIN tmp USING (product_id)
WHERE
    s.year = tmp.first_year;
