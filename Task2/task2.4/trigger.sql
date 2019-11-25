CREATE OR REPLACE FUNCTION check_classroom()
    RETURNS trigger
AS $check_classroom$
    	BEGIN
		IF (TG_OP = 'UPDATE') THEN
			IF (NEW.computers > NEW.number_of_seats) THEN
	    	    		RAISE WARNING 'Many computers!';
				RETURN NULL;
			END IF;
		END IF;
		IF (TG_OP = 'INSERT') THEN
			IF (NEW.number_of_seats IS NULL) THEN
	    	    		RAISE WARNING '% classroom cannot have NULL seats!', NEW.Number;
				RETURN NULL;
			END IF;
			IF (NEW.computers > NEW.number_of_seats) THEN
	    	    		RAISE WARNING 'Many computers!';
				RETURN NULL;
			END IF;
		END IF;
		RETURN NEW;
    	END;
$check_classroom$
LANGUAGE 'plpgsql';

--DROP TRIGGER check_class ON classroom;
CREATE TRIGGER check_class BEFORE INSERT OR UPDATE ON classroom FOR EACH ROW EXECUTE FUNCTION check_classroom();
