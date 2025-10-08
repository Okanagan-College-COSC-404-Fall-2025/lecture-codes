DECLARE
TYPE customer_table_t is table of CUStomers%Rowtype;
v_customers customer_table_t;
i NUMBER:=0;
BEGIN
    SELECT * bulk collect INto v_customers from CUSTOMERS;
    WHILE i<6 LOOP
    i:=i+1;
    DBMS_OUTPUT.PUT_LINE('name is ' || v_customers(i).full_name);
    END LOOP;

END;
/