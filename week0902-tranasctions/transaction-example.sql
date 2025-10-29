CREATE TABLE teams (city varchar2(20), name varchar2(20));

INSERT INTO teams VALUES ('Toronto', 'Raptors');
INSERT INTO teams VALUES ('Los Angeles', 'Lakers');
COMMIT;
ROLLBACK;

