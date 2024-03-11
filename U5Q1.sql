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
FETCH IT_SPECIAL INTO emp_c;
EXIT WHEN IT_SPECIAL%notfound;
INSERT INTO DEPARTMENT(e_no,dept)VALUES(e_no_con,dept_con);
END LOOP;
CLOSE IT_SPECIAL;
END;
/