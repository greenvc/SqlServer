use pubs
select authors.au_lname + ',' +authors.au_fname as '��������',
	publishers.pub_name as '������',publishers.state as '����'
from	authors inner join publishers
	on authors.state = publishers.state
order by 'name'