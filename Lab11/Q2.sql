set serveroutput ON;
DECLARE
    usree employee.id%type;
    errr EXCEPTION;
    invID EXCEPTION;
    PRAGMA EXCEPTION_INIT(invID, -20000);
BEGIN
    usree := &usree;
    if usree = 100 then
        RAISE invID;
        -- RAISE_APPLICATION_ERROR(-20000, 'Commission is negative');
    end if;
    update employee
        set salary = 1.15*salary
    where usree = id AND usree != 100;
    if usree < 0 then
        RAISE errr;
    end if;

    EXCEPTION
        when invID then
            DBMS_OUTPUT.PUT_LINE(SQLERRM||' This employee is suspended');
        when errr then
            DBMS_OUTPUT.PUT_LINE('NO -ve id');
        when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE('No employee with given id');
END;

select * from EMPLOYEE;