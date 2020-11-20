INSERT INTO orders (customer_id, purchase_date, total, order_info)
VALUES (
	32,
  NOW(),
	(
    SELECT SUM(
      price *
      (CASE
        WHEN id = 1 THEN 3
        WHEN id = 3 THEN 2
      END)
	  )
	  FROM products
	  WHERE id IN (1, 3)
  ),
  (
    SELECT json_agg(b)
    FROM (
      SELECT json_build_object(
        'id', id,
        'name', name,
        'price', price,
        'quantity', CASE
          WHEN id = 1 THEN 3
          WHEN id = 3 THEN 2
        END
      ) AS order_summary
      FROM products
      WHERE id IN (1, 3)
    ) AS b
  )
)