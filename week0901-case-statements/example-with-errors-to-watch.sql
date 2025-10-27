SET SERVEROUTPUT ON
DECLARE
  v_x  number := &subvar;
  v_flag  Number;
BEGIN
  CASE v_flag
  WHEN MOD(v_x,2) = 0 THEN
    dbms_output.put_line(to_char(v_x)||' is even.');
  ELSE
    dbms_output.put_line(to_char(v_x)||' is odd.');
  END CASE;
END;

/
-- Note: the selector data type ids number but MOD(v_x,2) = 0 is a Boolean.
