CREATE or replace function get_customers_by_email(c_email varchar2) RETURN Customers%Rowtype as
v_customer Customers%Rowtype;
BEGIN
  SELECT * into v_customer FROM Customers c WHERE c.EMAIL_ADDRESS = c_email;
  RETURN v_customer;
END get_customers_by_email;