-- https://www.postgresqltutorial.com/creating-first-trigger-postgresql/

CREATE FUNCTION set_updated_at() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   NEW.updated_at = NOW();
   
   RETURN NEW;
END;
$$

CREATE TRIGGER set_updated_at
	BEFORE UPDATE
	ON customers
FOR EACH ROW EXECUTE PROCEDURE set_updated_at();