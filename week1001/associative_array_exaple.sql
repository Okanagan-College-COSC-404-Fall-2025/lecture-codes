DECLARE
    TYPE st_name_type IS TABLE OF VARCHAR2(200) 
    INDEX BY PLS_INTEGER;
    last_names_tab ST_NAME_TYPE;


BEGIN
    last_names_tab(1) := 'Smith';
    last_names_tab(3) := 'Jones';

    DBMS_OUTPUT.PUT_LINE('the element in the table is '|| last_names_tab(1));
END;
/