SELECT
    (
        SELECT
            DISTINCT salary SecondHighestSalary
        FROM
            Employee
        ORDER BY
            salary DESC OFFSET 1
        LIMIT
            1;

);

-- SELECT
--     lead(salary, 1, NULL) over(
--         ORDER BY
--             salary DESC
--     ) AS SecondHighestSalary
-- FROM
--     Employee
-- GROUP BY
--     salary
-- LIMIT
--     1;
