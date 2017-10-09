--使用全局变量
--取得服务器名称
select @@servername

select 1/0

--取得最后一次错误名称
select @@error

--取得最后一次操作影响到的数据行数
select @@rowcount

--设置文本容纳的最大字符数
select @@TEXTSIZE

 		--可使用 sp_tableoption 为表启用 text in row 选项：

exec sp_tableoption 'tt', 'text in row', 'ON'

                  --或者，可以为可在数据行中存储的 text、ntext 和 image 字符串长度指定从 24 到 7.000 字节的最大限制：

exec sp_tableoption 'tt', 'text in row', '1000'

--事务数量
select @@TRANCOUNT

select @@version




!=  <>    --不等于
!> !<     --不大于小于


and  	--与
 
or	--或

not   	--非


--流程控制语句
declare @x int
declare @y int
set @x=4
set @y=5

if @x<@y
   begin
   print 'X<Y'
   print '你好'
   end
else
   begin
   print 'X>y'
   print '里布好'
   end


--循环控制语句
declare @i int
declare @sum int
set @i=1
set @sum=0

while @i<=1000
begin
  set @sum=@sum+@i
  set @i=@i+1
end

select @sum as 合计 , @i as 循环数


--合计求和
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

select @sum as 合计 , @i as 循环数

--打印三角形
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


--流程控制语句在数据库中的应用
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

select '书价很贵!'








