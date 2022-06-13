set serveroutput ON;
declare
    n number;
    ii number;
    sume number;
begin
    n := &n;
    sume := 0;
    for ii in 1 .. n loop
        sume := sume + ii;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Ans: '||sume);
end;