/*
��ʾָ������ͼ����ѯ����ĵ�Xҳ 
���ڱ����������ʶ�е����,ֱ�Ӵ�ԭ��ȡ����ѯ���������ʹ����ʱ��ķ��� 
�����ͼ���ѯ�����������,���Ƽ��˷���
*/ 
CREATE Proc up_show 
	@QueryStr nvarchar(4000), --��������ͼ������ѯ��� 
	@PageSize int=10, --ÿҳ�Ĵ�С(����) 
	@PageCurrent int=1, --Ҫ��ʾ��ҳ 
	@FdShow nvarchar (4000)='', --Ҫ��ʾ���ֶ��б�,�����ѯ����б�ʶ�ֶ�,��Ҫָ����ֵ,�Ҳ�������ʶ�ֶ� 
	@FdOrder nvarchar (1000)='' --�����ֶ��б� 
as 
declare @FdName nvarchar(250) --���е����������ʱ���еı�ʶ���� 
,@Id1 varchar(20),@Id2 varchar(20) --��ʼ�ͽ����ļ�¼�� 
,@Obj_ID int --����ID 
--�����и��������Ĵ��� 
declare @strfd nvarchar(2000) --���������б� 
,@strjoin nvarchar(4000) --�����ֶ� 
,@strwhere nvarchar(2000) --��ѯ���� 


select @Obj_ID=object_id(@QueryStr) 
,@FdShow=case isnull(@FdShow,'') when '' then ' * ' else ' '+@FdShow end 
,@FdOrder=case isnull(@FdOrder,'') when '' then '' else ' order by '+@FdOrder end 
,@QueryStr=case when @Obj_ID is not null then ' '+@QueryStr else ' ('+@QueryStr+') a' end 

--�����ʾ��һҳ������ֱ����top����� 
if @PageCurrent=1 
begin 
select @Id1=cast(@PageSize as varchar(20)) 
exec('select top '+@Id1+@FdShow+' from '+@QueryStr+@FdOrder) 
return 
end 

--����Ǳ�,��������Ƿ��б�ʶ�������� 
if @Obj_ID is not null and objectproperty(@Obj_ID,'IsTable')=1 
begin 
select @Id1=cast(@PageSize as varchar(20)) 
,@Id2=cast((@PageCurrent-1)*@PageSize as varchar(20)) 

select @FdName=name from syscolumns where id=@Obj_ID and status=0x80 
if @@rowcount=0 --��������ޱ�ʶ��,��������Ƿ������� 
begin 
if not exists(select 1 from sysobjects where parent_obj=@Obj_ID and xtype='PK') 
goto lbusetemp --�������������,������ʱ���� 

select @FdName=name from syscolumns where id=@Obj_ID and colid in( 
select colid from sysindexkeys where @Obj_ID=id and indid in( 
select indid from sysindexes where @Obj_ID=id and name in( 
select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID 
))) 
if @@rowcount>1 --�����е������Ƿ�Ϊ�������� 
begin 
select @strfd='',@strjoin='',@strwhere='' 
select @strfd=@strfd+',['+name+']' 
,@strjoin=@strjoin+' and a.['+name+']=b.['+name+']' 
,@strwhere=@strwhere+' and b.['+name+'] is null' 
from syscolumns where id=@Obj_ID and colid in( 
select colid from sysindexkeys where @Obj_ID=id and indid in( 
select indid from sysindexes where @Obj_ID=id and name in( 
select name from sysobjects where xtype='PK' and parent_obj=@Obj_ID 
))) 
select @strfd=substring(@strfd,2,2000) 
,@strjoin=substring(@strjoin,5,4000) 
,@strwhere=substring(@strwhere,5,4000) 
goto lbusepk 
end 
end 
end 
else 
goto lbusetemp 

/*--ʹ�ñ�ʶ�л�����Ϊ��һ�ֶεĴ�����--*/ 
lbuseidentity: 
exec('select top '+@Id1+@FdShow+' from '+@QueryStr 
+' where '+@FdName+' not in(select top ' 
+@Id2+' '+@FdName+' from '+@QueryStr+@FdOrder 
+')'+@FdOrder 
) 
return 

/*--�����и��������Ĵ�����--*/ 
lbusepk: 
exec('select '+@FdShow+' from(select top '+@Id1+' a.* from 
(select top 100 percent * from '+@QueryStr+@FdOrder+') a 
left join (select top '+@Id2+' '+@strfd+' 
from '+@QueryStr+@FdOrder+') b on '+@strjoin+' 
where '+@strwhere+') a' 
) 
return 

/*--����ʱ����ķ���--*/ 
lbusetemp: 
select @FdName='[ID_'+cast(newid() as varchar(40))+']' 
,@Id1=cast(@PageSize*(@PageCurrent-1) as varchar(20)) 
,@Id2=cast(@PageSize*@PageCurrent-1 as varchar(20)) 

exec('select '+@FdName+'=identity(int,0,1),'+@FdShow+' 
into #tb from'+@QueryStr+@FdOrder+' 
select '+@FdShow+' from #tb where '+@FdName+' between ' 
+@Id1+' and '+@Id2 
) 

GO 

--����ʾ��
execute up_show @QueryStr ='������ϸ', @PageSize =10, @PageCurrent =2,
	@FdShow ='����ID, ��ƷID, ����, ����, �ۿ�', @FdOrder ='����ID'

select ����ID, ��ƷID, ����, ����, �ۿ� from ������ϸ order by ����ID

--������ҳ��
--�㵱ǰҳ���� order by  top 100 

ID between 15 and 30

select identity(int,1,1) AS ID, ����ID, ��ƷID, ����, ����, �ۿ�
into T_��ҳ1
from ������ϸ order by ����ID

select top 15 ����ID, ��ƷID, ����, ����, �ۿ� from T_��ҳ1 where ID between 16 and 30