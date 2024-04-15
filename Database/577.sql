SELECT
    name,
    bonus
FROM
    Employee
    LEFT JOIN Bonus USING (empid)
WHERE
    bonus < 1000
    OR bonus IS NULL;
