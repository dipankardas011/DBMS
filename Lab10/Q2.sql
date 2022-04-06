set serveroutput ON;
declare
    a number;
    b number;
    c number;
    d number;
    e number;
    sume number;
    avge float;
begin
    a:=&a;
    b:=&b;
    c:=&c;
    d:=&d;
    e:=&e;

    sume := a + b + c + d + e;
    avge:= sume / 5;
    DBMS_OUTPUT.PUT_LINE('Sum: '||sume||' Average: '||avge);

end;