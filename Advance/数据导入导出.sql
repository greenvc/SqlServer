--����excel
EXEC master..xp_cmdshell 'bcp ʾ��.dbo.�ͻ� out c:\�ͻ�.xls -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'

--����Excel
CREATE TABLE [����Excel] (
	[�ͻ�ID] [nvarchar] (37) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[��˾����] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[��ϵ������] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[��ϵ��ͷ��] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[��ַ] [nvarchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[����] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[����] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[��������] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[����] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[�绰] [nvarchar] (24) COLLATE Chinese_PRC_CI_AS NULL ,
	[����] [nvarchar] (24) COLLATE Chinese_PRC_CI_AS NULL ,
	[s_ColLineage] [image] NULL ,
	[s_Generation] [int] NULL ,
	[s_GUID] [uniqueidentifier] NULL ,
	[s_Lineage] [image] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

select * from ����Excel
GO
EXEC master..xp_cmdshell 'bcp ʾ��.dbo.����Excel in c:\�ͻ�.xls -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'
GO
select * from ����Excel 
GO

--����txt
EXEC master..xp_cmdshell 'bcp "Select �ͻ�ID, ��˾����, ��ϵ������, ��ϵ��ͷ��, ��ַ, ���� from ʾ��.dbo.�ͻ�" queryout c:\�ͻ�.txt -c -q -S"GREENVC\WWWPRANA" -U"sa" -P"server"'

--�����ӵ�����txt
EXEC master..xp_cmdshell 'bcp "SELECT C.���� + C.���� AS ����, B.����ID, B.��������, A.����, A.����, A.��ƷID FROM ʾ��.dbo.������ϸ AS A INNER JOIN ʾ��.dbo.���� AS B ON A.����ID =B.����ID INNER JOIN ʾ��.dbo.��Ա AS C ON B.��ԱID = C.��ԱID" queryout c:\��Ա����.txt -c -q -S"GREENVC\WWWPRANA" -U"sa" -P"server"'


--����txt
CREATE TABLE [����txt] (
	[�ͻ�ID] [nvarchar] (37) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[��˾����] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[��ϵ������] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[��ϵ��ͷ��] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[��ַ] [nvarchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[����] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

select * from ����txt 
GO
EXEC master..xp_cmdshell 'bcp ʾ��.dbo.����txt in c:\�ͻ�.txt -c -S"GREENVC\WWWPRANA" -U"sa" -P"server"'
GO
select * from ����txt 
GO


--�����е���
isql -S"GREENVC\WWWPRANA"  -U"sa" -P"server" -Q"select * from ʾ��.dbo.�ͻ�" -o "c:\�ͻ�.xls"