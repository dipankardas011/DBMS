create table employee(
    id NUMBER,
    name VARCHAR(20),
    salary NUMBER,
    qualif VARCHAR(20),
    qualif_id NUMBER
);

insert into employee values(1, 'emp', 2012344, 'B.Tech.', 23);
insert into employee values(11, 'emp', 50000, 'M.Tech.', 64);
insert into employee values(2, 'emp', 560000, 'Phd.', 13);
insert into employee values(12, 'emp', 5600002, 'B.S.', 1);
insert into employee values(123121, 'emp', 23434, 'Dr.', 43);
insert into employee values(1123, 'emp', 3444, 'Dr.', 43);
insert into employee values(1231, 'emp', 33344, 'Phd.', 13);
insert into employee values(31, 'emp', 56744, 'B.Tech.', 23);
insert into employee values(3, 'emp', 345, 'Gs', 3);

SET SERVEROUTPUT ON;
DECLARE
  nam EMPLOYEE.NAME%type;
  qId EMPLOYEE.QUALIF_ID%type;
  sall EMPLOYEE.SALARY%type;
  qualif EMPLOYEE.QUALIF%type;

  nam1 EMPLOYEE.NAME%type;
  qId1 EMPLOYEE.QUALIF_ID%type;
  sall1 EMPLOYEE.SALARY%type;
  qualif1 EMPLOYEE.QUALIF%type;

  CURSOR curEmp(qId EMPLOYEE.QUALIF_ID%TYPE) is 
    select NAME, SALARY, QUALIF, QUALIF_ID
      from EMPLOYEE WHERE qId = QUALIF_ID;
  err01 EXCEPTION;
  err02 EXCEPTION;

BEGIN
  qId := &qId;
  OPEN curEmp(qId);
  IF curEmp%ISOPEN THEN
    fetch curEmp into nam, sall, qualif, qId;
    IF curEmp%NOTFOUND THEN
      RAISE err02;
    END IF;

    fetch curEmp into nam1, sall1, qualif1, qId1;
    IF curEmp%FOUND THEN
      RAISE err01;
    ELSE
      DBMS_OUTPUT.PUT_LINE(nam||' '||sall||' '||qualif||' '||qId);
    END IF;
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('unable to open cursor');
  END IF;
  close curEmp;

  EXCEPTION
  WHEN err02 then
    DBMS_OUTPUT.PUT_LINE('No employees with such qualification');

  when err01 then
    DBMS_OUTPUT.PUT_LINE('More than one employee with such qualification');

END;