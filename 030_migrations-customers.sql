-- Migrations
-- https://postgrespro.ru/docs/postgrespro/9.5/sql-altertable

-- Adding a column
ALTER TABLE customers ADD COLUMN age smallint;

-- Changing an existing column type
ALTER TABLE customers ALTER COLUMN age TYPE int;

-- Adding an existing column constraint
ALTER TABLE customers ADD CONSTRAINT email UNIQUE(email);

-- Dropping constraints of column
ALTER TABLE customers DROP CONSTRAINT age;

-- Drop column
ALTER TABLE customers DROP COLUMN age;

-- Rename column
ALTER TABLE customers RENAME COLUMN name TO username;