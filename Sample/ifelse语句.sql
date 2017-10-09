if (select count(*) from authors where state = 'ca') > 0
begin
	select '加州共有' + convert(varchar(8),count(*))+
	       '位作者'
	from authors
	where state = 'ca'
end
else
	select '没有一个作者是加州的'