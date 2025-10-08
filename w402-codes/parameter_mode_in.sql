create or replace PROCEDURE greet(p_name IN VARCHAR2) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, ' || p_name || '!');
END;
/

exec greet('Mohamad');