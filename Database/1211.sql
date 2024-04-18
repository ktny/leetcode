SELECT
    query_name,
    ROUND(AVG(rating :: numeric / position), 2) AS quality,
    ROUND(
        AVG(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name;

-- WITH t1 AS (
--     SELECT
--         query_name,
--         COUNT(rating) AS poor_query_count
--     FROM
--         Queries
--     WHERE
--         rating < 3
--     GROUP BY
--         query_name
-- )
-- SELECT
--     query_name,
--     ROUND(AVG(rating :: numeric / position), 2) AS quality,
--     ROUND(
--         COALESCE(poor_query_count, 0) * 100.0 / COUNT(*),
--         2
--     ) AS poor_query_percentage
-- FROM
--     Queries
--     LEFT JOIN t1 USING (query_name)
-- WHERE
--     query_name IS NOT NULL
-- GROUP BY
--     query_name,
--     poor_query_count;
