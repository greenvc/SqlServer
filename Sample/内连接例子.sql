use pubs
select authors.au_lname + ',' +authors.au_fname as '作者名称',
	publishers.pub_name as '出版社',publishers.state as '州名'
from	authors inner join publishers
	on authors.state = publishers.state
order by 'name'