select city,au_lname + ',' + au_fname as '����', '�绰����:  ' + phone as '�绰����' 
from authors
where state= 'ca'and 
      city <> 'Oakland'
order by au_lname asc