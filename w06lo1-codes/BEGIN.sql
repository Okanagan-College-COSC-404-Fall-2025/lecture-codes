BEGIN
  UPDATE employees
     SET salary = salary * 1.10
   WHERE department_id = 50;

  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows were updated.');
END;
/