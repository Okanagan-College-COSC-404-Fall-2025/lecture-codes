create or replace TRIGGER trg_before_insert_on_column
BEFORE update of name on texample
for each row
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger executed before insert on column name');
END;
