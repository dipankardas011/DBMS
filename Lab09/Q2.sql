SET serveroutput ON;
DECLARE
    N number;
    sq number;
    cu number;
    doN number;
BEGIN
    N := &N;
    sq := N * N;
    cu := N * N * N;
    doN := 2 * N;

    DBMS_OUTPUT.PUT_LINE('Square: '||sq);
    DBMS_OUTPUT.PUT_LINE('Cube: '||cu);
    DBMS_OUTPUT.PUT_LINE('Double: '||doN);
END;