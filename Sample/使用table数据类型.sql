--使用table数据类型

declare @tv table
(
  cola int ,
  colb varchar(12)
)

insert into @tv values(1,'abc')
insert into @tv values(2,'cde')

select * from @tv
insert into @tv values(3,'ddddd')
select * from @tv

delete from @tv where cola=1
select * from @tv
go


select * from tt

select * into #ab from tt

select * from #ab

select * from t
go

select * from #ab