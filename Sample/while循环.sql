select min(price) as '��С�۸�',max(price) as '���۸�'
from titles
go

begin transaction
go

while (select avg(price) from titles) < $30
begin
	update titles
	     set price = price * 2
	if (select max(price) from titles) > $50
	     break
	else
	     continue
end

select min(price) as '��С�۸�',max(price) as '���۸�'
from titles
go

select 'prices are getting out of hand'
go

rollback transaction
go