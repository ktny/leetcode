SELECT
    user_id,
    round(
        avg(
            CASE
                WHEN ACTION = 'confirmed' THEN 1
                ELSE 0
            END
        ),
        2
    ) AS confirmation_rate
FROM
    Signups AS s
    LEFT JOIN Confirmations AS c USING (user_id)
GROUP BY
    user_id
