SET SERVEROUTPUT ON;

DECLARE
  TYPE stu_name_type IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
  lNames_tab stu_name_type;
	
  CURSOR c_students IS SELECT stu_name FROM students;
  v_i PLS_INTEGER := 1;
BEGIN
  FOR s IN c_students LOOP
    -- You cannot assign lname/fname here because each element is a VARCHAR2, not a record
    -- For now, just store the full name or one part of it
    lNames_tab(v_i) := SUBSTR(s.stu_Name, INSTR(s.stu_Name,' ') + 1);  -- store last name only
    v_i := v_i + 1;
  END LOOP;

  v_i := 1;
  WHILE v_i <= lNames_tab.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(v_i || ': ' || lNames_tab(v_i));
    v_i := v_i + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('COUNT: '||lNames_tab.COUNT);
  DBMS_OUTPUT.PUT_LINE('FIRST: '||lNames_tab.FIRST);
  DBMS_OUTPUT.PUT_LINE('LAST: ' ||lNames_tab.LAST);

  lNames_tab.DELETE(3);
  DBMS_OUTPUT.PUT_LINE('COUNT after delete: '||lNames_tab.COUNT);
  DBMS_OUTPUT.PUT_LINE('PRIOR(4): ' || lNames_tab.PRIOR(4));
  DBMS_OUTPUT.PUT_LINE('NEXT(4): ' || lNames_tab.NEXT(4));

  IF lNames_tab.EXISTS(2) THEN DBMS_OUTPUT.PUT_LINE('EXISTS(2)'); END IF;
  IF lNames_tab.EXISTS(3) THEN DBMS_OUTPUT.PUT_LINE('EXISTS(3)'); END IF;

  DBMS_OUTPUT.PUT_LINE('Done');
END;
/