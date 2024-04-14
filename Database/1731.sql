SELECT
    l.employee_id,
    l.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM
    Employees AS l
    INNER JOIN Employees AS r ON l.employee_id = r.reports_to
GROUP BY
    l.employee_id,
    l.name
ORDER BY
    l.employee_id;
