set serveroutput ON;
declare
    n number;
begin
    n := &n;
    DBMS_OUTPUT.PUT_LINE('Square: '||(n*n)||' Cube: '||(n*n*n));

end;