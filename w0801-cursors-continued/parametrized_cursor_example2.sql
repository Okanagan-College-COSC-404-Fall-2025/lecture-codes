DECLARE
    CURSOR customer_order_c(email VARCHAR2)
    IS
        select * from ORDERS JOIN CUSTOMERS USING (CUSTOMER_ID)
        WHERE CUSTOMERS.EMAIL_ADDRESS = email;
    
BEGIN
    for c in customer_order_c('anthony.boone@internalmail') LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || c.ORDER_ID || ' Email: ' || c.EMAIL_ADDRESS);
    END LOOP;

END;