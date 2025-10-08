create or replace PROCEDURE get_number_of_orders(customer_id in NUMBER, order_count out NUMBER) AS
BEGIN
    select count(*) into order_count from orders o where o.CUSTOMER_ID = 1;
END get_number_of_orders;

/

DECLARE
    v_order_count NUMBER;
BEGIN
    get_number_of_orders(GET_CUSTOMER_ID_BY_EMAIL('kristina.nunez@internalmail'), v_order_count);
    DBMS_OUTPUT.PUT_LINE('Number of orders for customer: ' || v_order_count);
END;