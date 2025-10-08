DECLARE

  CURSOR c_area  IS
  SELECT c.FULL_NAME, c.EMAIL_ADDRESS, count(o.ORDER_ID) order_number
   from customers c join ORDERS o using(customer_id) 
   GROUP by c.FULL_NAME, c.EMAIL_ADDRESS HAVING order_number > 10;
  v_rec c_area%ROWTYPE;
  v_msg VARCHAR2(60);
BEGIN
  OPEN c_area;
  Loop
    Fetch c_area INTO v_rec;
    EXIT WHEN c_area%NOTFOUND;
    dbms_output.put_line('customer ' || v_rec.FULL_NAME || ' with email ' || v_rec.EMAIL_ADDRESS || 
                         ' has ' || v_rec.order_number || ' orders');
  END LOOP;
  dbms_output.put_line('Record No.: '||c_area%ROWCOUNT);
  CLOSE c_area;
--  dbms_output.put_line('Record No.: '||c_area%ROWCOUNT);

  dbms_output.put_line('Program is Done');

END;