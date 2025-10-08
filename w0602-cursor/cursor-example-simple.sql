DECLARE
CURSOR cr IS
SELECT * from customers fetch first 10 rows only;

v_result_row cr%ROWTYPE;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO v_result_row;
        EXIT WHEN cr%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_result_row.customer_id || ' ' || v_result_row.FULL_NAME|| ' ' || v_result_row.EMAIL_ADDRESS);
    END LOOP;
    CLOSE cr;
END;
/