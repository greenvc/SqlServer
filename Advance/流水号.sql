drop table tb_Serial
GO
--创建表
Create table tb_Serial
(
	ID int Identity(1,1),
	AccountID varchar(14),
	Phone nvarchar(11),
	Address nvarchar(200)
)
--插入数据
insert into tb_Serial(AccountID, Phone, Address)
values('20060429000000', '13888888888', '翠湖小区')
--检索数据
select * from tb_Serial
--定义变量
declare @Serial varchar(8)
--对变量赋值(用日期函数得到一段规则字符串)
set @Serial = Convert(varchar(8), GetDate(), 112)
print @Serial
--定义流水号
declare @MaxAccountID varchar(14)
declare @Temp int
declare @AccountID varchar(14)
--获取最大流水号
set @MaxAccountID = ( select max(substring(AccountID, 9, 6)) from tb_Serial)
print @MaxAccountID
--设置中间变量(整型数值相加)
set @Temp = convert(int, @MaxAccountID) + 1
print @Temp
--设置流水号(字符串相加)
set @AccountID = @Serial + Right(('000000' + cast(@Temp as varchar(6))), 6)
print @AccountID
--插入数据
insert into tb_Serial(AccountID, Phone, Address)
values(@AccountID, '13888888889', '翠湖小区')
--检索数据
select * from tb_Serial