set serveroutput ON;
declare
    a number;
    b number;
    c number;
    d number;
begin
    a:=&a;
    b:=&b;
    c:=&c;
    d:=&d;

    if a < b AND a < c AND a < d then
        DBMS_OUTPUT.PUT_LINE('Smallest number '||a);
    ELSIF b < a AND b < c AND b < d then
        DBMS_OUTPUT.PUT_LINE('Smallest number '||b);
    ELSIF c < a AND b > c AND c < d then
        DBMS_OUTPUT.PUT_LINE('Smallest number '||c);
    else
        DBMS_OUTPUT.PUT_LINE('Smallest number '||d);
    end if;
end;