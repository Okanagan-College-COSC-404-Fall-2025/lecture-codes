create or replace FUNCTION insert_to_table (tname VARCHAR2, t_id NUMBER, val VARCHAR2) RETURN VARCHAR2 as
    sql_stmt VARCHAR2(1000);

BEGIN
    sql_stmt := 'INSERT INTO ' || tname || ' (id, value) values (:1, :2)';
    EXECUTE IMMEDIATE sql_stmt USING t_id, val;
    COMMIT;

    RETURN 'Inserted into ' || tname;
END;

/