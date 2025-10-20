CREATE OR REPLACE TRIGGER midterm1Q10
BEFORE INSERT OR UPDATE OF score ON texample
FOR EACH ROW
BEGIN
    IF :NEW.score >= 80 THEN
        DBMS_OUTPUT.PUT_LINE( :NEW.name || ' passed with score: ' || :NEW.score);
        :NEW.status := 'PASS';
    ELSE
        :NEW.status := 'FAIL';
    END IF;
END;
/