-- We need to run this file step by step


-- CREATE OR REPLACE TYPE foo_type IS TABLE OF VARCHAR2(20);


-- DECLARE
--   v_list foo_type := foo_type('Apple', 'Banana', 'Cherry');
-- BEGIN
--   FOR i IN 1..v_list.COUNT LOOP
--     DBMS_OUTPUT.PUT_LINE(v_list(i));
--   END LOOP;
-- END;
-- /
-- CREATE TABLE Floopy (
--   x foo_type,
--   z NUMBER
-- )
-- NESTED TABLE x STORE AS x_tab;

-- INSERT INTO Floopy VALUES (foo_type('Dog', 'Cat', 'Bird'), 10);
-- SELECT * from FLOOPY;
-- SELECT Z, COLUMN_VALUE AS Animal
-- FROM Floopy f,
--      TABLE(f.x);

DROP TABLE Floopy;