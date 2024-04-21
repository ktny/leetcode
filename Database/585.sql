WITH tmp AS (
    SELECT
        tiv_2015,
        tiv_2016
    FROM
        Insurance
    WHERE
        pid NOT IN (
            SELECT
                DISTINCT i1.pid
            FROM
                Insurance AS i1
                JOIN Insurance AS i2 ON i1.pid != i2.pid
                AND i1.lat = i2.lat
                AND i1.lon = i2.lon
        )
)
SELECT
    ROUND(SUM(tiv_2016) :: numeric, 2) AS tiv_2016
FROM
    tmp
WHERE
    tmp.tiv_2015 IN (
        SELECT
            tiv_2015
        FROM
            Insurance
        GROUP BY
            tiv_2015
        HAVING
            COUNT(*) > 1
    )
