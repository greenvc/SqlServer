--������
-- =============================================
-- Create table basic template
-- =============================================
IF EXISTS(SELECT name 
	  FROM 	 sysobjects 
	  WHERE  name = N'T' 
	  AND 	 type = 'U')
    DROP TABLE T
GO

CREATE TABLE T (
bh int NULL, 
xm varchar(12) NOT NULL
)
GO

drop table t


--�������������ݡ��������ݡ�ɾ������

create table t
(
  xh int not null,
  xm varchar(12) null,
  sfzh varchar(20) null,
  �������� datetime null
)

--��������
insert into t(xh,xm,sfzh,��������) values (1,'����','130','1999/12/12')
insert into t(xh,xm,sfzh,��������) values (2,'�ŷ�','131','2000-12-12')
insert into t(xh,xm,sfzh,��������) values (3,'����','132','2001-12-12')
insert into t(xh,xm,sfzh,��������) values (4,'����','138','2001-12-12')

select * from t

select xm,sfzh from t

--ɾ������
delete from t where sfzh='138'

--��������
update t
set xm='�ܲ�'
where xh=4




--������,�ڱ���ʹ�úϼ���

create table Tcomp
(
bh int not null,
mc varchar(30) ,
sl int ,
dj money,
je as (sl*dj)
)


select * from tcomp

insert into tcomp(bh,mc,sl,dj) values(1,'����',100,5.00)

insert into tcomp(bh,mc,sl,dj) values(2,'����',2365,2.365)

drop table s

create table s
(
 xh int not null,
 xm varchar(12)
)

select * from s

--ʹ��null

insert into s(xh) values(1)
insert into s values(2,'ʧ��')

update s
set xm=null
where xh=2

update s
set xm='����'
where xm is null


select * from s


--�ı��ṹ

ALTER TABLE s ADD sfzh VARCHAR(20) NULL

ALTER TABLE s ADD �������� datetime NULL

ALTER TABLE s DROP COLUMN ��������

ALTER TABLE s DROP COLUMN sfzh
