CREATE OR REPLACE TRIGGER auditnames

BEFORE INSERT OR DELETE OR UPDATE ON texample

FOR EACH ROW

DECLARE

    v_user varchar2(30) := USER;

    v_date varchar2(30) := TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS');

BEGIN

    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('inserting name: ' || :NEW.name);

        INSERT INTO name_audit_test(new_name, old_name, user_name, entry_date, operation)

        VALUES (:NEW.name, NULL, v_user, v_date, 'INSERT');

    ELSIF DELETING THEN

        INSERT INTO name_audit_test(new_name, old_name, user_name, entry_date, operation)

        VALUES (NULL, :OLD.name, v_user, v_date, 'DELETE');

    ELSIF UPDATING THEN

        INSERT INTO name_audit_test(new_name, old_name, user_name, entry_date, operation)

        VALUES (:NEW.name, :OLD.name, v_user, v_date, 'UPDATE');

    END IF;

END;