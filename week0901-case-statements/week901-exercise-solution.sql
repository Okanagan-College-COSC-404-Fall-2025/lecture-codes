CREATE OR REPLACE PACKAGE alStuff AS
  FUNCTION letter_Grade(p_grade NUMBER, adjustment NUMBER) RETURN CHAR;
  FUNCTION higher_Grades(p_grade NUMBER) RETURN VARCHAR2;
END alStuff;
/

CREATE OR REPLACE PACKAGE BODY alStuff AS

  FUNCTION letter_Grade(p_grade NUMBER, adjustment NUMBER) RETURN CHAR AS
    v_fail CHAR := 'F';
  BEGIN
    CASE 
      WHEN p_grade >= 90 - adjustment THEN RETURN 'A';
      WHEN p_grade >= 80 - adjustment THEN RETURN 'B';
      WHEN p_grade >= 70 - adjustment THEN RETURN 'C';
      WHEN p_grade >= 60 - adjustment THEN RETURN 'D';
      ELSE RETURN v_fail;
    END CASE;
  END letter_Grade;


  FUNCTION higher_Grades(p_grade NUMBER) RETURN VARCHAR2 AS
    CURSOR c_students IS
      SELECT s.student_id, s.stu_name, g.course_id, g.grade, c.cou_name
      FROM students s
      JOIN grades g ON s.student_id = g.student_id
      JOIN courses c ON c.course_id = g.course_id;

    TYPE StuRecord IS RECORD (
      SID    students.student_id%TYPE,
      sName  students.stu_name%TYPE,
      CID    grades.course_id%TYPE,
      grade  grades.grade%TYPE,
      CName  courses.cou_name%TYPE
    );

    v_SRec StuRecord;
    v_msg  VARCHAR2(1000) := '';
  BEGIN
    OPEN c_students;
    LOOP
      FETCH c_students INTO v_SRec;
      EXIT WHEN c_students%NOTFOUND;

      IF v_SRec.grade >= p_grade THEN
        v_msg := v_msg || v_SRec.sName || ' has a grade of ' || v_SRec.grade ||
                 ' in ' || v_SRec.CName || CHR(10);
      END IF;
    END LOOP;
    CLOSE c_students;

    RETURN v_msg;
  END higher_Grades;

END alStuff;
/

DECLARE
  v_result CHAR;
BEGIN
  v_result := alStuff.letter_Grade(85, 5);
  dbms_output.put_line('Letter Grade for 85 with adjustment 5: ' || v_result);
END;
/