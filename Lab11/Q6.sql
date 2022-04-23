set SERVEROUTPUT on;


CREATE OR REPLACE PACKAGE q6 AS
  procedure rooom(A location.ROOMNO%TYPE);
  FUNCTION crssss(A CRSSECTION.CSID%TYPE) return NUMBER;
end q6;

CREATE OR REPLACE PACKAGE BODY q6 AS

    procedure rooom(A location.ROOMNO%TYPE) 
    is
      dd NUMBER;
      errr EXCEPTION;
      cappp LOCATION.CAPACITY%type;
      bbb LOCATION.BUILDING%type;

    begin
      select count(*) into dd from location where LOCATION.ROOMNO=A;
      if dd = 0 THEN
        raise errr;
      end if;
      select CAPACITY, BUILDING into cappp, bbb from location where LOCATION.ROOMNO=A;
      dbms_output.PUT_LINE(cappp||' '||bbb);
    EXCEPTION
      when errr then
        DBMS_OUTPUT.PUT_LINE('no entries wrt given room number');
    end rooom;

    FUNCTION crssss(A CRSSECTION.CSID%TYPE)
    RETURN NUMBER is
    maxC number;
    BEGIN
      select MAXCOUNT into maxC from CRSSECTION where CSID=A;
      return maxC;
    end crssss;
END q6;

-- -------------------------------------------------------
DECLARE 
  c number;
  xx1 number;
  xx2 number;
BEGIN
  xx1 := &xx1;
  q6.rooom(xx1);

  xx2 := &xx2;
  c := q6.crssss(xx2);
  dbms_output.put_line('max count '||c);
END; 