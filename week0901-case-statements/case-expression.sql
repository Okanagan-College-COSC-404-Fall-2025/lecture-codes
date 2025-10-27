DECLARE
  v_x      number := &subvar1;
  v_flag   number;
  v_oddity varchar2(12);
BEGIN
  v_flag := MOD(v_x,2);
  v_oddity := CASE v_flag
                WHEN 0 THEN to_char(v_x)||' is even.'
                WHEN 1 THEN to_char(v_x)||' is odd.'
                ELSE to_char(v_x||' is null.')
              END;
  dbms_output.put_line('v_oddity is '|| v_oddity);     
END;
