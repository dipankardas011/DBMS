create table demoEmp (
    id number PRIMARY KEY,
    name varchar(15),
    qualification varchar2(20),
    salary float,
    commission float
);

insert into demoEmp values(324, 'emp01', 'B.Tech. P.h.2324', 200.01, 23.5);
insert into demoEmp values(321, 'emp02', 'M.Tech. P.h.245', 210.01, 12.5);
insert into demoEmp values(334, 'emp14', 'B.Tech. P.h.543', 204.01, 3.5);
insert into demoEmp values(4, 'emp11', 'B.Tech. P.h.345', 203241, 223.5);
insert into demoEmp values(24, 'emp121', 'B.Tech. P.h.867', 2023445.01, 1123.5);
insert into demoEmp values(300, 'emp16', 'B.Tech. P.h.65', 20234.1, 113.5);

select * from demoEmp;
SET serveroutput ON;
DECLARE
    N number;
    emp demoEmp%rowtype;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter the id');
    N := &N;
    select * INTO emp from demoEmp where demoEmp.id = N;

    DBMS_OUTPUT.PUT_LINE('Name: '||emp.name||' | Qualification: '||emp.qualification||' | Salary: '||emp.salary||' | Commission: '||emp.commission);
END;
-- drop table demoEmp;
/ -- this required when executing it in sqlplus cmd
