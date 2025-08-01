show databases;
create schema edugradedb;
use edugradedb;

create table teachers
(
  teachID int primary key auto_increment,
  teachname varchar (255) not null,
  email varchar (50) not null unique,
  phonenumber varchar (20) not null,
  gender varchar (255)not null,
  class text not null
);

create table students
(
  studID int primary key auto_increment,
  studname varchar (255) not null,
  gender varchar (255) not null,
  dob date not null,
  class text not null
);

alter table students add admno varchar(50) not null unique after studID;
alter table students add teachID int;
alter table students add foreign key (teachID) references teachers(teachID) on delete set null;

create table classes
(
  classID int primary key auto_increment,
  classname varchar(100) not null,
  teachname varchar (255) not null,
  teachID int not null,
  foreign key(teachID) references teachers(teachID)
);

create table subjects
(
  subcode int primary key,
  subname varchar (50) not null,
  teachID int not null,
  foreign key(teachID) references teachers(teachID)
);
alter table subjects add teachname varchar(255) not null after subname;

create table marks
(
  markID int primary key auto_increment,
  marks int not null,
  studID integer not null,
  studname varchar (255) not null,
  ovrscore int not null,
  meanscore int not null,
  remark text not null,
  foreign key(studID) references students(studID) on delete cascade
);

create table login
(
    loginID int primary key auto_increment,
    username VARCHAR(50) not null unique, 
    password VARCHAR(255) not null,
    role ENUM('student', 'teacher') not null,
    studID int,
    teachID int,
    foreign key (studID) references students(studID),
    foreign key (teachID) references teachers(teachID)
);
    
alter table login modify column studID int null;
alter table login modify column teachID int null;

INSERT INTO teachers (teachID, teachname, gender, class, email, phonenumber) 
VALUES 
(1, 'Mary Johnson', 'Female',  'Form 1A', 'mary.johnson@school.com', '123456789'),
(2, 'James Wilson', 'Male',  'Form 1B', 'james.wilson@school.com', '987654321'),
(3, 'Lisa Anderson', 'Female',  'Form 2A', 'lisa.anderson@school.com', '555123456'),
(4, 'Robert Taylor', 'Male',  'Form 2B', 'robert.taylor@school.com', '777888999'),
(5, 'Patricia Moore', 'Female',  'Form 3A', 'patricia.moore@school.com', '444555666'),
(6, 'Thomas Clark', 'Male',  'Form 3B', 'thomas.clark@school.com', '111222333'),
(7, 'Jennifer White', 'Female',  'Form 4A', 'jennifer.white@school.com', '222333444'),
(8, 'Kevin Miller', 'Male',  'Form 4B', 'kevin.miller@school.com', '333444555'),
(9, 'Amanda Davis', 'Female', 'Form 5A', 'amanda.davis@school.com', '444555666'),
(10,'Steven Johnson', 'Male', 'Form 5B', 'steven.johnson@school.com', '555666777');
  
SET SQL_SAFE_UPDATES = 0;
UPDATE teachers SET class = 'grade 1A' WHERE class = 'Form 1A';
UPDATE teachers SET class = 'grade 1B' WHERE class = 'Form 1B';
UPDATE teachers SET class = 'grade 2A' WHERE class = 'Form 2A';
UPDATE teachers SET class = 'grade 2B' WHERE class = 'Form 2B';
UPDATE teachers SET class = 'grade 3A' WHERE class = 'Form 3A';
UPDATE teachers SET class = 'grade 3B' WHERE class = 'Form 3B';
UPDATE teachers SET class = 'grade 4A' WHERE class = 'Form 4A';
UPDATE teachers SET class = 'grade 4B' WHERE class = 'Form 4B';
UPDATE teachers SET class = 'grade 5A' WHERE class = 'Form 5A';
UPDATE teachers SET class = 'grade 5B' WHERE class = 'Form 5B';

INSERT INTO students (studID, admno, studname, gender, dob, class, teachID) 
VALUES
(1, '1001', 'John Otieno', 'Male', '2005-03-15', 'Form 1A', 1),
(2, '1002', 'Sarah Johnson', 'Female', '2005-07-22', 'Form 1A', 1),
(3, '1003', 'Michael Brown', 'Male', '2005-01-10', 'Form 1B', 2),
(4, '1004', 'Emily Moraa', 'Female', '2005-11-05', 'Form 1B', 2),
(5, '1005', 'David Mutua', 'Male', '2005-09-18', 'Form 2A', 3),
(6, '1006', 'Emma Thompson', 'Female', '2005-04-12', 'Form 2A', 3),
(7, '1007', 'Christopher Martin', 'Male', '2005-08-30', 'Form 2B', 4),
(8, '1008', 'Sophia Rodriguez', 'Female', '2005-12-03', 'Form 3A', 5),
(9, '1009', 'Daniel kamau', 'Male', '2005-06-25', 'Form 3B', 6),
(10, '1010','Olivia Naliaka', 'Female', '2005-02-14', 'Form 4A', 7);  

