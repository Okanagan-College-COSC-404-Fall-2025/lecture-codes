Create or REPLACE FUNCTION get_customer_by_id(c_id NUMBER) RETURN customers%Rowtype AS
c customers%Rowtype;
BEGIN
    SELECT * into c from CUSTOMERS where CUSTOMER_ID = c_id;
    RETURN c;

END get_customer_by_id;