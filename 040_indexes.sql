-- https://www.postgresql.org/docs/9.5/indexes-types.html

-- Create hash index
CREATE INDEX total_hash ON customers USING hash (total);

-- Create btree index
CREATE INDEX total_btree ON orders USING btree (total);

-- DROP index
DROP INDEX customers_name_idx;