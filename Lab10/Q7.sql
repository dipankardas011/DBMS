set serveroutput ON;
declare
    n number;
    iter number;
    flag number;
begin
    n:=&n;
    flag := 0;
    for iter in 2 .. (n-1) loop
        if MOD(n, iter) = 0 then
            DBMS_OUTPUT.PUT_LINE('NOT Prime');
            flag := 1;
            EXIT;
        end if;
    end loop;
    if flag = 0 then
    DBMS_OUTPUT.PUT_LINE('Prime');
    end if;
end;