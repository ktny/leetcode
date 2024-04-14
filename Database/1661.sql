SELECT
    l.machine_id,
    ROUND(
        AVG(r.timestamp - l.timestamp) :: numeric,
        3
    ) AS processing_time
FROM
    Activity AS l
    INNER JOIN Activity AS r ON l.machine_id = r.machine_id
    AND l.process_id = r.process_id
    AND l.activity_type = 'start'
    AND r.activity_type = 'end'
GROUP BY
    l.machine_id;
