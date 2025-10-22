DROP TABLE zones;

CREATE TABLE zones (zone_code NUMBER(2), zone_name VARCHAR2(15), city VARCHAR2(15) PRIMARY KEY);

INSERT INTO zones VALUES(12, 'Central BC', 'Kelowna');

INSERT INTO zones VALUES(12, 'Central BC', 'Kamloops');

INSERT INTO zones VALUES(12, 'Central BC', 'Penticton');

INSERT INTO zones VALUES(15, 'Northern BC', 'Prince George');

INSERT INTO zones VALUES(15, 'Norther BC', 'Smithers');

INSERT INTO zones VALUES(31, 'Lower Mainland', 'Vancouver');

INSERT INTO zones VALUES(31, 'Lower Mainland', 'Richmond');

INSERT INTO zones VALUES(55, 'Alberta', 'Calgary');

INSERT INTO zones VALUES(55, 'Alberta', 'Edmonton');



DROP TABLE customers;

CREATE TABLE CUSTOMERS(ID NUMBER, name VARCHAR2(20), email VARCHAR2(25), city VARCHAR2(15));



SELECT * FROM customers;

