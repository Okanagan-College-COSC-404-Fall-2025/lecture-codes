CREATE OR REPLACE TRIGGER customer_AUD
AFTER UPDATE OR DELETE ON customers
FOR EACH ROW
DECLARE
  v_msg VARCHAR2(55) := 'Update to customer: ';
  v_count NUMBER := 0;
BEGIN
  v_msg := v_msg || :OLD.ID;
  
  INSERT INTO customerAudit VALUES (USER, SYSDATE, v_msg);
END;
/