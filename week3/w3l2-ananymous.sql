SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/

DECLARE
  v_num NUMBER := 0;
BEGIN
  v_num := v_num + 1;
  DBMS_OUTPUT.PUT_LINE('Value of v_num is ' || v_num);
END;
/