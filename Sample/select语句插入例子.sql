USE PUBS
create table telphone
(    ��������  varchar(32),
     �绰����  varchar(18)
)
go

insert telphone
	select au_lname + ',' + au_fname as '��������',phone as '�绰����'
	from authors
	order by '��������'
go

select * from telphone
go 	    