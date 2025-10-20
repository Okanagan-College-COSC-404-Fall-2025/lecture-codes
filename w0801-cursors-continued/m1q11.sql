create or replace function m1q11 (email VARCHAR2) RETURN number IS
    cnt number;
    TYPE ot is TABLE of orders%ROWTYPE ;
    co cot;

BEGIN
    select * BULK COLLECT INTO co FROM orders 
    WHERE order.c_email = email;
    for i in 1 .. co.COUNT LOOP
        dmbs_out.put_line(co(i).prod_id);
    END LOOP;
    RETURN co.count;
END;