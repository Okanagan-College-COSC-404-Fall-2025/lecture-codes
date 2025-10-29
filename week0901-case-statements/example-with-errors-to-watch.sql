SET SERVEROUTPUT ON
DECLARE
  v_x  number := &subvar1;
  v_flag  BOOLEAN;
BEGIN
  CASE v_flag
  WHEN MOD(v_x,2) = 0 THEN
    dbms_output.put_line(to_char(v_x)||' is even.');
  ELSE
    dbms_output.put_line(to_char(v_x)||' is odd.');
  END CASE;
END;

/
-- Note: the selector data type id is number but MOD(v_x,2) = 0 is a Boolean.
