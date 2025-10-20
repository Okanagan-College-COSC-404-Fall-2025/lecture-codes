DECLARE
  TYPE id_array IS TABLE OF VARCHAR2(200);
  v_ids id_array := id_array('Mohamad', 'mohamad', 'cosc');
BEGIN
  FORALL i IN 1 .. v_ids.COUNT
    DELETE FROM texample WHERE name = v_ids(i);

  FOR i IN 1 .. v_ids.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Rows affected for ID ' || v_ids(i) || ': ' || SQL%BULK_ROWCOUNT(i));
  END LOOP;
END;
/


SELECT * FROM TEXAMPLE;