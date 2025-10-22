CREATE OR REPLACE PROCEDURE gateChange(p_OldGate VARCHAR2, p_NewGate VARCHAR2) AS
  v_ALName  Airlines.Name%TYPE;
  CURSOR c_Flights IS SELECT * FROM Flights;
BEGIN
  dbms_output.put_line('test');
  FOR v_flight IN c_Flights LOOP
    IF v_flight.gate = p_OldGate  and v_flight.departure > SYSDATE and v_flight.departure < SYSDATE + 7 THEN
      UPDATE FLIGHTS SET gate = p_NewGate 
      WHERE FLTNO = v_flight.FLTNO;
      dbms_output.PUT_LINE('Changing gate for flight ' || v_flight.FLTNO || ' from ' || p_OldGate || ' to ' || p_NewGate || ' date ' ||v_flight.departure);


      SELECT a.name INTO v_ALName FROM Flights f, Airlines a
      WHERE f.FLTNO = v_flight.FLTNO AND f.Airline_ID = a.ID;
      INSERT INTO Notifications (N_DATE, MSG) VALUES (SYSDATE, 'Gate changed to ' ||
                  p_NewGate || ' for ' || v_ALName || ' ' || 'flight ' || v_flight.FLTNO);

      COMMIT;
      dbms_output.put_line(v_flight.FLTNO);
   
    END IF;
  END LOOP;


END;
/

BEGIN
gateChange('A4', 'b30');
END;