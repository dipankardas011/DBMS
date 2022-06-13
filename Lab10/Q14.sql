set serveroutput ON;
declare
    a number(10);
    sume number(10);
begin
    a := &a;
    sume := 0;
    loop
        EXIT when a <= 0;
        sume := sume + MOD(a, 10);
        a := a/10;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Sum of digits: '||sume);
end;