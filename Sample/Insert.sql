 create Table List 
      (   
        name  CHAR(20), 
        local CHAR(20), 
        age   CHAR(20)
       )
insert into List Values('����','�ӱ�' ,10)
insert into List Values('����','����',20)
insert into List Values('����','ɽ��',8)
insert into List Values('����','�ӱ�' ,16)
insert into List Values('����','����' ,22)
insert into List Values('�԰�','ɽ��' ,25)
insert into List Values('���','����' ,25)
insert into List Values('��ʮ','����' ,15)
insert into List Values('��ʮ��','�ӱ�',14)
insert into List Values('��ʮ��','����',12)
insert into List Values('��ʮ��','ɽ��',38)   
--==========================================
SELECT * FROM List
--============================================
Select Name,Local,Age--,XH=(Select Count(*) from List A where A.Local=B.Local and A.Name<B.Name)
 from List B order by (Select Count(*) from List A where A.Local=B.Local and A.Name<B.Name),Local
--===========================================
CREATE TABLE T_2
(
NAME VARCHAR(20),
TIME DATETIME
)
INSERT INTO T_2 VALUES('����','2000-01-01 10:01:01')   
INSERT INTO T_2 VALUES('����','2000-01-01 13:01:01')
INSERT INTO T_2 VALUES('����','2000-01-01 12:01:01')  
INSERT INTO T_2 VALUES('����','2000-01-02 09:01:01')   
INSERT INTO T_2 VALUES('����','2000-01-02 15:01:01')  
INSERT INTO T_2 VALUES('����','2000-01-02 16:01:01')      
INSERT INTO T_2 VALUES('����','2000-01-01 10:01:01')   
INSERT INTO T_2 VALUES('����','2000-01-01 11:01:01') 
--====================================================
select a.name,a.time,(select count(name)
                      from T_2
                      where name=a.name 
                      and year(time)=year(a.time) 
                      and month(time)=month(a.time) 
                      and day(time)=day(a.time) 
                      and time<=a.time) as ncount
from T_2 AS a
order by a.time
--=======================================================
Create Table T_A
(
id int not null,
name char(2)
)
insert into T_A values(1,'B')
insert into T_A values(2,'A')
insert into T_A values(3,'C')
insert into T_A values(4,'B')
insert into T_A values(5,'A')
insert into T_A values(6,'B')

--========================================================
Select id,name,(select count(id) from T_A where name=T.name and id<=T.id) as ���� 
From T_A AS T
