--�鿴��ͼ�����﷨
execute sp_helpText @objname =��ͼ��������

--===============================================================
--������ͼ

create view ��ͼ����
with ENCRYPTION 
as
	SQL���


--������sp_helpText�鿴���


--================================================================
--������
create table �༶ 
(
	�༶��� int not null,
	�༶���� varchar(30) not null,
	�༶���� nvarchar(100) null
)

create table ѧ��
(
	ѧ����� int not null,
	�༶��� int not null,
	ѧ������ nvarchar(20) not null,
	�������� DateTime null,
	�Ա� nvarchar(1) null
)

--������ͼ
create view V_ѧ����Ϣ
As
	select �༶.�༶���, �༶.�༶����,
		ѧ��.ѧ�����,ѧ��.ѧ������,ѧ��.��������
	from �༶ inner join ѧ��
		on �༶.�༶��� = ѧ��.�༶���

--��������
insert into V_ѧ����Ϣ(�༶���, �༶����, ѧ�����, ѧ������, ��������)
values(1, '�������9��', 1, '����', '1991-7-14')

--��������
insert into V_ѧ����Ϣ(�༶���, �༶����, ѧ������, ��������)
values(1, '�������9��', '����', '1991-7-14')

--��ѯ����
select * from �༶
select * from ѧ��

--��������
insert into �༶(�༶���, �༶����, �༶����)
values(3, '�������1��', '��ѧϰSqlServer֪ʶ')
insert into ѧ��(ѧ�����, �༶���, ѧ������, ��������, �Ա�)
values(3, 2, 'haha', '1981-7-14', 'Ů')

delete from V_ѧ����Ϣ where �༶��� = 1

--�޸���ͼ(��ԭ��ͼ��Ϊ���ڵ��������ͼ)
alter view V_ѧ����Ϣ
as
	select ѧ�����, �༶���, ѧ������, ��������, �Ա� from ѧ��

select * from ѧ��
--����ͼ�гɹ���������
insert into V_ѧ����Ϣ(ѧ�����, �༶���, ѧ������, ��������, �Ա�)
values(12, 3, '����ͼ��', GetDate(), '��')

select * from V_ѧ����Ϣ
select * from ѧ��

--ɾ������
delete from V_ѧ����Ϣ where ѧ����� = 1
select * from ѧ��
