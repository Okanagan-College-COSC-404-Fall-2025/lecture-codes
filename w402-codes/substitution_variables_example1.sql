SET SERVEROUTPUT ON

DECLARE
    v_name VARCHAR2(50) := '&name';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, ' || v_name);
END;
/