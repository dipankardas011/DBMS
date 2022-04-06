set serveroutput ON;
declare
    m number;
    q number;
    res number;
begin
    m := &m;
    q := &q;
    res := m;
    loop
        EXIT when q = 1;
        res := res + m;
        q := q-1;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Ans: '||res);
end;