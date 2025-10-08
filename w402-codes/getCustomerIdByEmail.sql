CREATE or REPLACE FUNCTION get_customers_by_email( c_email VARCHAR2) RETURN NUMBER as
    c_id NUMBER;
BEGIN
    SELECT CUSTOMER_ID into c_id FROM customers c WHERE c.EMAIL_ADDRESS = c_email;
    RETURN c_id;
END get_customers_by_email;