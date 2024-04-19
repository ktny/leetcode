SELECT
    CASE
        WHEN id % 2 = 0 THEN lag(id, 1, id) over (
            ORDER BY
                id
        )
        ELSE lead(id, 1, id) over (
            ORDER BY
                id
        )
    END AS id,
    student
FROM
    seat
ORDER BY
    id;
