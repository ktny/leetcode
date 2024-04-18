SELECT
    l.name
FROM
    Employee AS l
    JOIN Employee AS r ON l.id = r.managerId
GROUP BY
    l.id,
    l.name
HAVING
    count(r.managerId) >= 5;
