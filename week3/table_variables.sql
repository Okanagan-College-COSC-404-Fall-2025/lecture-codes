set SERVEROUTPUT on
DECLARE
TYPE customer_table_t is table of CUSTOMERS%Rowtype;
v_customers customer_table_t;
BEGIN
    SELECT * BULK Collect INTO v_customers from CUSTOMERS;
    FOR i in 1..v_customers.count loop
    DBMS_OUTPUT.PUT_LINE('The customer name iss ' || v_customers(i).full_name);
    IF i > 8 THEN EXIT;
    end IF;
    END loop;

END;
/
