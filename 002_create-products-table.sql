CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price double precision NOT NULL,
    show_on_website boolean NOT NULL DEFAULT true
);