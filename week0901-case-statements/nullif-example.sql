-- Create a simple table
DROP TABLE employees;
CREATE TABLE employees (
  emp_id NUMBER,
  emp_name VARCHAR2(20),
  salary NUMBER,
  bonus NUMBER
);

-- Insert data
INSERT INTO employees VALUES (1, 'Alice', 5000, 5000);
INSERT INTO employees VALUES (2, 'Bob',   4000, 3000);
INSERT INTO employees VALUES (3, 'Carol', 6000, NULL);

COMMIT;

-- Example using NULLIF
SELECT 
  emp_name,
  salary,
  bonus,
  NULLIF(salary, bonus) AS nullif_result
FROM employees;