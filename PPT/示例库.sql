--רҵ��Ϣ
CREATE TABLE Major(
	MajorID int IDENTITY(1,1)  NOT NULL, --�Զ�������
	Name nvarchar(10) NOT NULL,
	Depict ntext NULL
) 

INSERT INTO Major(Name, Depict)
VALUES('�������ѧ�뼼��','��Ϣ����ѧԺ')
INSERT INTO Major(Name, Depict)
VALUES('��ѧ��Ӧ����ѧ','��Ϣ����ѧԺ')
INSERT INTO Major(Name, Depict)
VALUES('Ӧ��ͳ��ѧ','��Ϣ����ѧԺ')
INSERT INTO Major(Name, Depict)
VALUES('���ӹ���','��Ϣ����ѧԺ')
INSERT INTO Major(Name, Depict)
VALUES('��Ϣϵͳ����Ϣ����','��Ϣ����ѧԺ')
INSERT INTO Major(Name, Depict)
VALUES('����������','��Ϣ����ѧԺ')
--===================================================================================
--�༶��Ϣ
CREATE TABLE Class(
	ClassID int NOT NULL CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ,  
	Name nvarchar(10) NOT NULL,
	TeacherID varchar(20) NULL,
	EntranceTime datetime NULL,
	MajorID int NOT NULL,
	Number int NULL default (0)--�༶ѧ������
) 

INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(1, '1��','2016-8-26', 1)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(2, '2��','2016-8-26', 1)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(3, '1��','2016-8-26', 2)
INSERT INTO Class(ClassID, Name, EntranceTime, MajorID)
VALUES(4, '1��','2016-8-26', 3)

--���°༶ѧ������
update Class
set Number = (select Count(*) from Student where Student.ClassID = Class.ClassID)

--===================================================================================
--ѧ����Ϣ
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
--�����������
insert into Student(StudentID, Name,Sex, Birthday, Tel, ClassID)
values('20170709001', '�ų�', 1, '1999-9-13', '13888087123', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709002', '������', 2, '1999-9-21', '13188087125', 2)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709003', '����', 1, '1999-8-17', '18988087126', 3)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709004', '����', 2, '1999-8-21', '13988087127', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709005', '����', 1, '1999-9-11', '15388087128', 1)
insert into Student(StudentID, Name, Sex, Birthday, Tel, ClassID)
values('20170709006', '��ʢ��', 1, '1999-9-19', '18688087129', 2)

--case���ʹ��
select StudentID, Name, 
	(case Sex
	when 1 then '��'
	when 2 then 'Ů'
	else
		'δ����'
	end) AS �Ա�
from Student

--===================================================================================