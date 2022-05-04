create table employee(
    id number,
    first varchar(20),
    salary number(10),
    hireDate date
);

insert into employee values(01, 'emp', 2012344, '12-Oct-2001');
insert into employee values(11, 'emp', 50000, '11-Mar-2021');
insert into employee values(02, 'emp', 560000, '17-May-1990');
insert into employee values(012, 'emp', 5600002, '17-Jun-1990');
insert into employee values(123121, 'emp', 23434, '1-Nov-2019');
insert into employee values(1123, 'emp', 3444, '12-Jan-2020');
insert into employee values(1231, 'emp', 33344, '21-Oct-2000');
insert into employee values(31, 'emp', 56744, '12-Oct-2001');
insert into employee values(100, 'emp', 345, '28-Feb-2022');
set serveroutput ON;

CREATE OR REPLACE TRIGGER nice BEFORE INSERT OR DELETE OR UPDATE ON employee FOR EACH ROW
DECLARE
  currDate varchar(12);
BEGIN
  SELECT TO_CHAR(SYSDATE, 'DAY') INTO currDate FROM dual;
  IF (currDate = 'SUNDAY') THEN
    DBMS_OUTPUT.PUT_LINE('Its Allowed');
  ELSE
    RAISE_APPLICATION_ERROR(-20024,'DML not allowed in other days');
  END IF;
END;
