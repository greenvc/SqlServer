USE PUBS
create table telphone
(    作者名字  varchar(32),
     电话号码  varchar(18)
)
go

insert telphone
	select au_lname + ',' + au_fname as '作者名字',phone as '电话号码'
	from authors
	order by '作者名字'
go

select * from telphone
go 	    