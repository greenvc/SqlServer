/*
  ��ѯ�ظ���¼��ͨ�ô洢����
  ���Բ�ѯ��������Щ�������ظ���,������ظ�,��ָ���������ظ��ļ�¼
  �������������,��ָ������.
  ��������б�ʶ�ֶ�,���ұ�ʶ�ֶ����ظ�,���ڵ���ʱ,������ָ��Ϊ��ʶ�ֶ�
  �����ʶ�ֶ��ظ�,�����ô˴洢����
*/

create proc p_qry
	@tbname sysname,  --Ҫ��ѯ�ı���
	@keyfdname sysname=null --���е�����,���δָ��,�����������
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
--����ʾ��
--������������
create table ��1(f1 int,f2 int,f3 int,f4 int,f5 int)
insert into ��1
select 1,1,1,1,1
union all select 2,1,1,1,1
union all select 3,2,1,23,1
union all select 4,2,3,1,3
union all select 5,1,1,1,1
go

--����ͨ�ô洢����ʵ�ֲ�ѯ
exec p_qry '��1','f1'

--ɾ�����Ի���
drop table ��1