SET SERVEROUTPUT ON

DROP TABLE tExample;

CREATE TABLE tExample (
  name  VARCHAR2(10),
  score NUMBER,
  status VARCHAR2(10)
);

INSERT INTO tExample VALUES ('Bob',  44, 'FAIL');
INSERT INTO tExample VALUES ('Rick', 56, 'PASS');
INSERT INTO tExample VALUES ('Dan',  77, 'PASS');
INSERT INTO tExample VALUES ('Joe',  65, 'PASS');
INSERT INTO tExample VALUES ('Jill', 86, 'PASS');
COMMIT;

SELECT * FROM tExample;