DECLARE
  r_person demo_person%ROWTYPE;  -- record shaped like a table row
BEGIN
  SELECT * INTO r_person
  FROM demo_person
  WHERE id = 1;

  DBMS_OUTPUT.PUT_LINE(
    'Record -> id=' || r_person.id ||
    ', name=' || r_person.name ||
    ', salary=' || r_person.salary
  );
END;
/