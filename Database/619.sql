WITH tmp AS (
    SELECT
        num,
        COUNT(num) AS count
    FROM
        MyNumbers
    GROUP BY
        num
)
SELECT
    MAX(num) AS num
FROM
    tmp
WHERE
    count = 1;
