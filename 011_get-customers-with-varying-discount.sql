-- Get Customers
-- who are eligible for discount
-- because of purchases in this month
-- and their corresponding discounts

SELECT
	c.id,
	CASE
    WHEN SUM(o.total) > 10000 AND SUM(o.total) < 30000 THEN 10
    WHEN SUM(o.total) > 30001 AND SUM(o.total) < 45000 THEN 15
    WHEN SUM(o.total) > 45001 AND SUM(o.total) < 60000 THEN 20
		WHEN SUM(o.total) > 60001 THEN 25
	END AS discount,
  SUM(o.total) AS month_revenue
FROM customers AS c
INNER JOIN orders AS o
	ON c.id = o.customer_id
WHERE 
	EXTRACT(MONTH FROM o.purchase_date) = EXTRACT(MONTH FROM NOW())
	AND EXTRACT(YEAR FROM o.purchase_date) = EXTRACT(YEAR FROM NOW())
GROUP BY c.id
HAVING SUM(o.total) > 10000;