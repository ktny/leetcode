(
    SELECT
        name AS results
    FROM
        Users AS u
        JOIN MovieRating AS mr USING (user_id)
    GROUP BY
        name
    ORDER BY
        count(*) DESC,
        name
    LIMIT
        1
)
UNION
ALL (
    SELECT
        title AS results
    FROM
        Movies AS m
        JOIN MovieRating AS mr USING (movie_id)
    WHERE
        to_char(created_at, 'YYYY-MM') = '2020-02'
    GROUP BY
        title
    ORDER BY
        avg(rating) DESC,
        title
    LIMIT
        1
)
