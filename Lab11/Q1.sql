create table employee(
    id number,
    first varchar(20),
    salary number(10),
    hireDate date
);
set serveroutput ON;

insert into employee values(01, 'emp', 2012344, '12-Oct-2001');
insert into employee values(11, 'emp', 50000, '11-Mar-2021');
insert into employee values(02, 'emp', 560000, '17-May-1990');
insert into employee values(012, 'emp', 5600002, '17-Jun-1990');
insert into employee values(123121, 'emp', 23434, '1-Nov-2019');
insert into employee values(1123, 'emp', 3444, '12-Jan-2020');
insert into employee values(1231, 'emp', 33344, '21-Oct-2000');
insert into employee values(31, 'emp', 56744, '12-Oct-2001');
insert into employee values(100, 'emp', 345, '28-Feb-2022');

DECLARE
    IDID employee.id%type;
    ft employee.first%type;
    sall employee.salary%type;
    dat employee.hireDate%type;
    usree employee.id%type;
    errr EXCEPTION;
BEGIN
    usree := &usree;
    select id, first, salary, hireDate into IDID, ft, sall, dat from employee where usree=id;
    if usree < 0 then
        RAISE errr;
    else
        DBMS_OUTPUT.PUT_LINE(IDID||' '||ft||' '||sall||' '||dat);
    end if;

    EXCEPTION
        when errr then
            DBMS_OUTPUT.PUT_LINE('NO -ve id');
        when OTHERS then
            DBMS_OUTPUT.PUT_LINE('No employee with given id');
END;