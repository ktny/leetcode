(
    SELECT
        'Low Salary' AS category,
        COALESCE(count(income), 0) AS accounts_count
    FROM
        Accounts
    WHERE
        income < 20000
)
UNION
(
    SELECT
        'Average Salary' AS category,
        COALESCE(count(income), 0) AS accounts_count
    FROM
        Accounts
    WHERE
        income >= 20000
        AND income <= 50000
)
UNION
(
    SELECT
        'High Salary' AS category,
        COALESCE(count(income), 0) AS accounts_count
    FROM
        Accounts
    WHERE
        income > 50000
);

-- WITH tmp AS (
--     SELECT
--         *,
--         CASE
--             WHEN income < 20000 THEN 'Low Salary'
--             WHEN income <= 50000 THEN 'Average Salary'
--             ELSE 'High Salary'
--         END AS category
--     FROM
--         Accounts
-- )
-- SELECT
--     category,
--     count(income) AS accounts_count
-- FROM
--     tmp
--     RIGHT JOIN (
--         (
--             SELECT
--                 'Low Salary' AS category
--         )
--         UNION
--         (
--             SELECT
--                 'Average Salary' AS category
--         )
--         UNION
--         (
--             SELECT
--                 'High Salary' AS category
--         )
--     ) USING (category)
-- GROUP BY
--     category
