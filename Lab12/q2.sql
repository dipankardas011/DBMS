-- select user from dual;
create table TRACKING(
  id char(5),
  name varchar2(30),
  SySda date
);
set SERVEROUTPUT ON;
create or replace TRIGGER q2 after insert on student FOR EACH row
BEGIN
  insert into TRACKING values(:NEW.STUDENTID, :NEW.FIRST, SYSDATE);
END;

insert into student values('01111','ss','XYZ','213 Broadway','Clifton','NJ',07222,'WN03','07-JUL-84', 222, 200,'2015556666');
insert into student values('01221','ss1','XYZ1','213 Broadway','Clifton','NJ',07222,'WN03','07-JUL-84', 222, 200,'2015556666');