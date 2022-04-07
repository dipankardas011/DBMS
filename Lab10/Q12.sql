set serveroutput ON;
declare
    a number;
    b number;
begin
    a := &a;
    b := &b;
    loop
        EXIT when a > b;
        if MOD(a, 2) = 1 then
            DBMS_OUTPUT.PUT_LINE(a);
        end if;

        a := a + 1;
    end loop;
end;