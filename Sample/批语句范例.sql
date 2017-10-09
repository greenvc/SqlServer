use pubs
go 

create table testtable
(
	column1     int,
	column2     varchar(32)
)
go

insert into testtable values(1,'test value 1')
update testtable set column2 = 'updated test value 1'
delete testtable where column1 = 1
go

drop table testtable
go