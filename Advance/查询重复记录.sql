/*
  查询重复记录的通用存储过程
  可以查询出表中那些数据是重复的,这里的重复,是指除主键外重复的记录
  如果表中有主键,请指定主键.
  如果表中有标识字段,而且标识字段无重复,请在调用时,将主键指定为标识字段
  如果标识字段重复,不能用此存储过程
*/

create proc p_qry
	@tbname sysname,  --要查询的表名
	@keyfdname sysname=null --表中的主键,如果未指定,则表中无主键
as
	declare @nokey bit,@fd varchar(8000),@tj varchar(8000)
	set nocount on
	if isnull(@keyfdname,'')=''
	begin
		select @keyfdname=cast(newid() as char(36)),@nokey=1
		exec('alter table ['+@tbname+'] add ['+@keyfdname+'] decimal(38,0) identity(1,1)')
	end
	select @fd='',@tj=''
	select @fd=@fd+',['+name+']'
		,@tj=@tj+'['+name+']=a.['+name+'] and '
	from syscolumns 
	where object_name(id)=@tbname and name<>@keyfdname
	set @fd=substring(@fd,2,8000)
	exec('select '+@fd+' from ['+@tbname+'] a 
	 where exists(select 1 from ['+@tbname
	 +'] where '+@tj+'['+@keyfdname+']<>a.['+@keyfdname+'])')
	if @nokey=1
	 exec('alter table ['+@tbname+'] drop column ['+@keyfdname+']')
	set nocount off 
go


--===========================================================================================
--调用示例
--创建测试数据
create table 表1(f1 int,f2 int,f3 int,f4 int,f5 int)
insert into 表1
select 1,1,1,1,1
union all select 2,1,1,1,1
union all select 3,2,1,23,1
union all select 4,2,3,1,3
union all select 5,1,1,1,1
go

--调用通用存储过程实现查询
exec p_qry '表1','f1'

--删除测试环境
drop table 表1