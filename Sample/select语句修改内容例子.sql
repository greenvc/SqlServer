USE PUBS
select *
from authors
where au_id = '172-32-1176'
go

update authors
set phone = '123-45-6789'
where au_id = '172-32-1176'
go

select *
from authors
where au_id = '123-45-6789'
go