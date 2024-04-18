SELECT
    product_name,
    sum(unit) AS unit
FROM
    Products AS p
    JOIN Orders AS o USING (product_id)
WHERE
    o.order_date BETWEEN '2020-02-01'
    AND '2020-02-29'
GROUP BY
    product_name
HAVING
    sum(unit) >= 100;
