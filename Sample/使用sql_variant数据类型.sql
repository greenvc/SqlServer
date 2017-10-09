--使用sql_variant数据类型
create table ex(
bh sql_variant
)

select * from ex

insert into ex values('i kill you')

insert into ex values(123)

insert into ex values('2000-12-12')

insert into ex values(3.1215927)