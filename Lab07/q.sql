-- Q1
select NAME, PHONE from FACULTY
    where FACULTYID = (
        select STUDENT.FACULTYID from STUDENT
            where LAST='Diaz' and FIRST='Jose'
    );

-- Q2
select ROOMTYPE, CAPACITY from (
    select ROOMTYPE, CAPACITY from LOCATION
        group by ROOMTYPE, CAPACITY
            order by CAPACITY asc
    ) where ROWNUM <= 2;

-- Q3
select * from (
        select *
            from crssection
                where TERMID like '%SP03%'
            order by MAXCOUNT desc
         ) where ROWNUM <= 3 ;

-- Q4
select * from (
        select *
            from LOCATION
        where ROOMTYPE='C'
    );

-- Q5
create table SP03SECT( CourseId, Section, FacultyId,RoomId )
   as select CourseId, Section, FacultyId,RoomId
  from (
      select * from CRSSECTION
        where TERMID like '%SP03%'
    );

select * from SP03SECT;

-- drop table SP03SECT;

-- Q6
delete from SP03SECT where FACULTYID = (
    select FACULTY.FACULTYID from FACULTY
        where NAME like 'Mobley'
    );
select * from SP03SECT;

-- Q7
select name from FACULTY where FACULTYID IN (
    select FACULTYID
    from CRSSECTION c
        where not exists (
        select CourseId
            from SP03SECT s
            where c.COURSEID=s.COURSEID
              and c.SECTION=s.SECTION
              and c.ROOMID=s.ROOMID
        )
    );


-- Q8
select * from (
    select COURSEID, TITLE from COURSE
        where PREREQ like '%EN100%'
    );

-- Q9
select STUDENTID, first||' '||last as name, city from STUDENT
    where STARTTERM = (
        select TERMID from TERM
            where TERMDESC like '%W%2003%'
    );

-- Q10
select STUDENTID, first||' '||last as name, city from STUDENT
    where STUDENTID IN(
        select STUDENTID from REGISTRATION
            where REGSTATUS = 'R'
    );
