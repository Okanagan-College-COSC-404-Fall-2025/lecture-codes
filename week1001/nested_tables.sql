DECLARE
  TYPE studentName IS RECORD(fname VARCHAR2(20), lname VARCHAR2(20));
  TYPE stu_name_type IS TABLE OF studentName;

--   Intantiating the nested table
  sNames_tab STU_NAME_TYPE := STU_NAME_TYPE();
	
  CURSOR c_students IS (SELECT stu_name FROM students);
  v_i PLS_INTEGER := 1;
BEGIN
  FOR s in c_students LOOP
    -- Extending by one
    sNames_tab.EXTEND;
    sNames_tab(v_i).lname := SUBSTR(s.stu_Name, INSTR(s.stu_Name,' ') + 1);
    sNames_tab(v_i).fname := SUBSTR(s.stu_Name, 1, INSTR(s.stu_Name,' ') - 1);
    v_i := v_i + 1;
  END LOOP;
  v_i := 1;
  WHILE v_i <= sNames_tab.LAST LOOP
    dbms_output.put_line(v_i ||':'|| sNames_tab(v_i).fname ||' '|| sNames_tab(v_i).lname);
    v_i := v_i + 1;
  END LOOP;
  dbms_output.put_line('Done');
END;
