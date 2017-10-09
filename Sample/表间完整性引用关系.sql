--人员表
--创建单主键
create table person
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
constraint bh_ys primary key(bh)
)

select * from person

insert into person values (130,'刘备','男','999')

drop table person

--创建单主键
create table person1
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh)
)

insert into person1 values (131,'刘备','男','999')

select * from person1

--创建复合主键
create table person2
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh,xm)
)

insert into person2 values (131,'关羽','男','999')

select * from person

--编号重复但名字不重复的情况
insert into person values (130,'刘备','男','999')
insert into person values (131,'关羽','男','999')





--表间一对一关系
create table person
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
constraint bh_ys primary key(bh)
)

select * from person
insert into person values (130,'刘备','男','999')
insert into person values (131,'关羽','男','999')

--fzjl表的bh引用person表的bh
create table fzjl
(
  bh int not null,
  fzjl varchar(60) null,
  primary key(bh),
  foreign key(bh) references person(bh)
)

insert into fzjl values(131,'放火')
select * from fzjl

--person表和fzjl表的级联更改和删除
update person
set bh=133
where bh=130


--主键和外键必须数据类型相同，并且长度一样

--表间一对多关系
create table personA
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh)
)

select * from personA

insert into personA values (130,'刘备','男','999')
insert into personA values (131,'关羽','男','999')

--fzjlA表由于是使用复合主键，故personA和fzjlA的表间关系是一对多的关系
create table fzjlA
(
  bh int not null,
  fzjl varchar(60) not null,
  primary key(bh,fzjl),
  foreign key(bh) references personA(bh)
)

insert into fzjlA values(130,'杀人')
insert into fzjlA values(131,'放火')

insert into fzjlA values(130,'抢劫')
insert into fzjlA values(131,'偷窃')

select * from fzjlA

--可以在图形界面下试验级联删除和更新纪录

select a.xm,b.fzjl from persona a,fzjla b where a.bh=b.bh







