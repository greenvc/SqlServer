if (select count(*) from authors where state = 'ca') > 0
begin
	select '���ݹ���' + convert(varchar(8),count(*))+
	       'λ����'
	from authors
	where state = 'ca'
end
else
	select 'û��һ�������Ǽ��ݵ�'