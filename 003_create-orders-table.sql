CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id bigint REFERENCES customers(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    purchase_date timestamp without time zone NOT NULL DEFAULT now(),
    total double precision NOT NULL
);