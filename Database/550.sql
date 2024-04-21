SELECT
    round(
        count(a1.player_id) :: numeric / (
            SELECT
                count(DISTINCT player_id)
            FROM
                Activity
        ),
        2
    ) AS fraction
FROM
    Activity AS a1
WHERE
    (
        a1.player_id,
        a1.event_date - INTERVAL '1 day'
    ) IN (
        SELECT
            player_id,
            min(event_date)
        FROM
            Activity
        GROUP BY
            player_id
    );

-- SELECT
--     round(
--         avg(
--             CASE
--                 WHEN a2.event_date IS NOT NULL THEN 1
--                 ELSE 0
--             END
--         ),
--         2
--     ) AS fraction
-- FROM
--     Activity AS a1
--     LEFT JOIN Activity AS a2 ON a1.player_id = a2.player_id
--     AND a1.event_date = a2.event_date - 1
-- WHERE
--     (a1.player_id, a1.event_date) IN (
--         SELECT
--             player_id,
--             min(event_date)
--         FROM
--             Activity
--         GROUP BY
--             player_id
--     )
