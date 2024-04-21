WITH tmp AS (
    SELECT
        person_name,
        SUM(weight) OVER(
            ORDER BY
                turn
        ) AS cumsum_weight
    FROM
        Queue
    ORDER BY
        turn
)
SELECT
    person_name
FROM
    tmp
WHERE
    cumsum_weight = (
        SELECT
            MAX(cumsum_weight)
        FROM
            tmp
        WHERE
            cumsum_weight <= 1000
    )
