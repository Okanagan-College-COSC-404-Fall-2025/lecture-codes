DECLARE
    c_id NUMBER := &c_id;
    v_count  NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO   v_count
    FROM   ORDERS o
    WHERE  o.CUSTOMER_ID = c_id;

    DBMS_OUTPUT.PUT_LINE('Numver of orders belong to ' || c_id || ' = ' || v_count);
END;
/