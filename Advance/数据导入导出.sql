--导出excel
EXEC master..xp_cmdshell 'bcp 示例.dbo.客户 out c:\客户.xls -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'

--导入Excel
CREATE TABLE [导入Excel] (
	[客户ID] [nvarchar] (37) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[公司名称] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[联系人姓名] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[联系人头衔] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[地址] [nvarchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[城市] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[地区] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[邮政编码] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[国家] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[电话] [nvarchar] (24) COLLATE Chinese_PRC_CI_AS NULL ,
	[传真] [nvarchar] (24) COLLATE Chinese_PRC_CI_AS NULL ,
	[s_ColLineage] [image] NULL ,
	[s_Generation] [int] NULL ,
	[s_GUID] [uniqueidentifier] NULL ,
	[s_Lineage] [image] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

select * from 导入Excel
GO
EXEC master..xp_cmdshell 'bcp 示例.dbo.导入Excel in c:\客户.xls -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'
GO
select * from 导入Excel 
GO

--导出txt
EXEC master..xp_cmdshell 'bcp "Select 客户ID, 公司名称, 联系人姓名, 联系人头衔, 地址, 城市 from 示例.dbo.客户" queryout c:\客户.txt -c -q -S"GREENVC\WWWPRANA" -U"sa" -P"server"'

--内连接导出至txt
EXEC master..xp_cmdshell 'bcp "SELECT C.姓氏 + C.名字 AS 姓名, B.订单ID, B.订购日期, A.单价, A.数量, A.产品ID FROM 示例.dbo.订单明细 AS A INNER JOIN 示例.dbo.订单 AS B ON A.订单ID =B.订单ID INNER JOIN 示例.dbo.雇员 AS C ON B.雇员ID = C.雇员ID" queryout c:\雇员订单.txt -c -q -S"GREENVC\WWWPRANA" -U"sa" -P"server"'


--导入txt
CREATE TABLE [导入txt] (
	[客户ID] [nvarchar] (37) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[公司名称] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[联系人姓名] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[联系人头衔] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[地址] [nvarchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[城市] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

select * from 导入txt 
GO
EXEC master..xp_cmdshell 'bcp 示例.dbo.导入txt in c:\客户.txt -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'
GO
select * from 导入txt 
GO


--命令行导出
isql -S"GREENVC\WWWPRANA"  -U"sa" -P"server" -Q"select * from 示例.dbo.客户" -o "c:\客户.xls"