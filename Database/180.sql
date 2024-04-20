WITH r AS (
    SELECT
        generate_series(0, 1000) AS rownum
),
tmp AS (
    SELECT
        lag(num) over (
            ORDER BY
                r.rownum
        ) AS pre,
        l.num,
        lead(num) over (
            ORDER BY
                r.rownum
        ) AS next
    FROM
        r
        LEFT JOIN LOGS AS l ON r.rownum = l.id
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    tmp
WHERE
    pre = num
    AND num = next;
