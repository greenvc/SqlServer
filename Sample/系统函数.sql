--数学函数
select asin(0.1)  --求反正弦

select acos(0.1)  --求反余弦

select sin(1) --求正弦

select atan(0.1)--求反正切

select cos(1)--求余弦

select tan(1)--求余切

select degrees(1) --将弧度转换为角度

select radians(90)--将角度转换为弧度

select pi()--求∏值

select rand()--生成0-1之间的随机数

select sign(3),sign(0),sign(-34) --输出数字符号，正数输出1，负数输出-1

select abs(-5),abs(0),abs(5)--求绝对值

select exp(5)--求指数

select 9%3  --求余

select ceiling(3.6),ceiling(3.2),ceiling(-4.2)--不小于给定数字的最小整数

select floor(3.6)--不大于给定数字的最大整数

select round(3.44,1),round(3.46,4)--对给定数字四舍五入

select sqrt(4) --求平方根

select log10(10) --求以10为底的对数

select log(10)--求自然对数

select power(2,8)--求2的8次方

select square(3)--求平方

--****************************************字符串函数*******************************************--

select upper('asdasdASDSDAD')--将小写转换为大写

select lower('asdasddaASDASD')--将大写转换为小写

select 'asd'+space(100)+'qwe' --产生空格

select replicate('asd',5)--重复字符串若干次 

select stuff('aaaaaaa',2,3,'ccccc')--替换字符串，参数一，需要替换的字符串，
                                   --参数二，替换的开始位置
                                   --参数三，替换的长度
                                   --参数四，替换的内容

select reverse('asd')--反向输出

select ltrim('      asd       ')--去除左空格

select rtrim('        asd     ')--去除右空格

select charindex('sd','asdasdasdasdasdasdsd')--在第二个字符串中查找第一个字符串的起始位置

USE pubs
GO
SELECT PATINDEX('%wonderful%', notes),*  --查找字符串在列中的位置
FROM titles



select substring('asdas dasdasdasd',3,6)--从第一个参数（字符串）中的第3个位置取6个字符长


--'    asd   as d  '
select upper(substring('    asd   ij k  ',5,3))+substring('    asd   ij k  ',11,2)+
substring('    asd   ij k  ',14,1)


select left('asdasdasdas',4)  --从字符串左端第一位取字符串

select right('asdasdasdas',4)  --从字符串右端取倒数4位

select ascii('a'),ascii('&'),ascii('+'),ascii('里')--将字符或符号转换为ASCII码

select char(97)--将ASCII码转换为字符

select str(98)-- 将数字转换为字符串型

--********************************************日期和时间函数************************************--

select getdate()--获取服务器当前时间

select dateadd(month,500,getdate())--从当前时间起后500月的日期

select datediff(day,'1949-10-01','1949-10-02')--计算两个时间的差，单位由第一个参数决定

select datepart(day,getdate()),datepart(month,getdate()),datepart(year,getdate())--截取时间一部份

select datename(day,getdate()),datename(month,getdate()),datename(year,getdate())--转换大写

--**************************************系统函数**********************************************--

select * from sysdatabases

select db_id('jerry') --根据数据库名获取序号

select db_name(1)     --根据序号获取数据库名

select host_id(),host_name()  --获取主机（服务器）的id和名称

select object_id('pubs.dbo.titles')--获取数据库对象id

select object_name(2121058592)--根据数据库对象id查询数据库对象名

select user_id(),user_name() --查询当前登录用户的id和名称

select col_name(2121058592,3) --查询列名

select col_length('titles','title_id')--查询字段定义的长度

select index_col('titles',1,2) -- 查询索引名

select datalength(1+1)  --返回合法表达式的字节长


--**********************************转换函数**************************************************--

select cast(123.556 as decimal(10,7))  --cast(合法表达式 as 目标数据类型)

select convert(varchar(20),getdate())  --convert(目标数据类型,合法表达式)

select * from titles where convert(varchar(10),price) like '%6%'--查询价格中有“6”的数据

select * from titles where cast(price as varchar(10)) like '%6%'

--*********************************聚合函数****************************************************--

select sum(price)from titles where type='business' --SUM求和。求一列数据的和

select min(price) from titles --求最小值

select max(title) from titles --求最大值

select avg(price) from titles --求平均值

select count(*) from titles  --计算记录数量

select count(price) from titles  --COUNT函数注意事项：计算出来的值不包含空值

/*
  聚合函数不能单独和不同的列一起使用
  select min(price),* from titles
  以上语句绝对错误,以后谁写成以上类型,坚决灭掉 
*/