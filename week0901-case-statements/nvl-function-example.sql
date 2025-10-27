-- Using the same employees table
-- employees(emp_id, emp_name, salary, bonus)

-- The NVL(expr1, expr2) function returns:
-- 	•	expr1 if it is not NULL,
-- 	•	otherwise returns expr2.

SELECT
  emp_name,
  salary,
  bonus,
  NVL(bonus, 0) AS bonus_with_default,
  salary + NVL(bonus, 0) AS total_pay
FROM employees;