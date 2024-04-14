SELECT
    l.employee_id
FROM
    Employees AS l
    LEFT JOIN Employees AS r ON l.manager_id = r.employee_id
WHERE
    l.salary < 30000
    AND l.manager_id IS NOT NULL
    AND r.employee_id IS NULL
ORDER BY
    l.employee_id;
