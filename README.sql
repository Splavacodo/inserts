--Multi Inserts
INSERT ALL 
INTO employees_history VALUES (employee_id, first_name, last_name, hire_date) 
INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate), EXTRACT(month FROM sysdate), salary, commission_pct); 

--Conditional Insert
INSERT ALL 
WHEN hire_date > sysdate - 365 THEN 
  INTO employees_history VALUES (employee_id, first_name, last_name, hire_date) 
  INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate), EXTRACT(month FROM sysdate), salary, commission_pct) 
WHEN job_id = 'IT_PROG' THEN 
  INTO IT_PROGRAMMERS VALUES (employee_id, first_name, last_name, hire_date) 
WHEN department_id IN (select department_id from departments where location_id IN (select location_id from locations where country_id = 'US')) THEN 
  INTO living_in_us (employee_id, first_name, last_name, hire_date); 
  
--If-then-else Insert
INSERT FIRST 
WHEN salary < 5000 THEN 
  INTO low_salaries VALUES(employee_id, department_id, salary) 
WHEN salary BETWEEN 5000 and 10000 THEN
  INTO average_salaries VALUES(employee_id, department_id, salary)
ELSE 
  INTO high_salaries VALUES(employee_id, department_id, salary); 
