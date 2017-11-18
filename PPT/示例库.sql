DROP TABLE Major;
GO

CREATE TABLE Major(
	MajorID int NOT NULL, --自动增长列
	Name nvarchar(10) NOT NULL,
	Depict ntext NULL
) 
GO

--修改字段
ALTER TABLE Major drop column MajorID;
alter table Major add MajorID int IDENTITY(1,1) NOT NULL;
--增加主键
alter table Major add constraint PK_Majore primary key (MajorID);
--创建索引
CREATE INDEX IX_Major_Name ON Major (Name) ON [PRIMARY];

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
DROP TABLE Class;
GO
CREATE TABLE Class(
	ClassID int NOT NULL CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ,  
	Name nvarchar(10) NOT NULL,
	TeacherID varchar(20) NULL,
	EntranceTime datetime NULL,
	MajorID int NOT NULL,
	Number int NULL default (0)--班级学生人数
) 

---添加默认约束
ALTER TABLE Class ADD CONSTRAINT DF_Class_EntranceTime DEFAULT('2017-9-1') FOR EntranceTime
---添加检查约束
ALTER TABLE Class ADD CONSTRAINT CK_Class_Number CHECK(Number BETWEEN 0 AND 30)
--添加外键约束
ALTER TABLE Class ADD CONSTRAINT FK_Class_MajorID FOREIGN KEY (MajorID) REFERENCES Major (MajorID)
GO

--插入数据
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
DROP TABLE Student;
GO
CREATE TABLE Student(
	StudentID varchar(20) NOT NULL,
	Name nvarchar(10) NOT NULL,
	Spell varchar(30) null,
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
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709001', '张超', 'ZhanChao', 1, '1999-9-13', '13888087123', 1)
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709002', '王艳琳', 'WangYanLin', 2, '1999-9-21', '13188087125', 2)
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709003', '王华', 'WangHua',  1, '1999-8-17', '18988087126', 3)
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709004', '张兰', 'zhangLan', 2, '1999-8-21', '13988087127', 1)
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709005', '张永', 'ZhangYong', 1, '1999-9-11', '15388087128', 1)
insert into Student(StudentID, Name, Spell, Sex, Birthday, Tel, ClassID)
values('20170709006', '王盛川', 'WangShengChuan', 1, '1999-9-19', '18688087129', 2)

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