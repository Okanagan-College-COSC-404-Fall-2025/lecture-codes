drop table CUSTOMERS;
drop table ZONES;
create table CUSTOMERS(ID NUMBER, name VARCHAR2(200), email VARCHAR2(200), city VARCHAR2(200));
create table ZONES(zone_code NUMBER(2), zone_name VARCHAR2(200), city VARCHAR2(200));



CREATE OR REPLACE VIEW cust_data AS

SELECT ID, name, email, c.city, zone_name

FROM CUSTOMERS c, zones z

WHERE c.city = z.city;


INSERT INTO cust_data VALUES(1, 'Donald', 'don@gmail.com', 'Red Deer', 'Alberta');