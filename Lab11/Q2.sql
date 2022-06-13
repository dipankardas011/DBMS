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

set SERVEROUTPUT ON;
declare
    usree employee.id%type;
    baseEEE EMPLOYEE%ROWTYPE;
    CURSOR emp(usree employee.id%type) is select * from EMPLOYEE where usree = EMPLOYEE.id
        for update of SALARY nowait;
    errr EXCEPTION;
    invID EXCEPTION;
    PRAGMA EXCEPTION_INIT(invID, -20000);
begin
    usree := &usree;
    if usree = 100 then
        RAISE invID;
    end if;

    OPEN emp(usree);
    
    
    if emp%ISOPEN then
        fetch emp into baseEEE;
        if emp%NOTFOUND then
            RAISE errr;
        end if;
        UPDATE employee SET SALARY=1.15*baseEEE.SALARY WHERE CURRENT OF emp;
    
    else
        DBMS_OUTPUT.PUT_LINE('unable to open cursor');
    end if;
    
    close emp;
EXCEPTION
    when invID then
        DBMS_OUTPUT.PUT_LINE(SQLERRM||' This employee is suspended');
    when errr then
        DBMS_OUTPUT.PUT_LINE('No employee with given id');
END;

select * from EMPLOYEE;