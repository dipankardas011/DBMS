create table employee(
    last varchar(20),
    first varchar(20),
    salary number(10),
    hireDate date
);

insert into employee values('01', 'emp', 2012344, '12-Oct-2001');
insert into employee values('11', 'emp', 50000, '11-Mar-2021');
insert into employee values('02', 'emp', 560000, '17-May-1990');
insert into employee values('012', 'emp', 5600002, '17-Jun-1990');
insert into employee values('123121', 'emp', 23434, '1-Nov-2019');
insert into employee values('1123', 'emp', 3444, '12-Jan-2020');
insert into employee values('1231', 'emp', 33344, '21-Oct-2000');
insert into employee values('31', 'emp', 56744, '12-Oct-2001');
insert into employee values('02', 'emp', 345, '28-Feb-2022');


set serveroutput ON;
declare
    CURSOR emmp is select last, first, salary, hireDate from employee
        WHERE salary>50000 AND hireDate < date '1997-12-31';
    lastN employee.last%type;
    firsrN employee.first%type;
    salaryN employee.salary%type;
    hireDateN employee.hireDate%type;
begin
    OPEN emmp;
    if emmp%ISOPEN then
        LOOP
            fetch emmp into lastN, firsrN, salaryN, hireDateN;
            exit when emmp%NOTFOUND;
            if emmp%FOUND then
                DBMS_OUTPUT.PUT_LINE(firsrN||' '||lastN||' ; '||salaryN||' ; '||hireDateN);
            end if;
        end loop;
    else
        DBMS_OUTPUT.PUT_LINE('unable to open cursor');
    end if;
    close emmp;
end;