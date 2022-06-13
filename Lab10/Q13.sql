set serveroutput ON;
declare
    a number;
    iter number;
begin
    a := &a;
    for iter in 1 .. 10 loop
        DBMS_OUTPUT.PUT_LINE(a||' X '||iter||' = '||(a*iter));
    end loop;
end;