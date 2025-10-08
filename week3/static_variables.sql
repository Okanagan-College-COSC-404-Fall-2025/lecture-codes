SET SERVEROUTPUT ON
DECLARE
v_name VARCHAR2(100);
-- v_name CUStomers.FULL_NAME%TYPE;
BEGIN
    SELECT full_name INTO v_name from CUSTOMERS WHERE CUSTOMER_ID = 1;
    dbms_output.PUT_LINE('customer name is ' || v_name);
END;
/