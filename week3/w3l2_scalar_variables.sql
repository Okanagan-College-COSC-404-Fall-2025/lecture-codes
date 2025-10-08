DECLARE
  v_count NUMBER;               -- scalar
  v_title VARCHAR2(40) := 'Rows in DEMO_PERSON';  -- scalar
BEGIN
  SELECT COUNT(*) INTO v_count FROM demo_person;
  DBMS_OUTPUT.PUT_LINE(v_title || ': ' || v_count);
END;
/
