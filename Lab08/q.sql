-- Q1
create view stu_view1 as
select STUDENTID, FIRST, LAST, PHONE
from student;

select *
from stu_view1;

-- drop view stu_view1;

-- Q2
create view crss_view1
as
select *
from CRSSECTION
where SECTION = '02';

select *
from crss_view1;

-- drop view crss_view1;

-- Q3
create view fac_view1
as
select NAME, PHONE, DEPTNAME
from FACULTY,
     DEPARTMENT
where FACULTY.DEPTID = DEPARTMENT.DEPTID;

select *
from fac_view1;

-- drop view fac_view1;
-- Q4
create view fac_view2
as
select f.NAME, f.PHONE, d.DEPTNAME, l.BUILDING
from DEPARTMENT d,
     FACULTY f,
     LOCATION l
where f.DEPTID = d.DEPTID
  AND f.ROOMID = l.ROOMID;

select *
from fac_view2;

-- drop view fac_view2;

-- Q5
create view room_view1
as
select *
from room;

select *
from room_view1;

-- drop view room_view1;
-- Q6
insert into room_view1
values ('X', 'N/A');

-- Q7
delete
from room_view1
where ROOMTYPE = 'X';


-- Q8
create index stu_indx1 ON student (MAJORID);

-- drop index stu_indx1;

-- Q9
create sequence loc_seq1 INCREMENT BY 1 START WITH 23 maxvalue 26 NOCACHE;


-- SELECT loc_seq1.CURRVAL FROM DUAL;
-- SELECT loc_seq1.nextval FROM DUAL;

insert into LOCATION(roomid, building, roomno)
values (loc_seq1.nextval, 'X', 'Y');
insert into LOCATION(roomid, building, roomno)
values (loc_seq1.nextval, 'X1', 'Y1');
insert into LOCATION(roomid, building, roomno)
values (loc_seq1.nextval, 'X2', 'Y2');
insert into LOCATION(roomid, building, roomno)
values (loc_seq1.nextval, 'X3', 'Y3');

select *
from LOCATION;


delete
from LOCATION
where ROOMID IN(23, 24, 25, 26);
drop sequence loc_seq1;


-- Q10
create synonym address for location;
create synonym place for location;

select *
from address;

select *
from place;



drop synonym address;
drop synonym place;
