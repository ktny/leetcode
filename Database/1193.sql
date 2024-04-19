SELECT
    to_char(trans_date, 'YYYY-MM') AS MONTH,
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
    transactions
GROUP BY
    MONTH,
    country;
