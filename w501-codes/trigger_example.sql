CREATE OR REPLACE TRIGGER example_trg1
AFTER UPDATE ON tExample
DECLARE
  v_msg VARCHAR2(20) := 'Updating ...';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Table is ' || v_msg);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Oops. An exception occurred');
END;
/