CREATE OR REPLACE TRIGGER Exp_ITEMS_trg

AFTER INSERT ON Exp_ITEMS

FOR EACH ROW

DECLARE

  v_Item varchar2(10);

  v_Discount NUMBER;

  v_Msg VARCHAR2(60);

BEGIN

  SELECT MAX(discount) INTO v_Discount FROM Exp_ITEMS;

  SELECT item INTO v_ITEM FROM Exp_ITEMS WHERE discount = v_Discount;

  v_msg := v_Item || ' has the biggest discount (' || 100*v_discount || '%).';

  INSERT INTO Exp_ItemsLog VALUES (v_item, v_Discount, v_msg);

EXCEPTION

  WHEN TOO_MANY_ROWS THEN

    dbms_output.put_line('Oops, more than 1 item with discount '||v_discount);

END;