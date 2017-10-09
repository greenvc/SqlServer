--创建表
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


--创建表及插入数据、更改数据、删除数据

create table t
(
  xh int not null,
  xm varchar(12) null,
  sfzh varchar(20) null,
  出生年月 datetime null
)

--插入数据
insert into t(xh,xm,sfzh,出生年月) values (1,'刘备','130','1999/12/12')
insert into t(xh,xm,sfzh,出生年月) values (2,'张飞','131','2000-12-12')
insert into t(xh,xm,sfzh,出生年月) values (3,'赵云','132','2001-12-12')
insert into t(xh,xm,sfzh,出生年月) values (4,'超草','138','2001-12-12')

select * from t

select xm,sfzh from t

--删除数据
delete from t where sfzh='138'

--更改数据
update t
set xm='曹操'
where xh=4




--创建表,在表中使用合计列

create table Tcomp
(
bh int not null,
mc varchar(30) ,
sl int ,
dj money,
je as (sl*dj)
)


select * from tcomp

insert into tcomp(bh,mc,sl,dj) values(1,'袜子',100,5.00)

insert into tcomp(bh,mc,sl,dj) values(2,'袜子',2365,2.365)

drop table s

create table s
(
 xh int not null,
 xm varchar(12)
)

select * from s

--使用null

insert into s(xh) values(1)
insert into s values(2,'失敬')

update s
set xm=null
where xh=2

update s
set xm='武松'
where xm is null


select * from s


--改变表结构

ALTER TABLE s ADD sfzh VARCHAR(20) NULL

ALTER TABLE s ADD 出生日期 datetime NULL

ALTER TABLE s DROP COLUMN 出生日期

ALTER TABLE s DROP COLUMN sfzh
