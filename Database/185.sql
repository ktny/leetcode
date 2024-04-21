WITH e AS (
    SELECT
        name,
        departmentId,
        salary,
        DENSE_RANK() over(
            PARTITION by departmentId
            ORDER BY
                salary DESC
        ) AS rank
    FROM
        Employee
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary
FROM
    e
    JOIN Department AS d ON e.departmentId = d.id
WHERE
    e.rank <= 3;
