--Create table employee with fields eno, ename, department, designation, salary. 
--Create table person with pid,pname,age,height,weight,bloodgroup
create table employee_p(e_no number(5),e_name varchar2(50),dept varchar(10),desig varchar2(10),salary number(10));
create table person(p_id number(5),p_name varchar2(50),age number(5),height number(5),weight number(5),blood_g varchar2(5));

insert into employee_p(e_no,e_name,dept,desig,salary)values(1,'ABC','IT','MANAGER',12000);
insert into employee_p(e_no,e_name,dept,desig,salary)values(2,'SYS','SALES','MANAGER',50000);
insert into employee_p(e_no,e_name,dept,desig,salary)values(3,'HCV','AC','CELRK',20000);
insert into employee_p(e_no,e_name,dept,desig,salary)values(4,'HVF','IT','CELRK',35000);
insert into employee_p(e_no,e_name,dept,desig,salary)values(5,'KJG','IT','CELRK',45000);

insert into person(p_id,p_name,age,height,weight,blood_g)values(1,'XYE',20,5,45,'A+');
insert into person(p_id,p_name,age,height,weight,blood_g)values(2,'HCB',35,6,50,'B-');
insert into person(p_id,p_name,age,height,weight,blood_g)values(3,'LAL',25,7,55,'B+');
insert into person(p_id,p_name,age,height,weight,blood_g)values(4,'AOS',63,5,45,'O+');
insert into person(p_id,p_name,age,height,weight,blood_g)values(5,'PAS',70,4,63,'A-');
insert into person(p_id,p_name,age,height,weight,blood_g)values(6,'SSV',28,7,78,'O-');


-- Write a procedure to display employee details whose department is ‘it’ and designation is ‘manager’

CREATE OR REPLACE PROCEDURE NAME_DEG AS
e_name_d employee_p.e_name%TYPE;
dept_d employee_p.dept%TYPE;
desig_d employee_p.desig%TYPE;
BEGIN 
SELECT e_name,dept,desig
INTO e_name_d,dept_d,desig_d 
FROM 
employee_p WHERE 
dept='IT' AND desig='MANAGER';
DBMS_OUTPUT.PUT_LINE('Name:'||e_name_d||' Dept:'||dept_d||' Desig:'||desig_d);
END NAME_DEG;
/

BEGIN
NAME_DEG;
END;
/

--Write a procedure to update salary of the employee whose name starts with ‘a’

CREATE OR REPLACE PROCEDURE update_sal AS
salary_d employee_p.salary%TYPE;
e_name_d employee_p.e_name%TYPE; 
BEGIN
UPDATE employee_p SET salary='20000' WHERE e_name like'A%';
END update_sal;
/

BEGIN
update_sal;
END;
/

--Write a procedure to delete the record from employee whose department is finance.

CREATE OR REPLACE PROCEDURE rem_ac AS
BEGIN
DELETE FROM employee_p WHERE dept='AC';
END rem_ac;
/

BEGIN
rem_ac;
END;
/

--Write a function to display data from person table who is oldest.

CREATE OR REPLACE FUNCTION OLD_RET
RETURN number AS
max_age number(10);
BEGIN
SELECT MAX(age) INTO max_age FROM person;
RETURN max_age;
END OLD_RET;
/

DECLARE
    MAX_CON INT;
BEGIN
    MAX_CON := MAXAGE();
    DBMS_OUTPUT.PUT_LINE('Max age is: ' || MAX_CON);
END;
/

-- Write a function to display total heights of all persons.

CREATE OR REPLACE FUNCTION TOTAL_HEIGHT
RETURN number AS
total_height number(10);
BEGIN
SELECT sum(height) INTO total_height FROM person;
RETURN total_height;
END TOTAL_HEIGHT;
/

DECLARE
total_height_con number(10);
BEGIN
total_height_con:=TOTAL_HEIGHT();
DBMS_OUTPUT.PUT_LINE('Total height:'||total_height_con);
END;
/

--Write a function to display average weight of the persons.
CREATE OR REPLACE FUNCTION AVG_WEIGHT
RETURN number AS
avg_weight number(20);
BEGIN
SELECT avg(weight) INTO avg_weight FROM person;
RETURN avg_weight;
END AVG_WEIGHT;
/

DECLARE
AVG_WEIGHT_CON number(20);
BEGIN
AVG_WEIGHT_CON:=AVG_WEIGHT();
DBMS_OUTPUT.PUT_LINE('Average Weight is:'||AVG_WEIGHT_CON);
END;
/

-- Write a function to display minimum salary of employee.

CREATE OR REPLACE FUNCTION MIN_SAL
RETURN number AS
MIN_SAL number(20);
BEGIN
SELECT min(salary) INTO MIN_SAL FROM employee_p;
RETURN MIN_SAL;
END;
/

DECLARE
MIN_SAL_CON number(20);
BEGIN
MIN_SAL_CON:=MIN_SAL();
DBMS_OUTPUT.PUT_LINE('Minimum Salary:'||MIN_SAL_CON);
END;
/

--Write PL/SQL block to fetch the details of employee whose 
--eid is 3 and check that salary is above 50000 or not if salary is above 50000 then display 
--data otherwise raise an exception and print proper message.

DECLARE
e_no_con employee_p.e_no%TYPE;
salary_con employee_p.salary%TYPE;
LESS_SALARY EXCEPTION;
BEGIN
SELECT e_no, salary INTO e_no_con, salary_con FROM employee_p WHERE e_no = 3;
IF e_no_con = 3 AND salary_con < 50000 THEN
RAISE LESS_SALARY;
ELSE
DBMS_OUTPUT.PUT_LINE('No less salary issue for e_no ' || e_no_con);
END IF;
EXCEPTION
WHEN LESS_SALARY THEN
DBMS_OUTPUT.PUT_LINE('Less Salary than 50000');
END;
/

--Write a procedure to display person’s details whose age is 20.

CREATE OR REPLACE PROCEDURE AGE_20 AS
p_id_con person.p_id%TYPE;
name_con person.p_name%TYPE;
age_con person.age%TYPE;
height_con person.height%TYPE;
weight_con person.weight%TYPE;
blood_g_con person.blood_g%TYPE;
BEGIN
SELECT p_id,p_name,age,height,weight,blood_g INTO
p_id_con,name_con,age_con,height_con,weight_con,blood_g_con
FROM person WHERE age=20;
DBMS_OUTPUT.PUT_LINE('PID:'||p_id_con||' NAME:'||name_con||' AGE:'||age_con||' HEIGHT:'||height_con||' WEIGHT:'||weight_con||' BLOOD GROUP:'||blood_g_con);
END AGE_20;
/

BEGIN
AGE_20;
END;
/

--Write PL/SQL block to fetch the data of person whose pid is 4. 
--check the age is above 18 or not if age is above 18 then print 
--‘you are elligible for voting’ else print ‘not elligible’.

CREATE OR REPLACE PROCEDURE ABOVE_18 AS
p_id_con person.p_id%TYPE;
age_con person.age%TYPE;
BEGIN
SELECT p_id,age INTO p_id_con,age_con FROM person WHERE p_id=4;
IF age_con<18 THEN
DBMS_OUTPUT.PUT_LINE('Not Eligible');
ELSE
DBMS_OUTPUT.PUT_LINE('Eligible');
END IF;
END ABOVE_18;
/