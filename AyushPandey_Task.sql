CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;

/* Create tables for the above list given*/

CREATE TABLE users(UID INT(10),UNAME VARCHAR(20),EMAIL VARCHAR(25));
Create TABLE codekata(Cid INT(10),Solved INT(10));
Create TABLE attendance(Aid INT(10),Percent INT(10));
Create TABLE topics(Tid INT(10),Topic_Name Varchar(20));
Create TABLE company_drive(Comp_id INT(10),Comp_Name Varchar(20));
Create TABLE mentor(Mentor_id INT(10),User_id INT(10),Mentor_Name Varchar(20));
Create TABLE students_activated_courses(active_id INT(10),active_course VARCHAR(20));
Create TABLE courses(Course_id INT(10),Student_Id INT(10),Course_name VARCHAR(20));
Create TABLE TASKS(Task_id INT(10),Task_Name VARCHAR(20));

/*insert at least 5 rows of values in each table*/

INSERT INTO users(UID,UNAME,EMAIL) VALUES(1,"Ayush","ayush@gmail.com"),(2,"Aman","aman@gmail.com"),
(3,"Priyanshu","priyanshu@gmail.com"),(4,"Gaurav","gaurav@gmail.com"),(5,"Harsh","harsh@gmail.com");

SELECT * FROM users;
INSERT INTO codekata(Cid,Solved) VALUES(1,15),(2,8),(3,12),(4,7),(5,2),(1,8),(4,10);

INSERT INTO attendance(Aid,Percent) VALUES(1,100),(2,80),(3,78),(4,82),(5,70);

INSERT INTO topics(Tid,Topic_Name) VALUES(1,"T1"),(2,"T2"),(3,"T3"),(4,"T4"),(5,"T5"),(1,"T4"),(3,"T4");

INSERT INTO company_drive(Comp_id,Comp_Name) VALUES(1,"CHUBB"),(2,"HP"),(3,"DELL"),(4,"TATA"),(5,"CHUBB"),(3,"TATA"),(2,"Infosys");

INSERT INTO mentor(Mentor_id,User_id,Mentor_Name) VALUES(100,1,"Maheswaran"),(101,2,"Yuvaraj"),(102,3,"Mahendra"),(104,4,"Abhinav"),(100,5,"Maheswaran");

INSERT INTO students_activated_courses(active_id,active_course) VALUES(1,"Mysql"),(2,"JavaScript"),(3,"Python"),(4,"JAVA"),(5,"MySql");

INSERT INTO courses(Course_id,Student_Id,Course_name) VALUES(200,1,"Mysql"),(201,2,"JavaScript"),(203,3,"Python"),(204,4,"JAVA"),(200,5,"MySql"),(203,2,"Python"),(201,1,"JavaScript");

INSERT INTO TASKS(Task_Id,Task_Name) VALUES(1,"TT1"),(2,"TT2"),(3,"TT3"),(4,"TT4"),(5,"TT1"),(2,"TT5");

ALTER TABLE users ADD PRIMARY KEY (UID);
ALTER TABLE codekata ADD FOREIGN KEY (Cid) REFERENCES users(UID);
ALTER TABLE attendance ADD FOREIGN KEY (Aid) REFERENCES users(UID);

SET SQL_SAFE_UPDATES=0;
DELETE FROM attendance;

ALTER TABLE attendance DROP Percent;
ALTER TABLE attendance ADD (A_date DATE,PRESENT Varchar(5));
ALTER TABLE attendance ADD FOREIGN KEY (Aid) REFERENCES users(UID);
INSERT INTO attendance(Aid,A_date,PRESENT) VALUES(1,'2021-09-06','Yes'),(2,'2021-09-06','Yes'),(3,'2021-09-06','Yes'),(4,'2021-09-06','Yes'),(5,'2021-09-06','Yes'),(1,'2021-09-07','Yes'),
(2,'2021-09-07','No'),(3,'2021-09-07','Yes'),(4,'2021-09-07','No'),(5,'2021-09-07','Yes');

ALTER TABLE  mentor ADD PRIMARY KEY (Mentor_id,User_id);
ALTER TABLE mentor ADD FOREIGN KEY (User_id) REFERENCES users(UID);

