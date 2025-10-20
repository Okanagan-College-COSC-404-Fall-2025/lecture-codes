CREATE OR REPLACE PACKAGE customer_order AS
    order_count NUMBER;
    FUNCTION get_customer_by_email(p_email IN VARCHAR2) RETURN SYS_REFCURSOR;
    PROCEDURE print_order_count(c_id number);
END customer_order;
/


CREATE OR REPLACE PACKAGE BODY customer_order AS

    FUNCTION get_customer_by_email(p_email IN VARCHAR2) RETURN SYS_REFCURSOR IS
        customer_cursor SYS_REFCURSOR;
    BEGIN
        OPEN customer_cursor FOR
            SELECT *
            FROM customers
            WHERE EMAIL_ADDRESS = p_email;
        RETURN customer_cursor;
    END get_customer_by_email;

    PROCEDURE print_order_count(c_id NUMBER) IS
    BEGIN
        SELECT COUNT(*) INTO order_count from orders where customer_id = c_id;
        DBMS_OUTPUT.PUT_LINE('Total Orders: ' || order_count);
    END print_order_count;

END customer_order;