--专业信息
CREATE TABLE Major(
	MajorID int IDENTITY(1,1)  NOT NULL, --自动增长列
	Name nvarchar(10) NOT NULL,
	Depict ntext NULL
) 

INSERT INTO Major(Name, Depict)
VALUES('计算机科学与技术','信息工程学院')
INSERT INTO Major(Name, Depict)
VALUES('数学与应用数学','信息工程学院')
INSERT INTO Major(Name, Depict)
VALUES('应用统计学','信息工程学院')
INSERT INTO Major(Name, Depict)
VALUES('电子工程','信息工程学院')
INSERT INTO Major(Name, Depict)
VALUES('信息系统与信息管理','信息工程学院')
INSERT INTO Major(Name, Depict)
VALUES('物联网工程','信息工程学院')
--===================================================================================
--班级信息
CREATE TABLE Class(
	ClassID int NOT NULL CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ,  
	Name nvarchar(10) NOT NULL,
	TeacherID varchar(20) NULL,
	EntranceTime datetime NULL,
	MajorID int NOT NULL,
	Number int NULL default (0)--班级学生人数
) 

INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(1, '1班','2016-8-26', 1)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(2, '2班','2016-8-26', 1)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(3, '1班','2016-8-26', 2)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(4, '1班','2016-8-26', 3)

--更新班级学生人数
update Class
set Number = (select Count(*) from Student where Student.ClassID = Class.ClassID)

--===================================================================================
--学生信息
CREATE TABLE Student(
	StudentID varchar(20) NOT NULL,
	Name nvarchar(10) NOT NULL,
	Sex int NOT NULL,
	Birthday datetime NULL,
	Tel varchar(15) NULL,
	ClassID int NOT NULL,
	CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
	(
		StudentID ASC
	)
) 
--插入基础数据
insert into Student(StudentID, Name,Sex, Birthday, Tel, ClassID)
values('20170709001', '张超', 1, '1999-9-13', '13888087123', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709002', '王艳琳', 2, '1999-9-21', '13188087125', 2)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709003', '王华', 1, '1999-8-17', '18988087126', 3)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709004', '张兰', 2, '1999-8-21', '13988087127', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709005', '张永', 1, '1999-9-11', '15388087128', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709006', '王盛川', 1, '1999-9-19', '18688087129', 2)

--case语句使用
select StudentID, Name, 
	(case Sex
	when 1 then '男'
	when 2 then '女'
	else
		'未定义'
	end) AS 性别
from Student

--===================================================================================