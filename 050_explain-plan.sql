-- https://postgrespro.ru/docs/postgrespro/9.5/using-explain

-- Check SELECT speed with range predicate on total column
EXPLAIN SELECT * FROM orders WHERE total > 500 AND total < 1000;

-- Check SELECT speed with equality predicate on total column
EXPLAIN SELECT * FROM orders WHERE total = 500;