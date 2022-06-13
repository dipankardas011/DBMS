set serveroutput ON;
declare
    str VARCHAR(30);
begin
    str := &str;
    str := LOWER(str);
    DBMS_OUTPUT.PUT_LINE('Lower: '||str);
    str := UPPER(str);
    DBMS_OUTPUT.PUT_LINE('Upper: '||str);
end;