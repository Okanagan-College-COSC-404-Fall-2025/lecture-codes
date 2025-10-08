create or replace FUNCTION insert_to_table(
    p_table_name IN VARCHAR2,
    p_values IN NUMBER
) RETURN NUMBER as
    v_sql VARCHAR2(1000);
BEGIN
    v_sql := 'INSERT INTO ' || p_table_name || ' ( id ) VALUES (' || p_values || ')';
    EXECUTE IMMEDIATE v_sql;
    RETURN 1;
END insert_to_table;

/

DECLARE
var NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE (insert_to_table('t2', 123));
END;
