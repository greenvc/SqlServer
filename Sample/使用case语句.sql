use pubs
go

select * from authors

select au_fname,au_lname,state,
case state
when 'CA' then '����'
when 'KS' then '����ʩ��'
when 'TN' then '��������'
when 'IN' then 'Ӫ�ذ�����'
else '��֪������'
end
from authors

select * from titles

select '�۸����'=
case 
when price is null 	then 'û�м۸�'
when price<10.0      	then '���۵���'
when price>=10.0 and price<20.0 then '�������'
else '���̫����'
end,
price,title from titles

update titles
set price=price/2

select * from authors
