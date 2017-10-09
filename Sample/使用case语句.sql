use pubs
go

select * from authors

select au_fname,au_lname,state,
case state
when 'CA' then '加州'
when 'KS' then '康撒施州'
when 'TN' then '田纳西州'
when 'IN' then '营地安娜州'
else '不知道的州'
end
from authors

select * from titles

select '价格类别'=
case 
when price is null 	then '没有价格'
when price<10.0      	then '打折的书'
when price>=10.0 and price<20.0 then '书价适中'
else '书价太贵了'
end,
price,title from titles

update titles
set price=price/2

select * from authors
