CREATE OR REPLACE VIEW eg2view AS

SELECT name, dept, sum(stu_count) studs

FROM teachers t, sections s

WHERE t.ID = s.tchr_ID

GROUP BY name, dept;

SELECT * FROM eg2view;



INSERT INTO eg2View VALUES ('Reza', 'COSC', 10);

SELECT * FROM teachers;