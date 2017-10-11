CREATE TABLE Student(
	StudentID varchar(20) NOT NULL,
	Name nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	Sex int NOT NULL,
	Birthday datetime NULL,
	Tel varchar(15) COLLATE Chinese_PRC_CI_AS NULL,
	ClassID int NOT NULL
) 
--插入基础数据
insert into Student(StudentID, Name,Sex, Birthday, Tel, ClassID)
values('20170709001', '张超', 1, '1999-9-13', '13888087123', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709002', '王艳琳', 2, '1999-9-21', '13188087125', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709003', '王华', 1, '1999-8-17', '18988087126', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709004', '张兰', 2, '1999-8-21', '13988087127', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709005', '张永', 1, '1999-9-11', '15388087128', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709006', '王盛川', 1, '1999-9-19', '18688087129', 1)

--case语句使用
select StudentID, Name, 
	(case Sex
	when 1 then '男'
	when 2 then '女'
	else
		'未定义'
	end) AS 性别
from Student