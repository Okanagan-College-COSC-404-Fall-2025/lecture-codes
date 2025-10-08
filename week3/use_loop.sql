DECLARE
TYPE customers_table_t is table of CUSTOMERS%Rowtype;
v_customers customers_table_t;
i NUMBER :=1; -- index from 1
BEGIN
    SELECT * bulk collect INTO v_customers from CUSTOMERS;
    loop
    dbms_output.PUT_LINE('customer name is ' || v_customers(i).full_name);
    
    IF i > 5 then EXIT;
    END IF;
    i:=i +1;
    END loop;
END;
/