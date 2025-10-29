
CREATE TABLE Lecture_Audit_LOG (audit_time date, message varchar2(40));


DECLARE
  v_msg VARCHAR2(40) := 'Updating the Audit table';
BEGIN
  INSERT INTO Lecture_audit_log VALUES (SYSDATE, v_msg);
  dbms_output.put_line('Inserted a record into LAB5_audit_log');
END;
/

ROLLBACK;
SELECT * FROM Lecture_audit_log;

