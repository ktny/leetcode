SELECT
    round(
        avg(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1
                ELSE 0
            END
        ) * 100.0,
        2
    ) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date) IN (
        SELECT
            customer_id,
            min(order_date)
        FROM
            Delivery
        GROUP BY
            customer_id
    );

-- WITH t1 AS (
--     SELECT
--         *,
--         CASE
--             WHEN order_date = min(order_date) over(
--                 PARTITION by customer_id
--                 ORDER BY
--                     order_date
--             ) THEN 1
--             ELSE 0
--         END AS is_first_delivery
--     FROM
--         Delivery
-- ),
-- t2 AS (
--     SELECT
--         *
--     FROM
--         t1
--     WHERE
--         is_first_delivery = 1
--         AND order_date = customer_pref_delivery_date
-- ),
-- MASTER AS (
--     SELECT
--         customer_id
--     FROM
--         Delivery
--     GROUP BY
--         customer_id
-- )
-- SELECT
--     round(
--         avg(
--             CASE
--                 WHEN is_first_delivery = 1 THEN 1
--                 ELSE 0
--             END
--         ) * 100.0,
--         2
--     ) AS immediate_percentage
-- FROM
--     MASTER
--     LEFT JOIN t2 USING (customer_id)
