SET SERVEROUTPUT ON
DECLARE
  v_x  number := 2;
  v_y  number := 5;
  v_z  number := 3;
BEGIN
  CASE v_y + 2
  WHEN v_x + 2 THEN dbms_output.put_line('v_x + 2 = '|| to_char(v_x + 2));
  WHEN v_x + 3 THEN dbms_output.put_line('v_x + 3 = '|| to_char(v_x + 3));
  WHEN v_z + 2 THEN dbms_output.put_line('v_z + 2 = '|| to_char(v_z + 2));
  WHEN v_x + v_z THEN 
    dbms_output.put_line('v_x + v_z = '|| to_char(v_x + v_z));
  WHEN v_x + 5 THEN 
    dbms_output.put_line('v_x + 5 = '|| to_char(v_x + 5));
    dbms_output.put_line('v_x + 5 = POOP'|| to_char(v_x + 5));
  ELSE
    dbms_output.put_line('No match');
  END CASE;
END;
