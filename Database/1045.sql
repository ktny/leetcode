SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    ARRAY_AGG(DISTINCT product_key) @ > (
        SELECT
            ARRAY_AGG(product_key)
        FROM
            Product
    );

-- SELECT
--     customer_id
-- FROM
--     Customer
-- GROUP BY
--     customer_id
-- HAVING
--     count(DISTINCT product_key) = (
--         SELECT
--             count(product_key)
--         FROM
--             Product
--     );
