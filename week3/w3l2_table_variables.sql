DECLARE
  TYPE person_tab_t IS TABLE OF demo_person%ROWTYPE;  -- collection of records
  l_people person_tab_t;
BEGIN
  SELECT * BULK COLLECT INTO l_people
  FROM demo_person
  ORDER BY id;

  FOR i IN 1 .. l_people.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Row ' || i || ': ' ||
      l_people(i).name || ' earns ' || l_people(i).salary
    );
  END LOOP;
END;
/