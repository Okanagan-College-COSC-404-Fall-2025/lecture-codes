DECLARE
  v_num NUMBER := 0;
BEGIN
  -- Main code
  DBMS_OUTPUT.PUT_LINE(10 / v_num);

EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error: Division by zero!');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
END;
/
