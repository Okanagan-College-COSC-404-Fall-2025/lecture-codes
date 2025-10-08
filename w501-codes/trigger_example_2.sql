CREATE OR REPLACE TRIGGER example_trg2
BEFORE UPDATE ON tExample
FOR EACH ROW
DECLARE
  v_msg VARCHAR2(20) := 'updating a row';
  v_dummy NUMBER;
BEGIN
  -- Show that for a row-leve trigger we cannot select from the same table
  -- SELECT count (*) into v_dummy FROM texample;
  DBMS_OUTPUT.PUT_LINE('Table IS ' || v_msg);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Oops. An exception occurred');
END;