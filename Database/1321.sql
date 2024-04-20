WITH t1 AS (
    SELECT
        DISTINCT visited_on
    FROM
        Customer
    ORDER BY
        visited_on OFFSET 6
)
SELECT
    t1.visited_on,
    sum(t2.amount) AS amount,
    round(sum(t2.amount) / 7.0, 2) AS average_amount
FROM
    t1
    JOIN Customer AS t2 ON t2.visited_on BETWEEN t1.visited_on - 6
    AND t1.visited_on
GROUP BY
    t1.visited_on;

-- WITH t1 AS (
--     SELECT
--         visited_on,
--         sum(amount) AS amount
--     FROM
--         Customer
--     GROUP BY
--         visited_on
--     ORDER BY
--         visited_on
-- ),
-- t2 AS (
--     SELECT
--         generate_series(
--             '2019-01-01' :: date,
--             '2019-12-31' :: date,
--             '1 day' :: INTERVAL
--         ) AS date
-- )
-- SELECT
--     visited_on,
--     sum(amount) over(
--         ORDER BY
--             visited_on ROWS BETWEEN 6 preceding
--             AND current ROW
--     ) AS amount,
--     round(
--         avg(amount) over(
--             ORDER BY
--                 visited_on ROWS BETWEEN 6 preceding
--                 AND current ROW
--         ),
--         2
--     ) AS average_amount
-- FROM
--     t2
--     LEFT JOIN t1 ON t2.date = t1.visited_on
-- WHERE
--     visited_on IS NOT NULL
-- ORDER BY
--     visited_on OFFSET 6
