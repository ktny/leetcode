SELECT
    s.student_id,
    s.student_name,
    su.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    Students AS s
    CROSS JOIN subjects AS su
    LEFT JOIN Examinations AS e ON s.student_id = e.student_id
    AND su.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    su.subject_name;

-- WITH t1 AS (
--     SELECT
--         s.student_id,
--         s.student_name,
--         su.subject_name
--     FROM
--         Students AS s
--         CROSS JOIN Subjects AS su
-- )
-- SELECT
--     student_id,
--     student_name,
--     subject_name,
--     count(Examinations.subject_name) AS attended_exams
-- FROM
--     t1
--     LEFT JOIN Examinations USING (student_id, subject_name)
-- GROUP BY
--     student_id,
--     student_name,
--     subject_name
-- ORDER BY
--     student_id,
--     subject_name;
