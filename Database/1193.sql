WITH tmp AS (
    SELECT
        *,
        left(trans_date :: text, 7) AS MONTH
    FROM
        Transactions
)
SELECT
    MONTH,
    country,
    sum(
        CASE
            WHEN state = 'approved' THEN 1
            ELSE 0
        END
    ) AS approved_count,
    count(*) AS trans_count,
    sum(amount) AS trans_total_amount,
    sum(
        CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM
    tmp
GROUP BY
    MONTH,
    country;
