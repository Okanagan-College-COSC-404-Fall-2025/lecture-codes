SEt SERVEROUTPUT on;
DECLARE
v_customer CUStomers%Rowtype;
BEGIN
    SELECT * INTO v_customer from CUSTOMERS where CUSTOMER_ID = 1;
    dbms_output.PUT_LINE('customer name is ' || v_customer.full_name || 'and the email is ' || v_customer.email_address);

END;
/