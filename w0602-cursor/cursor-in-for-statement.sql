BEGIN
  For rec IN (
    SElect c.FULL_NAME, count(o.ORDER_ID) n_orders from customers  c
    join orders o using (customer_id)
    GROUP BY c.FULL_NAME
    HAVING n_orders > 8
  ) 
  LOOP
    DBMS_OUTPUT.PUT_LINE(' Name: ' || rec.FULL_NAME || ' - Orders: ' || rec.n_orders);
  END LOOP;
END;
/