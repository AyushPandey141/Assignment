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

SELECT users.UNAME,count(UID) as Number_Company FROM company_drive JOIN users ON company_drive.Comp_id=users.UID  GROUP BY users.UNAME ORDER BY users.UID ASC;

/*display the no of company drives attended by a user
Displaying the User name and the the company_drive*/

SELECT users.UNAME,company_drive.Comp_name FROM company_drive JOIN users ON company_drive.Comp_id=users.UID ORDER BY users.UID ASC;

/*combine and display students_activated_courses and courses for a specific user groping them based on the course*/

SELECT users.UNAME,q.active_course,w.course_name FROM courses as w JOIN students_activated_courses as q JOIN users ON users.uid=w.Student_Id GROUP BY(w.course_name);

/*list all the mentors*/

SELECT DISTINCT(Mentor_Name) FROM mentor;

/*list the number of students that are assigned for a mentor*/

SELECT Mentor_Name, COUNT(UID) as Number_Student FROM mentor JOIN users ON mentor.User_id=users.UID
GROUP BY Mentor_Name;
