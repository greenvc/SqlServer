use pubs
select au_fname,au_lname
into author_names
from authors
go

select *
from author_names
go