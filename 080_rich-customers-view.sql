-- https://postgrespro.ru/docs/postgrespro/9.5/sql-createview

-- Create view, 
-- which will return customers
-- who bought products for more than 50000 in total

CREATE VIEW rich_customers AS
    SELECT c.*, SUM(o.total) AS revenue
    FROM customers AS c
    INNER JOIN orders AS o
    	ON o.customer_id = c.id
    GROUP BY c.id
    HAVING SUM(o.total) > 50000;

-- Use view created above
SELECT * FROM rich_customers;

-- Bear in mind that views is just syntax sugar, they don't give you any sort of optimization

-- Insert explain queries below to SQL console and you'll see that there is speed difference

-- Between issuing reqular select
EXPLAIN CREATE VIEW rich_customers AS
    SELECT c.*, SUM(o.total) AS revenue
    FROM customers AS c
    INNER JOIN orders AS o
    	ON o.customer_id = c.id
    GROUP BY c.id
    HAVING SUM(o.total) > 50000;

-- And quering view
EXPLAIN SELECT * FROM rich_customers;
