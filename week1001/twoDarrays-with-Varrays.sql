DECLARE
  TYPE intList_VA IS VARRAY(5) OF INTEGER;
  TYPE intMatrix_VA IS VARRAY(4) OF intList_VA;
  matrix INTMATRIX_VA := INTMATRIX_VA();
  v_i PLS_INTEGER := 1;
BEGIN
  matrix.EXTEND;
  matrix(1) := intList_VA(11,12,13,14,15); matrix.EXTEND;
  matrix(2) := intList_VA(21,22,23,24,25); matrix.EXTEND;
  matrix(3) := intList_VA(31,32,33,34,35);
  FOR i IN 1..3 LOOP
    FOR j IN 1..5 LOOP
       dbms_output.put_line('matrix('||i||','||j||') = '||matrix(i)(j));
    END LOOP;
  END LOOP;
  dbms_output.put_line('Done');
END;