UPDATE students SET class = 'grade 1A' WHERE class = 'Form 1A';
UPDATE students SET class = 'grade 1B' WHERE class = 'Form 1B';
UPDATE students SET class = 'grade 2A' WHERE class = 'Form 2A';
UPDATE students SET class = 'grade 2B' WHERE class = 'Form 2B';
UPDATE students SET class = 'grade 3A' WHERE class = 'Form 3A';
UPDATE students SET class = 'grade 3B' WHERE class = 'Form 3B';
UPDATE students SET class = 'grade 4A' WHERE class = 'Form 4A';
SET SQL_SAFE_UPDATES = 1;

INSERT INTO login (loginID, username, password, role, studID, teachID) 
VALUES
(1, 'TCH001', 'hashed_password_here', 'teacher', null, 1),
(2, 'TCH002', 'hashed_password_here', 'teacher', null, 2),
(3, 'TCH003', 'hashed_password_here', 'teacher', null, 3),
(4, 'TCH004', 'hashed_password_here', 'teacher', null, 4),
(5, 'TCH005', 'hashed_password_here', 'teacher', null, 5),
(6, 'TCH006', 'hashed_password_here', 'teacher', null, 6),
(7, 'TCH007', 'hashed_password_here', 'teacher', null, 7),
(8, 'TCH008', 'hashed_password_here', 'teacher', null, 8),
(9, 'TCH009', 'hashed_password_here', 'teacher', null, 9),
(10, 'TCH010', 'hashed_password_here', 'teacher', null, 10);

INSERT INTO subjects (subcode, subname, teachname, teachID) 
VALUES
(101, 'Mathematics', 'Mary Johnson', 1),
(102, 'English', 'James Wilson', 2),
(103, 'Kiswahili', 'Lisa Anderson', 3),
(104, 'Environmental Activities','Robert Taylor', 4),
(105, 'Creative Arts',  'Patricia Moore', 5),
(106, 'Physical Education', 'Thomas Clark', 6),
(107, 'Religious Education', 'Jennifer White', 7),
(108, 'Social Studies', 'Kevin Miller', 8),
(109, 'Science and Technology', 'Amanda Davis', 9),
(110, 'Life Skills', 'Steven Johnson', 10);

INSERT INTO marks (markID, marks, studID, studname, ovrscore, meanscore, remark) 
VALUES
(1,85, 1,  'John Otieno', 425, 85, 'Excellent performance'),
(2,78, 2,  'Sarah Johnson', 390, 78, 'Good performance'),
(3, 92, 3,  'Michael Brown', 460, 92, 'Outstanding performance'),
(4,75,4,  'Emily Moraa', 375, 75, 'Satisfactory performance'),
(5,88,  5,  'David Mutua', 440, 88, 'Very good performance'),
(6,81,  6,  'Emma Thompson', 405, 81, 'Good performance'),
(7,95,  7,  'Christopher Martin', 475, 95, 'Exceptional performance'),
(8,72,  8,  'Sophia Rodriguez', 360, 72, 'Average performance'),
(9,87,  9,  'Daniel Kamau', 435, 87, 'Very good performance'),
(10,83, 10,  'Olivia Naliaka', 415, 83, 'Good performance');

INSERT INTO classes (classID, classname, teachname, teachID) 
VALUES
(1,'grade 1A', 'Mary Johnson', 1),
(2, 'grade 1B', 'James Wilson', 2),
(3, 'grade 2A', 'Lisa Anderson', 3),
(4, 'grade 2B', 'Robert Taylor', 4),
(5, 'grade 3A', 'Patricia Moore', 5),
(6, 'grade 3B', 'Thomas Clark', 6),
(7, 'grade 4A', 'Jennifer White', 7),
(8,'grade 4B', 'Kevin Miller', 8),
(9, 'grade 5A', 'Amanda Davis', 9),
(10,'grade 5B', 'Steven Johnson', 10);

create view studentPerformance as select s.studID,s.studname,s.class,m.marks,m.ovrscore,m.meanscore,m.remark
from students s, marks m
where  s.studID = m.studID;
select * from studentPerformance;
select distinct grade from studentPerformance;


create view studentPerformanceFiltered as select s.studID,s.studname,s.class,m.marks,m.ovrscore,m.meanscore,m.remark
from students s, marks m
where s.studID = m.studID
    and m.marks > 70;
select * from studentPerformancefiltered;

drop view studentPerformanceFiltered;

create view studentPerformanceFiltered as select s.studID,s.studname,s.class,m.marks,m.ovrscore,m.meanscore,m.remark
from students s, marks m
where s.studID = m.studID
    and m.marks > 80;
select * from studentPerformancefiltered;

create view femaleTeachers as
select * from teachers
where Gender = 'Female';
select * from femaleTeachers;

create view maleTeachers as
select * from teachers
where Gender = 'Male';
select * from maleTeachers;

create view grade1ATeachers as select *
from teachers
where class = 'grade 1A';
select * from grade1ATeachers;

create view teacherContacts as select  teachname,email,phonenumber
from teachers;
select * from teachercontacts;

create view femaleStudents as
select * from students
where Gender = 'Female';
select * from femaleStudents;

create view maleStudents as
select * from students
where Gender = 'male';
select * from maleStudents;

select distinct class from teachers;