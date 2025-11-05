DECLARE
  TYPE stu_name_type IS TABLE OF VARCHAR2(20)
  INDEX BY PLS_INTEGER;
  lNames_tab STU_NAME_TYPE;
	
  CURSOR c_students IS (SELECT stu_name FROM students);
  v_i PLS_INTEGER := 1;
BEGIN
  FOR s IN c_students LOOP
    -- Next statement creates a sub string
    -- INSTR is a function that locates the position of a character in a string
    -- SUBSTR function can take in another argument, which indicates the last index of a substring
    lNames_tab(v_i) := SUBSTR(s.stu_Name,  INSTR(s.stu_Name,' ') + 1);
    v_i := v_i + 1;
  END LOOP;
  FOR i IN 1 .. lNames_tab.LAST LOOP
    dbms_output.put_line(i || ': ' || lNames_tab(i));
  END LOOP;
  dbms_output.put_line('Done');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
   dbms_output.put_line('Oops. Looped beyond the collection.');
END;
