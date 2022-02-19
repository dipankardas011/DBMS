-- Q1
select s.first||' '||s.last as name, m.majordesc
    from student s, major m
where s.majorid=m.majorid;

-- Q2
select s.first||' '||s.last as name, r.final
    from student s, registration r
    where s.studentid=r.studentid AND s.STARTTERM='WN03' AND r.final='F';

-- Q3
select first||' '||last as name, faculty.name, building from student, faculty, location
  where student.facultyid=faculty.facultyid AND location.roomid=faculty.roomid;

-- Q4
select title as courseName, faculty.name
    from course, crssection left outer join faculty
        ON faculty.facultyid=crssection.facultyid
    WHERE course.COURSEID=CRSSECTION.COURSEID AND CRSSECTION.TERMID='SP03';

-- Q5
select c1.title course, c2.prereq
    from course c1 left outer join course c2
        on c1.courseid=c2.courseid;

-- Q6
-- select roomid, building from location where roomtype='O';
select roomid, building, ROOM.ROOMTYPE
    from location, room
where room.ROOMTYPE=location.ROOMTYPE AND room.roomtype='O';

-- Q7
select f.name, d.deptname from faculty f, department d where d.deptid=1;

-- Q8
select name, building
    from faculty, location
where location.roomid=faculty.roomid AND faculty.deptid=3;