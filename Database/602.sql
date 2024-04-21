WITH t1 AS (
    (
        SELECT
            requester_id AS id,
            count(accepter_id)
        FROM
            RequestAccepted
        GROUP BY
            requester_id
    )
    UNION
    ALL (
        SELECT
            accepter_id AS id,
            count(requester_id)
        FROM
            RequestAccepted
        GROUP BY
            accepter_id
    )
)
SELECT
    id,
    sum(count) AS num
FROM
    t1
GROUP BY
    id
ORDER BY
    num DESC
LIMIT
    1
