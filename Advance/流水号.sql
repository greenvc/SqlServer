drop table tb_Serial
GO
--������
Create table tb_Serial
(
	ID int Identity(1,1),
	AccountID varchar(14),
	Phone nvarchar(11),
	Address nvarchar(200)
)
--��������
insert into tb_Serial(AccountID, Phone, Address)
values('20060429000000', '13888888888', '���С��')
--��������
select * from tb_Serial
--�������
declare @Serial varchar(8)
--�Ա�����ֵ(�����ں����õ�һ�ι����ַ���)
set @Serial = Convert(varchar(8), GetDate(), 112)
print @Serial
--������ˮ��
declare @MaxAccountID varchar(14)
declare @Temp int
declare @AccountID varchar(14)
--��ȡ�����ˮ��
set @MaxAccountID = ( select max(substring(AccountID, 9, 6)) from tb_Serial)
print @MaxAccountID
--�����м����(������ֵ���)
set @Temp = convert(int, @MaxAccountID) + 1
print @Temp
--������ˮ��(�ַ������)
set @AccountID = @Serial + Right(('000000' + cast(@Temp as varchar(6))), 6)
print @AccountID
--��������
insert into tb_Serial(AccountID, Phone, Address)
values(@AccountID, '13888888889', '���С��')
--��������
select * from tb_Serial