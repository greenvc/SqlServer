use pubs
go
--����һ����ͼ
create view au --auΪ��ͼ��
as
select dbo.titles.title,dbo.authors.au_fname+'.'+dbo.authors.au_lname as name,dbo.titles.type,dbo.titles.price,dbo.authors.state--��ͼ������ʾ���ֶ�
from titles,authors,titleauthor  --��ͼ�����ݱ���ı�
where dbo.titles.title_id=dbo.titleauthor.title_id and dbo.authors.au_id=dbo.titleauthor.au_id and dbo.authors.state<>'ca'--Ϊ������ֵѿ����˻�������ͼ���ϵ���������
go



alter view au --�޸���ͼ��ע�⣺�޸ĵ���ͼ�������Ѿ����ڵ���ͼ
as
select dbo.titles.title,dbo.authors.au_fname,dbo.authors.au_lname,dbo.titles.type,dbo.titles.price,dbo.authors.state,dbo.authors.address--�޸���ͼ������ʾ���ֶ�
from titles,authors,titleauthor  --��ͼ�����ݱ���ı�
where dbo.titles.title_id=dbo.titleauthor.title_id and dbo.authors.au_id=dbo.titleauthor.au_id and dbo.authors.state='ca'--Ϊ������ֵѿ����˻����޸���ͼ����������
go