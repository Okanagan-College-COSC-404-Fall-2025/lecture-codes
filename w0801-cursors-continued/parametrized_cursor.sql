DECLARE
    CURSOR customer_order_c(email VARCHAR2)
    IS
        select * from ORDERS JOIN CUSTOMERS USING (CUSTOMER_ID)
        WHERE CUSTOMERS.EMAIL_ADDRESS = email;
        
    order_record customer_order_c%ROWTYPE;
    
BEGIN
    OPEN customer_order_c('diane.wilkerson@internalmail');
    LOOP
        FETCH customer_order_c INTO order_record;
        EXIT WHEN customer_order_c%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_record.ORDER_ID || 
                             ', Customer Email: ' || order_record.email_address );
    END LOOP;
    CLOSE customer_order_c;

END;