DELETE FROM company_drive;
ALTER TABLE company_drive ADD users_id INT(10);
ALTER TABLE  company_drive ADD PRIMARY KEY (Comp_id,users_id);
ALTER TABLE company_drive ADD FOREIGN KEY (users_id) REFERENCES users(UID);
INSERT INTO company_drive(Comp_id,Comp_Name,users_id) VALUES(200,"CHUBB",1),(200,"CHUBB",2),(200,"CHUBB",3),(200,"CHUBB",4),(200,"CHUBB",5),(201,"TATA",3),(202,"Infosys",4),(201,"TATA",2);

DELETE FROM tasks;
ALTER TABLE tasks ADD User_ID INT(10);
INSERT INTO tasks(Task_id,Task_Name,User_ID) VALUES(1000,"T1",1),(1000,"T1",2),(1000,"T1",3),(1000,"T1",4),(1000,"T1",5),(1001,"T2",1),(1001,"T2",2),(1001,"T2",3),(1001,"T2",4),(1001,"T2",5);
ALTER TABLE  tasks ADD PRIMARY KEY (Task_id,User_ID);
ALTER TABLE tasks ADD FOREIGN KEY (User_ID) REFERENCES users(UID);

ALTER TABLE  courses ADD PRIMARY KEY (Course_id,Student_Id);
ALTER TABLE courses ADD FOREIGN KEY (Student_Id) REFERENCES users(UID);
ALTER TABLE courses ADD course_name VARCHAR(15);
UPDATE COURSES SET course_name="MySql" WHERE Course_id=200 AND Student_Id=1;
UPDATE COURSES SET course_name="MySql" WHERE Course_id=200;
UPDATE COURSES SET course_name="JAVA" WHERE Course_id=201;
UPDATE COURSES SET course_name="Python" WHERE Course_id=203;
UPDATE COURSES SET course_name="JavaScript" WHERE Course_id=204;
 
 DELETE FROM topics;
 ALTER TABLE topics ADD topic_id INT(10);
 INSERT INTO topics(Tid,Topic_Name,topic_id) VALUES(1,"JOINS",200),(2,"JOINS",200),(3,"JOINS",200),(4,"JOINS",200),(5,"JOINS",200);
ALTER TABLE  topics ADD PRIMARY KEY (Tid,topic_id);
ALTER TABLE topics ADD FOREIGN KEY (Tid) REFERENCES users(UID),
ADD FOREIGN KEY(topic_id) REFERENCES courses(Course_id);
 
 DELETE FROM students_activated_courses;
 ALTER TABLE students_activated_courses ADD Users_id INT(10);
 INSERT INTO students_activated_courses(active_id,active_course,Users_id) VALUES(200,"MySql",1),
 (200,"MySql",2),(200,"MySql",3),(200,"MySql",4),(200,"MySql",5);
 ALTER TABLE students_activated_courses ADD PRIMARY KEY (active_id,Users_id);
ALTER TABLE students_activated_courses ADD FOREIGN KEY (Users_id) REFERENCES users(UID),
ADD FOREIGN KEY (active_id) REFERENCES courses(Course_id);
 
SELECT * FROM users;
SELECT * FROM codekata;
SELECT * FROM attendance;
SELECT * FROM topics;
SELECT * FROM company_drive;
SELECT * FROM mentor;
SELECT * FROM students_activated_courses;
SELECT * FROM courses;
SELECT * FROM TASKS;

/*get number problems solved in codekata by combining the users*/
SELECT SUM(Solved) as Total_Problems From codekata;

/*display the no of company drives attended by a user
Displaying the User name and the count of company drives attended*/

SELECT users.UNAME,count(UID) as Number_Company FROM company_drive JOIN users ON company_drive.users_id=users.UID  GROUP BY users.UNAME ORDER BY users.UID ASC;

/*display the no of company drives attended by a user
Displaying the User name and the the company_drive*/

SELECT users.UNAME,company_drive.Comp_name FROM company_drive JOIN users ON company_drive.users_id=users.UID ORDER BY users.UID ASC;

/*combine and display students_activated_courses and courses for a specific user groping them based on the course*/

SELECT distinct r.UNAME,q.active_course,w.course_name FROM users as r JOIN students_activated_courses as q ON r.UID=q.Users_id JOIN courses as w ON q.active_id=w.Course_id; 

/*list all the mentors*/

SELECT DISTINCT(Mentor_Name) FROM mentor;

/*list the number of students that are assigned for a mentor*/

SELECT Mentor_Name, COUNT(UID) as Number_Student FROM mentor JOIN users ON mentor.User_id=users.UID
GROUP BY Mentor_Name;
