DECLARE
TYPE customer_table_t is table of CUStomers%Rowtype;
v_customers customer_table_t;
i NUMBER :=0;
BEGIN
    SELECT * bulk collect INTO v_customers from CUSTOMERS;
    LOOP
        i := i +1;
        DBMS_OUTPUT.PUT_LINE('customer name is ' || v_customers(i).full_name);
        EXIT WHEN i > 3;

        END LOOP;

END;
/