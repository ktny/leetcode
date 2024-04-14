select distinct
    author_id as id
from
    Views
where
    author_id = viewer_id
order by
    id;

--
-- 別解
-- 自己結合用のテーブルを用意する
WITH
    r AS (
        SELECT
            article_id,
            viewer_id
        FROM
            Views
    ),
    -- 同じ記事で著者と読者が同じ（自分で自分の記事を読んでいる）著者を抜き出す
    t AS (
        SELECT
            l.article_id,
            l.author_id
        FROM
            Views AS l
            INNER JOIN r ON l.article_id = r.article_id
            AND l.author_id = r.viewer_id
    ) -- 重複を除いて出力
SELECT DISTINCT
    t.author_id AS id
FROM
    t
ORDER BY
    id;
