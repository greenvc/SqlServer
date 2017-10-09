use pubs
go
--创建一个视图
create view au --au为视图名
as
select dbo.titles.title,dbo.authors.au_fname+'.'+dbo.authors.au_lname as name,dbo.titles.type,dbo.titles.price,dbo.authors.state--视图中所显示的字段
from titles,authors,titleauthor  --视图中数据保存的表
where dbo.titles.title_id=dbo.titleauthor.title_id and dbo.authors.au_id=dbo.titleauthor.au_id and dbo.authors.state<>'ca'--为避免出现笛卡尔乘积，给视图加上的限制条件
go



alter view au --修改视图，注意：修改的视图必须是已经存在的视图
as
select dbo.titles.title,dbo.authors.au_fname,dbo.authors.au_lname,dbo.titles.type,dbo.titles.price,dbo.authors.state,dbo.authors.address--修改视图中所显示的字段
from titles,authors,titleauthor  --视图中数据保存的表
where dbo.titles.title_id=dbo.titleauthor.title_id and dbo.authors.au_id=dbo.titleauthor.au_id and dbo.authors.state='ca'--为避免出现笛卡尔乘积，修改视图的限制条件
go