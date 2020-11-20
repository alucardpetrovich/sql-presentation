-- In order to set isolation level start transaction in the following way
-- START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Isolation levels in posgres:
-- - READ UNCOMMITTED
-- - READ COMMITTED      <---- This is a default isolation level in postgres
-- - REPEATABLE READ
-- - SERIALIZABLE

-- COMMITED Transaction
START TRANSACTION;
UPDATE orders SET total = total + 10 WHERE id = 1;
UPDATE products SET show_on_website = false WHERE id = 10;
COMMIT;

-- Aborted because of error
START TRANSACTION;
UPDATE orders SET total = total + 10 WHERE id = 1;
hello, I am error;
UPDATE products SET show_on_website = false WHERE id = 10;
COMMIT;

-- ROLLBACKED Transaction
START TRANSACTION;
UPDATE orders SET total = total + 10 WHERE id = 1;
UPDATE products SET show_on_website = false WHERE id = 10;
ROLLBACK;