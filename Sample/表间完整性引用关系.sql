--��Ա��
--����������
create table person
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
constraint bh_ys primary key(bh)
)

select * from person

insert into person values (130,'����','��','999')

drop table person

--����������
create table person1
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh)
)

insert into person1 values (131,'����','��','999')

select * from person1

--������������
create table person2
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh,xm)
)

insert into person2 values (131,'����','��','999')

select * from person

--����ظ������ֲ��ظ������
insert into person values (130,'����','��','999')
insert into person values (131,'����','��','999')





--���һ��һ��ϵ
create table person
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
constraint bh_ys primary key(bh)
)

select * from person
insert into person values (130,'����','��','999')
insert into person values (131,'����','��','999')

--fzjl���bh����person���bh
create table fzjl
(
  bh int not null,
  fzjl varchar(60) null,
  primary key(bh),
  foreign key(bh) references person(bh)
)

insert into fzjl values(131,'�Ż�')
select * from fzjl

--person���fzjl��ļ������ĺ�ɾ��
update person
set bh=133
where bh=130


--�����������������������ͬ�����ҳ���һ��

--���һ�Զ��ϵ
create table personA
(
bh int not null,
xm varchar(20) not null,
xb char(2),
sfzh varchar(20),
primary key(bh)
)

select * from personA

insert into personA values (130,'����','��','999')
insert into personA values (131,'����','��','999')

--fzjlA��������ʹ�ø�����������personA��fzjlA�ı���ϵ��һ�Զ�Ĺ�ϵ
create table fzjlA
(
  bh int not null,
  fzjl varchar(60) not null,
  primary key(bh,fzjl),
  foreign key(bh) references personA(bh)
)

insert into fzjlA values(130,'ɱ��')
insert into fzjlA values(131,'�Ż�')

insert into fzjlA values(130,'����')
insert into fzjlA values(131,'͵��')

select * from fzjlA

--������ͼ�ν��������鼶��ɾ���͸��¼�¼

select a.xm,b.fzjl from persona a,fzjla b where a.bh=b.bh







