DECLARE
  v_x  number := 6;
  v_y  number := 5;
  v_z  number;
BEGIN
  CASE
  WHEN v_x + v_y = v_z THEN dbms_output.put_line('v_x + v_y = v_z');
  WHEN v_x > 3 THEN dbms_output.put_line('v_x > 3');
  WHEN v_z + 2 > 4 AND v_y < 10 THEN
    dbms_output.put_line('v_z + 2 > 4 AND v_y < 10');
  WHEN v_x < 3 THEN 
    dbms_output.put_line('v_x < 3');
    dbms_output.put_line('v_x < 3  POOP');
  ELSE
    dbms_output.put_line('No match true case');
  END CASE;
END;
