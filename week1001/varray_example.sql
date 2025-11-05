DECLARE
  TYPE studentName IS RECORD(fname VARCHAR2(20), lname VARCHAR2(20));
  TYPE stu_name_va IS VARRAY(30) OF studentName;  -- varrays are automatically NULL
  sNames_va STU_NAME_VA := STU_NAME_VA();
	
  CURSOR c_students IS (SELECT stu_name FROM students);
  v_i PLS_INTEGER := 1;
BEGIN
  FOR s in c_students LOOP
    sNames_va.EXTEND;
    sNames_va(v_i).lname := SUBSTR(s.stu_Name, INSTR(s.stu_Name,' ') + 1);
    sNames_va(v_i).fname := SUBSTR(s.stu_Name, 1, INSTR(s.stu_Name,' ') - 1);
    v_i := v_i + 1;
  END LOOP;
  v_i := 1;
  WHILE v_i <= sNames_va.LAST LOOP
    dbms_output.put_line(v_i || ': ' || sNames_va(v_i).fname || ' ' || sNames_va(v_i).lname);
    v_i := v_i + 1;
  END LOOP;
  dbms_output.put_line('Done');
END;
