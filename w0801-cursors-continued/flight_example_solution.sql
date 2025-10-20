CREATE OR REPLACE PROCEDURE gateChangeA(p_OldGate NUMBER, p_NewGate NUMBER) AS
--   v_FRec    Flights%ROWTYPE;
  v_ALName  Airlines.Name%TYPE;
  CURSOR c_Flights IS SELECT * FROM Flights;
  v_FRec  c_Flights%ROWTYPE;
BEGIN
  dbms_output.put_line('Change gate to ' || p_NewGate || ' for these flights:');
  OPEN c_Flights;
  LOOP
    FETCH c_Flights INTO v_FRec;
    EXIT WHEN c_Flights%NOTFOUND;
    
    
    IF V_FRec.gate = p_OldGate AND v_FRec.departure > SYSDATE AND v_FRec.departure < SYSDATE +7 THEN
      UPDATE FLIGHTS SET gate = p_NewGate 
      WHERE FLTNO = v_FRec.FLTNO;

      SELECT a.name INTO v_ALName FROM Flights f, Airlines a
      WHERE f.FLTNO = v_FRec.FLTNO AND f.Airline_ID = a.ID;
      INSERT INTO Notifications (N_DATE, MSG) VALUES (SYSDATE, 'Gate changed to ' ||
                  p_NewGate || ' for ' || v_ALName || ' ' || 'flight ' || v_FRec.FLTNO);

      COMMIT;
     dbms_output.put_line(v_FRec.FLTNO);
   
    END IF;
  END LOOP;
  CLOSE c_Flights;
    DBMS_OUTPUT.PUT_LINE('test');
END;
/