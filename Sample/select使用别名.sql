select city,au_lname + ',' + au_fname as '姓名', '电话号码:  ' + phone as '电话号码' 
from authors
where state= 'ca'and 
      city <> 'Oakland'
order by au_lname asc