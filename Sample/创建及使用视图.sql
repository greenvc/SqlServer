--查看试图代码语法
execute sp_helpText @objname =视图对象名称

--===============================================================
--加密视图

create view 视图名称
with ENCRYPTION 
as
	SQL语句


--不能用sp_helpText查看语句


--================================================================
--创建表
create table 班级 
(
	班级编号 int not null,
	班级名称 varchar(30) not null,
	班级介绍 nvarchar(100) null
)

create table 学生
(
	学生编号 int not null,
	班级编号 int not null,
	学生姓名 nvarchar(20) not null,
	出生年月 DateTime null,
	性别 nvarchar(1) null
)

--创建视图
create view V_学生信息
As
	select 班级.班级编号, 班级.班级名称,
		学生.学生编号,学生.学生姓名,学生.出生年月
	from 班级 inner join 学生
		on 班级.班级编号 = 学生.班级编号

--插入数据
insert into V_学生信息(班级编号, 班级名称, 学生编号, 学生姓名, 出生年月)
values(1, '软件开发9期', 1, '张三', '1991-7-14')

--插入数据
insert into V_学生信息(班级编号, 班级名称, 学生姓名, 出生年月)
values(1, '软件开发9期', '张三', '1991-7-14')

--查询数据
select * from 班级
select * from 学生

--插入数据
insert into 班级(班级编号, 班级名称, 班级介绍)
values(3, '软件开发1期', '在学习SqlServer知识')
insert into 学生(学生编号, 班级编号, 学生姓名, 出生年月, 性别)
values(3, 2, 'haha', '1981-7-14', '女')

delete from V_学生信息 where 班级编号 = 1

--修改视图(把原视图变为基于单个表的视图)
alter view V_学生信息
as
	select 学生编号, 班级编号, 学生姓名, 出生年月, 性别 from 学生

select * from 学生
--在视图中成功插入数据
insert into V_学生信息(学生编号, 班级编号, 学生姓名, 出生年月, 性别)
values(12, 3, '在视图中', GetDate(), '男')

select * from V_学生信息
select * from 学生

--删除数据
delete from V_学生信息 where 学生编号 = 1
select * from 学生
