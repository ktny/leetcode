SELECT
    user_id,
    upper(
        substring(
            name
            FROM
                1 FOR 1
        )
    ) || lower(
        substring(
            name
            FROM
                2
        )
    ) AS name
FROM
    Users
ORDER BY
    user_id;
