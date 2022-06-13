set serveroutput ON;
declare
    amount number;
begin

    amount := &amount;
    if MOD(amount, 100) = 0 then
        DBMS_OUTPUT.PUT_LINE('YES');
    else
        DBMS_OUTPUT.PUT_LINE('NO');
    end if;
end;