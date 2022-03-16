-- Q1
select NAME, PHONE from FACULTY
    where FACULTYID = (
        select STUDENT.FACULTYID from STUDENT where LAST='Diaz' and FIRST='Jose'
    );

-- Q2
select ROOMTYPE, CAPACITY from (
                select ROOMTYPE, CAPACITY from LOCATION
                    group by ROOMTYPE, CAPACITY
                        order by CAPACITY asc
        ) where ROWNUM <= 2;

-- Q3
select * from (
                      select * from crssection
                            where TERMID like '%SP03%'
                        order by MAXCOUNT desc
            ) where ROWNUM <= 3 ;

-- Q4
select * from (
              select * from LOCATION where ROOMTYPE='C'
                  );

-- Q5
create table SP03SECT(
    CourseId, Section, FacultyId,RoomId
  )
   as select
    CourseId, Section, FacultyId,RoomId
  from (
      select * from CRSSECTION where TERMID like '%SP03%'
);

select * from SP03SECT;

-- drop table SP03SECT;

-- Q6
delete from SP03SECT where FACULTYID = (
    select FACULTY.FACULTYID from FACULTY where NAME like 'Mobley'
    );
select * from SP03SECT;
