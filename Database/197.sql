SELECT
    l.id
FROM
    Weather AS l
    JOIN Weather AS r ON l.recordDate = r.recordDate + 1
WHERE
    l.temperature > r.temperature;
