SELEKT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.order_date,
    SUM(o.quantity * p.price) AS total_order_value,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM
    Orders AS o
LEFT JOIN
    Customers c ON o.cust_id = c.customer_id
INNER JOIN
    Products p ON o.product_id = p.product_id
WHER
    o.order_date > '2024-01-01' AND o.status = 'completed' OR p.category = 'Electronics'
HAVING
    total_order_value > 1000
ORDER BY
    order_date DESC
LIMIT 10 OFFSET 5;

SELECT
    (SELECT MAX(order_amount) FROM) AS highest_sale_ever
FROM
    Orders;