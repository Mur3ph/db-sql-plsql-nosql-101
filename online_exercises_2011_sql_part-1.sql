-- Describe the object in detail (i.e. Columns data types)
DESC COUNTRIES;
DESC DEPARTMENTS;
DESC EMPLOYEES;
DESC JOB_HISTORY;
DESC JOBS;
DESC LOCATIONS;
DESC REGIONS;

-- Display details of jobs where the minimum salary is greater than 10000 ?
DESC JOBS;

SELECT JOB_ID , JOB_TITLE , MIN_SALARY , MAX_SALARY  
FROM JOBS 
WHERE MIN_SALARY > 10000;

--Display the first name and join date of the employees who joined between 2002 and 2005 ?

-- Mine
DESC EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('1.1.' || 2002, 'DD.MM.YYYY') 
AND TO_DATE('1.1.' || 2005, 'DD.MM.YYYY')
ORDER BY HIRE_DATE;

-- Other guy
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2002 AND 2005 
ORDER BY HIRE_DATE;

-- Display first name and join date of the employees who is either IT Programmer or Sales Manager ?
-- Mine
SELECT JOB_ID FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
OR JOB_ID = 'SA_MAN';

-- Other guy
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES 
WHERE JOB_ID IN ('IT_PROG', 'SA_MAN');

-- Display employees who joined after 1st January 2008 ?
-- Mine
DESC EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE > TO_DATE('1.1.' || 2008, 'DD.MM.YYYY');

-- Other guy
SELECT * 
FROM EMPLOYEES  
where hire_date > '01-jan-2008';

-- Display details of employee with ID 150 or 160 ?
-- If the values are constant 'IN' sorts the list and then uses a binary search. 
-- I would imagine that 'OR' evaluates them one by one in no particular order. 
-- So 'IN' is faster in some circumstances
DESC EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(150, 160);

-- Display first name, salary, commission pct, and hire date for employees with salary less than 10000 ?
DESC EMPLOYEES;
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY < 10000;

-- Display job Title, the difference between minimum and maximum salaries for jobs with max salary in the range 10000 to 20000 ?
-- Mine
DESC EMPLOYEES;
DESC JOBS;
SELECT j.JOB_TITLE, (j.MAX_SALARY - j.MIN_SALARY) AS Max_Min_Salary_Difference
FROM JOBS j
WHERE j.MAX_SALARY BETWEEN 10000 AND 20000
ORDER BY Max_Min_Salary_Difference ASC;
-- ORDER BY Max_Min_Salary_Difference DESC;

-- Display first name, salary, and round the salary to thousands ?


