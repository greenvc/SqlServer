--ʹ��ȫ�ֱ���
--ȡ�÷���������
select @@servername

select 1/0

--ȡ�����һ�δ�������
select @@error

--ȡ�����һ�β���Ӱ�쵽����������
select @@rowcount

--�����ı����ɵ�����ַ���
select @@TEXTSIZE

 		--��ʹ�� sp_tableoption Ϊ������ text in row ѡ�

exec sp_tableoption 'tt', 'text in row', 'ON'

                  --���ߣ�����Ϊ�����������д洢�� text��ntext �� image �ַ�������ָ���� 24 �� 7.000 �ֽڵ�������ƣ�

exec sp_tableoption 'tt', 'text in row', '1000'

--��������
select @@TRANCOUNT

select @@version




!=  <>    --������
!> !<     --������С��


and  	--��
 
or	--��

not   	--��


--���̿������
declare @x int
declare @y int
set @x=4
set @y=5

if @x<@y
   begin
   print 'X<Y'
   print '���'
   end
else
   begin
   print 'X>y'
   print '�ﲼ��'
   end


--ѭ���������
declare @i int
declare @sum int
set @i=1
set @sum=0

while @i<=1000
begin
  set @sum=@sum+@i
  set @i=@i+1
end

select @sum as �ϼ� , @i as ѭ����


--�ϼ����
declare @i int
declare @sum int
set @i=1
set @sum=0

while @i<=1000
begin
  set @sum=@sum+@i
  set @i=@i+1
  if @i=501 break
end

select @sum as �ϼ� , @i as ѭ����

--��ӡ������
declare @i int
declare @ii int
declare @t varchar(600)

set @ii=1

while @ii<=99
begin
  set @t=''
  set @i=1
  while @i<@ii
  begin
    set @t=@t+'*'
    set @i=@i+1
  end
  print @t
  set @ii=@ii+1
end


--���̿�����������ݿ��е�Ӧ��
use pubs
go
select * from titles

while (select avg(price) from titles)<$30
begin
  update titles
  set price=price*2
  
  select max(price) from titles

  if (select max(price) from titles)>$50
     break
  else
     continue
end

select '��ۺܹ�!'








