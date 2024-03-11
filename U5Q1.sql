--Create a table emp with fields eno, ename, department, salary
CREATE TABLE emp_c(e_no number(10),ename varchar2(30),dept varchar2(20),salary number(10));
CREATE TABLE DEPARTMENT(e_no number(10),dept varchar2(20));

INSERT INTO emp_c(e_no,ename,dept,salary)VALUES(1,'FGC','SALES',45000);
INSERT INTO emp_c(e_no,ename,dept,salary)VALUES(2,'TYU','SALES',45000);
INSERT INTO emp_c(e_no,ename,dept,salary)VALUES(3,'ILA','IT',45000);
INSERT INTO emp_c(e_no,ename,dept,salary)VALUES(4,'ASK','MARKETING',45000);
INSERT INTO emp_c(e_no,ename,dept,salary)VALUES(5,'OAS','AC',45000);

--Create an explicit cursor to store the employee data who is working 
--in ‘IT’ department into department table.


DECLARE
e_no_con emp_c.e_no%TYPE;
ename_con emp_c.ename%TYPE;
dept_con emp_c.dept%TYPE;
salary_con emp_c.salary%TYPE;
CURSOR IT_SPECIAL IS
SELECT * FROM emp_c WHERE dept='IT';
BEGIN
OPEN IT_SPECIAL;
LOOP
FETCH IT_SPECIAL INTO e_no_con,ename_con,dept_con,salary_con;
EXIT WHEN IT_SPECIAL%notfound;
INSERT INTO DEPARTMENT(e_no,dept)VALUES(e_no_con,dept_con);
DBMS_OUTPUT.PUT_LINE('E no:' ||e_no_con ||' Department:'||dept_con);
END LOOP;
CLOSE IT_SPECIAL;
END;
/

-- Create an explicit cursor to display data in sorted order salary wise in descending form.

DECLARE
e_no_con emp_c.e_no%TYPE;
ename_con emp_c.ename%TYPE;
dept_con emp_c.dept%TYPE;
salary_con emp_c.salary%TYPE;
CURSOR SORT_DESC IS
SELECT * FROM emp_c ORDER BY SALARY DESC;
BEGIN
OPEN SORT_DESC;
LOOP
FETCH SORT_DESC INTO e_no_con, ename_con, dept_con, salary_con;
EXIT WHEN SORT_DESC%notfound;
DBMS_OUTPUT.PUT_LINE('ENO:'||e_no_con||' NAME:'||ename_con||' DEPT:'||dept_con||' SALARY:'||salary_con);
END LOOP;
CLOSE SORT_DESC;
END;
/

--Create an explicit cursor to increase salary by 3% who is working in ‘finance’ department.

BEGIN
e_no_con emp_c.e_no%TYPE;
salary_con emp_c.salary%TYPE;
dept_con emp_c.dept%TYPE;
CURSOR INCREMENT IS
SELECT * FROM emp_c WHERE dept='AC';
BEGIN
OPEN INCREMENT
LOOP
FETCH INCREMENT INTO salary,dept INTO salary_con,dept_con;
EXIT WHEN INCREMENT%notfound;
UPDATE salary SET salary=salary+0.3 WHERE e_no=e_no_con;
DBMS_OUTPUT.PUT_LINE('SALARY UPDATED FOR:'||e_no_con);
END LOOP;
CLOSE INCREMENT;
END;
/
