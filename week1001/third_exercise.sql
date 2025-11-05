SET SERVEROUTPUT ON;

DECLARE
  TYPE intList_VA IS VARRAY(4) OF INTEGER;
  TYPE intMatrix_VA IS VARRAY(6) OF intList_VA;
  matrix intMatrix_VA := intMatrix_VA();
  temp_row intList_VA;
BEGIN
  -- Build matrix dynamically
  FOR i IN 1..6 LOOP                -- 6 rows
    temp_row := intList_VA();       -- initialize a new row
    FOR j IN 1..4 LOOP              -- 4 columns
      temp_row.EXTEND;              -- add a new element to the row
      temp_row(j) := i * 10 + j;    -- fill pattern (e.g., 11,12,13,14 ...)
    END LOOP;

    matrix.EXTEND;                  -- add a new row
    matrix(i) := temp_row;          -- assign the filled row to the matrix
  END LOOP;

  -- Display matrix contents
  FOR i IN 1..matrix.COUNT LOOP
    FOR j IN 1..matrix(i).COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('matrix('||i||','||j||') = '||matrix(i)(j));
    END LOOP;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Done');
END;
/