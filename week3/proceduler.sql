CREATE Or replace PROCEDURE cosc_create_table(tname VARCHAR2) AS
v_sql CLOB;
BEGIN
    v_sql := 'create table ' || dbms_assert.SIMPLE_SQL_NAME(tname)||'(id number, name VARCHAR2(100))';
    EXECUTE IMMEDIATE v_sql;
end cosc_create_table;
/
