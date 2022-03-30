SET serveroutput ON;
DECLARE
    a NUMBER;
    b NUMBER;
    temp NUMBER;
BEGIN
    a := &a;
    b := &b;

    DBMS_OUTPUT.PUT_LINE('@@ BEFORE SWAP @@');
    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);
    DBMS_OUTPUT.PUT_LINE('@@ AFTER SWAP @@');

    temp := a;
    a := b;
    b := temp;

    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);
END;