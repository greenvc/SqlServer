--默认、规则、检查、用户自定义数据类型


create table personAA
(
bh int not null ,
xm varchar(20) not null unique,
xb char(2),
sfzh varchar(20) unique,
primary key(bh)
)

create table personAAA
(
bh int not null,
xm varchar(20) not null ,
xb char(2),
sfzh varchar(20) ,
primary key(bh),
constraint u_key unique(sfzh)
)




--默认
create table person_default
(
bh int not null,
xm varchar(20) not null ,
xb char(2) default '男',
sfzh varchar(20) ,
录入时间 datetime default getdate(),
primary key(bh)
)

insert into person_default(bh,xm) values(1,'宋江')

select * from person_default


CREATE DEFAULT xm_d AS '陆自身'

insert into person_default(bh,xm) values(2,'ss')


exec sp_bindefault xm_d, 'person_default.xm'

insert into person_default(bh) values(3)



CREATE TABLE employeeA 
(
   emp_id  varchar(9)  CHECK (emp_id like  '[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]' ),
   fname   varchar(20)     NOT NULL,
   minit   char(1) NULL,
   lname   varchar(30)     NOT NULL,
   job_id  smallint        NOT NULL    DEFAULT 1 ,
   job_lvl tinyint    DEFAULT 10
)
      


create table eye_rule
(
bh int not null,
mc varchar(20) not null,
dj money null,
sl int,
hj as (dj*sl)
)

CREATE RULE range_rule
AS 
@r >= $1000 AND @r < $20000


EXEC sp_bindrule 'range_rule', 'eye_rule.dj'

insert into eye_rule values(1,'wz',$1000,10)

select * from eye_rule


insert into t_ud values('1234','kjsd')
insert into t_ud values('1234','kjsd')
select * from t_ud

create table aaaa
(
 xh bhid 
)





--使用子查询
use pubs
go

select * from titles

select avg(advance) from titles

select left(title,10),type,(select avg(advance) from titles) as 平均值 from titles


use northwind
go

select top 5 t.orderid,t.customerid from (select top 10 orderid,customerid from orders) as t

