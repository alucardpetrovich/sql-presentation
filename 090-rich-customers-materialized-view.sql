-- https://postgrespro.ru/docs/postgrespro/9.5/rules-materializedviews

-- Create materialized view, 
-- which will return customers
-- who bought products for more than 50000 in total

-- This young fella however gives us some optimization tweaks
CREATE MATERIALIZED VIEW rich_customers AS
   SELECT c.*, SUM(o.total) AS revenue
   FROM customers AS c
   INNER JOIN orders AS o
   	ON o.customer_id = c.id
   GROUP BY c.id
   HAVING SUM(o.total) > 50000;

-- That's why you'll see the difference between this
EXPLAIN SELECT c.*, SUM(o.total) AS revenue
   FROM customers AS c
   INNER JOIN orders AS o
   	ON o.customer_id = c.id
   GROUP BY c.id
   HAVING SUM(o.total) > 50000;

-- And this
SELECT * FROM rich_customers;

-- But bare in mind.
-- Materialized views could contain unrelevant data
-- you need to refresh data there by issuing 
-- REFRESH MATERIALIZED VIEW rich_customers;
-- command. Otherwise you'll get data on moment of creation
-- of the materialized view
