CREATE OR REPLACE PACKAGE manage_customers IS
FUNCTION getCustomerZoneCode(c_id customers.id%TYPE) RETURN Zones.zone_code%TYPE;
PROCEDURE createCustomer(p_name VARCHAR2, p_email VARCHAR2, p_city VARCHAR2);
cust_count Number;
END manage_customers;
/



CREATE OR REPLACE PACKAGE BODY manage_customers IS

  FUNCTION getNewCustomerID(p_zcode zones.zone_code%TYPE) RETURN customers.ID%TYPE AS

    v_ID    customers.ID%TYPE;

    v_maxID NUMBER;

    v_count NUMBER;

  BEGIN

    SELECT COUNT(*) INTO v_count FROM customers;

    IF v_count = 0 THEN

      v_ID := 100000*p_zcode + 1;

    ELSE

      SELECT max(MOD(ID,100000)) INTO v_maxID FROM customers;

      v_ID := (v_maxID+1) + 100000*p_zcode;

    END IF;

    RETURN v_ID;

  EXCEPTION

    WHEN OTHERS THEN

      dbms_output.put_line('Oops. Something went wrong.');

      RETURN -1;

  END;

  PROCEDURE createCustomer(p_name VARCHAR2, p_email VARCHAR2, p_city VARCHAR2) AS

    v_ID    customers.ID%TYPE;

    v_maxID NUMBER;

    v_count NUMBER;

    v_zcode zones.zone_code%TYPE;

  BEGIN

    SELECT zone_code INTO v_zcode FROM zones

    WHERE city = p_city;

    v_ID := getNewCustomerID(v_zcode);

         dbms_output.put_line('Hello at insert');

    INSERT INTO customers VALUES(v_ID, p_name, p_email, p_city);

  EXCEPTION

    WHEN NO_DATA_FOUND THEN

      dbms_output.put_line('Zone ID is not valid.');

    WHEN OTHERS THEN

      dbms_output.put_line('Oops. Something went wrong in CreateCustomer');

  END;
  

FUNCTION getCustomerZoneCode(c_ID IN customers.ID%TYPE) RETURN zones.zone_code%TYPE

  AS

     v_zcode  zones.zone_code%TYPE;

     v_city   customers.city%TYPE;

     v_count  NUMBER;

--    NO_ZONE_ERROR EXCEPTION;

  BEGIN

     SELECT city INTO v_city FROM customers WHERE ID = c_ID;

     SELECT zone_code INTO v_zcode FROM zones WHERE city = v_city;

     RETURN v_zcode;

  EXCEPTION

    WHEN OTHERS THEN

      dbms_output.put_line('Hmmmm...');

      RETURN -1;

  END;
  END manage_customers;

/


BEGIN

 -- Run this for initial to create customers and see that it works.

  manage_customers.createCustomer('Dave Jones', 'djones@yahoo.com', 'Smithers');

  manage_customers.createCustomer('Rick Gee', 'rgee@yahoo.com', 'Calgary');
  manage_customers.createCustomer('Dani Kirks', 'dkirks@hotmail.com', 'Prince George');
  manage_customers.createCustomer('Ed Harris', 'eharris@letter.com', 'Vancouver');

END;
/

SELECT * FROM customers;


-- BEGIN

-- -- Run this one and since it is a private function it isn't accessible from outside the package so it will give an error

-- dbms_output.put_line(manage_customers.getNewCustomerID(12));

-- END;


BEGIN
-- Run this one and since it is a public function it is accessible from outside the package, so it will output
dbms_output.put_line(manage_customers.getCustomerZoneCode(1500001));
END;
