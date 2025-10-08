-- Fires once for each updated row, AFTER the row is written
CREATE OR REPLACE TRIGGER example_trg3
AFTER UPDATE ON tExample
FOR EACH ROW
DECLARE
  v_msg VARCHAR2(50) := 'row updated';
BEGIN
  DBMS_OUTPUT.PUT_LINE(
    'tExample ' || v_msg ||
    ' → name=' || :NEW.name ||
    ', score: ' || :OLD.score || ' -> ' || :NEW.score ||
    ', status: ' || :OLD.status || ' -> ' || :NEW.status
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Oops. An exception occurred in example_trg3');
END;
/