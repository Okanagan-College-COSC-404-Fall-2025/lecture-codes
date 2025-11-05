DECLARE
  TYPE intList_TAB IS TABLE OF NUMBER;
  TYPE intMatrix_TAB IS TABLE OF intList_TAB;
  matrix intMatrix_TAB := intMatrix_TAB();
BEGIN
  matrix.EXTEND;
  matrix(1) := intList_TAB(11,12,13,14,15);
  matrix.EXTEND;
  matrix(2) := intList_TAB(21,22,23,24,25);
  matrix.EXTEND;
  matrix(3) := intList_TAB(31,32,33,34,35);

  FOR i IN 1..matrix.COUNT LOOP
    FOR j IN 1..matrix(i).COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('matrix('||i||','||j||') = '||matrix(i)(j));
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Done');
END;
/