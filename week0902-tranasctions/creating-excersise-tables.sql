CREATE TABLE staff(id number, name varchar2(20), pay number);
CREATE TABLE staffAudit(uName varchar2(20), UpdateTime date, msg varchar2(60));
CREATE TABLE staffAudit_ALL (uName varchar2(20), UpdateTime date, msg varchar2(60));

INSERT INTO staff VALUES (1, 'John', 20);
INSERT INTO staff VALUES (2, 'Bob', 40);
INSERT INTO staff VALUES (3, 'Joey', 10);
