set serveroutput ON;
declare
    lastN employee.last%type;
    firsrN employee.first%type;
    salaryN employee.salary%type;
    hireDateN employee.hireDate%type;
    CURSOR emmp(salaryN employee.salary%TYPE) is select last, first, salary, hireDate from employee
        WHERE salary > salaryN;
begin
    salaryN := &salaryN;
    OPEN emmp(salaryN);
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