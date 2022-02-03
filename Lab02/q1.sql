-- 1 Student
CREATE TABLE student (
    studentID CHAR(5) PRIMARY KEY,
    last VARCHAR2(15) NOT NULL,
    first VARCHAR2(15) NOT NULL,
    street VARCHAR2(25),
    city VARCHAR2(15),
    state VARCHAR(2) DEFAULT 'NJ',
    zip VARCHAR(5),
    startterm CHAR(4),
    birthday DATE,
    facultyID NUMBER(3),
    majorID NUMBER(3),
    phone CHAR(10)
);
ALTER TABLE student ADD FOREIGN KEY(facultyID) 
 REFERENCES faculty(facultyID);
ALTER TABLE student ADD FOREIGN KEY(startterm) 
 REFERENCES term(termID);
ALTER TABLE student ADD FOREIGN KEY(majorID) 
 REFERENCES major(majorID);


-- 2 faculty
CREATE TABLE faculty(
    facultyID NUMBER(3) PRIMARY KEY,
    name VARCHAR2(15) NOT NULL,
    roomID NUMBER(2),
    phone CHAR(3) UNIQUE,
    deptID NUMBER(1)
);
ALTER TABLE faculty ADD FOREIGN KEY(roomID) 
 REFERENCES location(roomID);
ALTER TABLE faculty ADD FOREIGN KEY(deptID) 
 REFERENCES department(deptID);




-- 3 crssection
CREATE TABLE crssection(
    csID NUMBER(4) PRIMARY KEY,
    courseID VARCHAR2(6),
    section CHAR(2) NOT NULL,
    termID CHAR(4),
    facultyID NUMBER(3),
    day VARCHAR2(2),
    starttime VARCHAR2(5),
    endtime VARCHAR2(5),
    roomID NUMBER(2),
    maxcount NUMBER(2) CHECK(maxcount>0)
);

ALTER TABLE crssection ADD FOREIGN KEY(courseID) 
 REFERENCES course(courseID);
ALTER TABLE crssection ADD FOREIGN KEY(termID) 
 REFERENCES term(TermID);
ALTER TABLE crssection ADD FOREIGN KEY(facultyID) 
 REFERENCES faculty(facultyID);
ALTER TABLE crssection ADD FOREIGN KEY(roomID) 
 REFERENCES location(roomID);


-- 4 course
CREATE TABLE course(
    courseID VARCHAR2(6) PRIMARY KEY,
    title VARCHAR2(20) UNIQUE,
    credits NUMBER(1) CHECK(credits>=0 AND credits<=4),
    prereq VARCHAR2(6)
);

ALTER TABLE course ADD FOREIGN KEY(prereq) 
 REFERENCES course(courseID);

-- registration
CREATE TABLE registration(
    studentID CHAR(5) PRIMARY KEY,
    csID NUMBER(4),
    midterm CHAR(1) CHECK(midterm='A' OR 
                        midterm='B' OR 
                        midterm='C' OR
                        midterm='D' OR
                        midterm='F' OR
                        midterm='W'),
    final CHAR(1) CHECK(final='A' OR 
                        final='B' OR 
                        final='C' OR
                        final='D' OR
                        final='I' OR
                        final='F' OR
                        final='W'),
    regstatus CHAR(1) CHECK(regstatus='X' OR 
                        regstatus='R' OR 
                        regstatus='W')                    
);

ALTER TABLE registration ADD FOREIGN KEY(studentID) 
 REFERENCES student(studentID);
ALTER TABLE registration ADD FOREIGN KEY(csID) 
 REFERENCES crssection(csID);

-- rooom
CREATE TABLE room(
    roomtype CHAR(1) PRIMARY KEY,
    roomdesc VARCHAR2(9)
);

-- location
CREATE TABLE location(
    roomID NUMBER(2) PRIMARY KEY,
    building VARCHAR2(7) NOT NULL,
    roomno CHAR(3) NOT NULL UNIQUE,
    capacity NUMBER(2) CHECK(capacity > 0),
    roomtype CHAR(1)
);

ALTER TABLE location ADD FOREIGN KEY(roomtype) 
 REFERENCES room(roomtype);

-- term
CREATE TABLE term(
    termID CHAR(4) PRIMARY KEY,
    termdesc VARCHAR2(11),
    startdate DATE,
    enddate DATE
);

-- department
CREATE TABLE department(
    deptID NUMBER(1) PRIMARY KEY,
    depatname VARCHAR2(20),
    facultyID NUMBER(3)
);

ALTER TABLE department ADD FOREIGN KEY(facultyID) 
 REFERENCES faculty(facultyID);

-- major
CREATE TABLE major(
    majorID NUMBER(3) PRIMARY KEY,
    majordesc VARCHAR2(25)
);

select constraint_name,constraint_type
from user_constraints
where table_name = 'REGISTRATION';

SELECT COLUMN_NAME, CONSTRAINT_NAME
FROM USER_CONS_COLUMNS 
WHERE TABLE_NAME = 'REGISTRATION';


Drop table from the child first
-- if then also left
drop table <name> CASCADE CONSTRAINTS;
