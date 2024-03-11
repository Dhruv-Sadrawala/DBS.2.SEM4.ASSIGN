--Create a table emp with fields eno, ename, department, salary
CREATE TABLE emp_t(e_no number(10),ename varchar2(30),dept varchar2(20),salary number(10));
CREATE TABLE EMPDEL(e_no number(10),ename varchar2(30),dept varchar2(20),salary number(10));
CREATE TABLE EMPINS(e_no number(10),ename varchar2(30),dept varchar2(20),salary number(10));

INSERT INTO emp_t(e_no,ename,dept,salary)VALUES(1,'ABC','SALES',20000);
INSERT INTO emp_t(e_no,ename,dept,salary)VALUES(2,'CBD','IT',35000);
INSERT INTO emp_t(e_no,ename,dept,salary)VALUES(3,'HDC','AC',12000);
INSERT INTO emp_t(e_no,ename,dept,salary)VALUES(4,'MNM','SALES',40000);
INSERT INTO emp_t(e_no,ename,dept,salary)VALUES(5,'SPO','IT',36000);

--Write a database trigger store the deleted data of EMP table in EMPDEL table.

CREATE OR REPLACE TRIGGER DELETED_STORAGE
BEFORE DELETE ON emp_t
FOR EACH ROW
BEGIN
INSERT INTO EMPDEL VALUES(:OLD.e_no,:OLD.ename,:OLD.dept,:OLD.salary);
END;
/

-- Write a database trigger to update salary in employee table and it shows salary 
--difference before updating data.

CREATE OR REPLACE TRIGGER UPDATE_SAL
BEFORE UPDATE ON emp_t
FOR EACH ROW
DECLARE
sal_diff number(20);
BEGIN
sal_diff:= :NEW.salary - :OLD.salary;
DBMS_OUTPUT.PUT_LINE('Difference in Salary:'||sal_diff);
END;
/

--Write a trigger to store eid,department,salary to new table before 
--inserting a new record into emp table.

CREATE OR REPLACE TRIGGER INSERT_TRIGGER
BEFORE INSERT ON emp_t
FOR EACH ROW
BEGIN
INSERT INTO EMPINS VALUES(:NEW.e_no,:NEW.ename,:NEW.dept,:NEW.salary);
END;
/

--Write a trigger to store employee details into new table who is working in ‘IT’ department.
