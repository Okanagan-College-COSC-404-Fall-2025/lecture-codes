CREATE TABLE teachers(ID NUMBER PRIMARY KEY, name VARCHAR2(10), dept VARCHAR2(4));

CREATE TABLE sections(crs_ID VARCHAR2(7), section NUMBER, tchr_ID NUMBER, stu_count NUMBER);

--Adding a primary key constraint
ALTER TABLE sections ADD CONSTRAINT sections_PK PRIMARY KEY(crs_ID, section);

--Adding a foreign key constraint
ALTER TABLE sections ADD CONSTRAINT sections_FK 

FOREIGN KEY(tchr_ID) REFERENCES teachers(ID);


-- Adding data to teachers table
INSERT INTO teachers VALUES(100, 'Ken', 'COSC');

INSERT INTO teachers VALUES(101, 'Jim', 'COSC');

INSERT INTO teachers VALUES(102, 'Joe', 'MATH');

INSERT INTO teachers VALUES(105, 'Michael', 'CMNS');

INSERT INTO teachers VALUES(103, 'Deb', 'COSC');

INSERT INTO teachers VALUES(104, 'Dan', 'COSC');

INSERT INTO teachers VALUES(106, 'Scott', 'MATH');

-- Adding data to sections table

INSERT INTO sections VALUES('COSC111', 1, 100, 40);

INSERT INTO sections VALUES('COSC111', 2, 100, 39);

INSERT INTO sections VALUES('COSC111', 3, 101, 45);

INSERT INTO sections VALUES('COSC111', 4, 101, 27);

INSERT INTO sections VALUES('MATH139', 1, 102, 38);

INSERT INTO sections VALUES('MATH139', 2, 106, 34);

INSERT INTO sections VALUES('CMNS113', 1, 105, 36);

INSERT INTO sections VALUES('CMNS113', 2, 105, 33);

INSERT INTO sections VALUES('COSC213', 1, 104, 45);

