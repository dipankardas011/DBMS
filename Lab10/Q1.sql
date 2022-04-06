set serveroutput ON;
declare
    a number;
    b number;
    c number;
begin
    a:=&a;
    b:=&b;
    c:=&c;

    if a > b AND a > c then

        DBMS_OUTPUT.PUT_LINE('Largest number '||a);
    ELSIF b > a AND b > c then
        DBMS_OUTPUT.PUT_LINE('Largest number '||b);
    else
        DBMS_OUTPUT.PUT_LINE('Largest number '||c);
    end if;
end;