CREATE OR REPLACE VIEW eg1view AS

SELECT t.ID, name, tchr_ID, crs_ID, section, stu_count

FROM teachers t, sections s

WHERE t.ID = s.tchr_ID;

SELECT * FROM eg1view;