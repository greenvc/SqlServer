


CREATE TABLE Class(
--�༶��Ϣ
	ClassID int IDENTITY(1,1)  NOT NULL, --�Զ�������
	Name nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	TeacherID varchar(20) NULL,
	EntranceTime datetime NULL,
	Major int NOT NULL,
	Number int NULL default (0)--�༶ѧ������
) 

INSERT INTO Class(Name, EntranceTime, Major)
VALUES('�������ѧ�뼼��1��','2016-8-26', 1)
INSERT INTO Class(Name, EntranceTime, Major)
VALUES('�������ѧ�뼼��2��','2016-8-26', 1)
INSERT INTO Class(Name, EntranceTime, Major)
VALUES('����������1��','2016-8-26', 2)
INSERT INTO Class(Name, EntranceTime, Major)
VALUES('��ѧ��Ӧ����ѧ1��','2016-8-26', 3 )

--���°༶ѧ������
update Class
set Number = (select Count(*) from Student where Student.ClassID = Class.ClassID)

--===================================================================================
CREATE TABLE Student(
	--ѧ����Ϣ
	StudentID varchar(20) NOT NULL,
	Name nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	Sex int NOT NULL,
	Birthday datetime NULL,
	Tel varchar(15) COLLATE Chinese_PRC_CI_AS NULL,
	ClassID int NOT NULL
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
