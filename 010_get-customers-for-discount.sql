-- Get Customers
-- who bought products for more that 50000 UAH
-- in current month

SELECT c.id, SUM(o.total) AS month_revenue
FROM customers AS c
INNER JOIN orders AS o
	ON c.id = o.customer_id
WHERE 
	EXTRACT(MONTH FROM o.purchase_date) = EXTRACT(MONTH FROM NOW())
	AND EXTRACT(YEAR FROM o.purchase_date) = EXTRACT(YEAR FROM NOW())
GROUP BY c.id
HAVING SUM(o.total) > 50000;