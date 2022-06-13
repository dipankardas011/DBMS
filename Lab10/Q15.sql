set serveroutput ON;
declare
    a number(10);
    tempA number(10);
    newA number(10);
    flag boolean;
begin
    a := &a;
    tempA := a;
    newA := 0;

    loop
        EXIT when tempA <= 0;
        newA := newA*10 + MOD(tempA, 10);
        tempA := tempA/10;
    end loop;

    flag := true;
    loop
        EXIT when a <= 0;
        if MOD(a, 10) != MOD(newA, 10) then
            flag := false;
            EXIT;
        end if;
        a := a/10;
        newA := newA/10;
    end loop;
    if flag then
        DBMS_OUTPUT.PUT_LINE('Palindrome');
    else
        DBMS_OUTPUT.PUT_LINE('Not Palindrome');
    end if;
end;