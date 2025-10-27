-- Run this code on customer order database
DECLARE
  v_name customers.FULL_NAME%TYPE;
BEGIN
  SELECT full_name INTO v_name FROM customers WHERE customer_id = 9999;
  DBMS_OUTPUT.PUT_LINE('Customer: ' || v_name);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: Customer not found.');
END;
/
