SELECT
    contest_id,
    ROUND(
        COUNT(user_id) * 100.0 / (
            SELECT
                count(*)
            FROM
                users
        ),
        2
    ) AS percentage
FROM
    Register
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id;
