--Same example using a RECORD as the collection datatype

DECLARE
  TYPE studentName IS RECORD(fname VARCHAR2(20), lname VARCHAR2(20));
  TYPE stu_name_type IS TABLE OF studentName
  INDEX BY PLS_INTEGER;
  sNames_tab STU_NAME_TYPE;
	
  CURSOR c_students IS (SELECT stu_name FROM students);
  v_i PLS_INTEGER := 1;
BEGIN
  FOR s IN  c_students LOOP
    sNames_tab(v_i).lname := SUBSTR(s.stu_Name, INSTR(s.stu_Name,' ') + 1);
    sNames_tab(v_i).fname := SUBSTR(s.stu_Name, 1, INSTR(s.stu_Name,' ') - 1);
    v_i := v_i + 1;
  END LOOP;
  FOR i IN 1 .. sNames_tab.LAST + 1 LOOP  -- 1 beyond to show exception
    dbms_output.put_line(i || ': ' || sNames_tab(i).fname || ' ' || 
                                                  sNames_tab(i).lname);
  END LOOP;
  dbms_output.put_line('Done');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
      dbms_output.put_line('Oops. Looped beyond the collection.');
END;
