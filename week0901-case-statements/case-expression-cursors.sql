DECLARE
    CURSOR c_avg_grades IS
        SELECT s.program,
               AVG(CASE WHEN g.course_id = 'BUAD123' THEN g.grade END) AS BUAD123,
               AVG(CASE WHEN g.course_id = 'COSC118' THEN g.grade END) AS COSC118
        FROM students s
        LEFT JOIN grades g ON s.student_id = g.student_id
        GROUP BY s.program;
    TYPE avgRecord IS RECORD (
        v_pro varchar2(40),
        v_avg1 number,
        v_avg2 number
    );
    v_avgRecord avgRecord;
BEGIN
    OPEN c_avg_grades;
    LOOP
        FETCH c_avg_grades INTO v_avgRecord;
        EXIT WHEN c_avg_grades%NOTFOUND;
CASE
        WHEN v_avgRecord.v_avg1 IS NOT NULL AND v_avgRecord.v_avg2 IS NOT NULL THEN 
            dbms_output.put_line('Program: ' || v_avgRecord.v_pro);
            dbms_output.put_line('COSC111 Average: ' || v_avgRecord.v_avg1);
            dbms_output.put_line('COSC121 Average: ' || v_avgRecord.v_avg2);
        ELSE 
            dbms_output.put_line('No students in that program: ' || v_avgRecord.v_pro);
        END CASE;
    END LOOP;
    CLOSE c_avg_grades;
END;
