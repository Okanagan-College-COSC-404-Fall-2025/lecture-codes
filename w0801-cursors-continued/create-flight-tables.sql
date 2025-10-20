DECLARE
  -- Helper function to check if a table exists
  FUNCTION table_exists(p_table_name VARCHAR2) RETURN BOOLEAN IS
    v_count INTEGER;
  BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_tables
    WHERE table_name = UPPER(p_table_name);
    RETURN v_count > 0;
  END;
BEGIN
  -- Drop tables if they already exist
  IF table_exists('FLIGHTS') THEN
    EXECUTE IMMEDIATE 'DROP TABLE FLIGHTS';
  END IF;

  IF table_exists('NOTIFICATIONS') THEN
    EXECUTE IMMEDIATE 'DROP TABLE NOTIFICATIONS';
  END IF;

  IF table_exists('PILOTS') THEN
    EXECUTE IMMEDIATE 'DROP TABLE PILOTS';
  END IF;

  IF table_exists('AIRLINES') THEN
    EXECUTE IMMEDIATE 'DROP TABLE AIRLINES';
  END IF;

  -- Create tables
  EXECUTE IMMEDIATE '
    CREATE TABLE AIRLINES (
      id VARCHAR2(2),
      name VARCHAR2(30)
    )';

  EXECUTE IMMEDIATE '
    CREATE TABLE PILOTS (
      id NUMBER,
      name VARCHAR2(30)
    )';

  EXECUTE IMMEDIATE '
    CREATE TABLE FLIGHTS (
      fltNO VARCHAR2(6),
      airline_ID VARCHAR2(2),
      gate VARCHAR2(4),
      destination VARCHAR2(30),
      departure DATE,
      status VARCHAR2(1),
      pilot NUMBER
    )';

  EXECUTE IMMEDIATE '
    CREATE TABLE NOTIFICATIONS (
      n_date DATE,
      fltNO VARCHAR2(6),
      airline VARCHAR2(30),
      pilot VARCHAR2(30),
      msg VARCHAR2(100)
    )';

  -- Insert sample data
  INSERT INTO AIRLINES VALUES ('WS', 'Westjet');
  INSERT INTO AIRLINES VALUES ('AC', 'Air Canada');
  INSERT INTO AIRLINES VALUES ('DL', 'Delta');
  INSERT INTO AIRLINES VALUES ('AA', 'American');
  INSERT INTO AIRLINES VALUES ('BA', 'British Airways');
  INSERT INTO AIRLINES VALUES ('AF', 'Air France');

  INSERT INTO PILOTS VALUES (101, 'Chesley Sullenberger');
  INSERT INTO PILOTS VALUES (102, 'Rongway Feldman');
  INSERT INTO PILOTS VALUES (103, 'Valentina Tereshkova');
  INSERT INTO PILOTS VALUES (104, 'Amelia Earhart');
  INSERT INTO PILOTS VALUES (105, 'Jeana Yeager');
  INSERT INTO PILOTS VALUES (106, 'Buzz Aldrin');

  INSERT INTO FLIGHTS VALUES ('WS0871', 'WS', 'A4', 'Kelowna', TO_DATE('24-OCT-25', 'DD-MON-RR'), 'O', 101);
  INSERT INTO FLIGHTS VALUES ('DL1710', 'DL', 'B19', 'Vancouver', TO_DATE('24-OCT-23', 'DD-MON-RR'), 'O', 102);
  INSERT INTO FLIGHTS VALUES ('WS3430', 'WS', 'A11', 'Toronto', TO_DATE('25-OCT-23', 'DD-MON-RR'), 'O', 103);
  INSERT INTO FLIGHTS VALUES ('AC0742', 'AC', 'A4', 'Kelowna', TO_DATE('27-OCT-25', 'DD-MON-RR'), 'O', 104);
  INSERT INTO FLIGHTS VALUES ('WS0988', 'WS', 'A5', 'Kelowna', TO_DATE('27-OCT-23', 'DD-MON-RR'), 'O', 105);
  INSERT INTO FLIGHTS VALUES ('DL1780', 'DL', 'A4', 'Toronto', TO_DATE('23-OCT-23', 'DD-MON-RR'), 'O', 106);

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'Error occurred: ' || SQLERRM);
END;
/