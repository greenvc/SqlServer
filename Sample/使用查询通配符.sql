--使用查询通配符

use northwind
go

select * from customers

select companyname,phone from customers where phone like '(5)%'

select companyname,phone from customers where companyname like '%restaurant%'

select customerid,companyname,phone from customers where customerid like 'B____'

select companyname,phone from customers where companyname like '___ %'

select companyname,phone from customers where companyname like '[AN]%'

select companyname,phone from customers where companyname like '[A-N]%'

select companyname,phone from customers where companyname like '[^AN]%'


select * from employees

select max(birthdate) from employees
select min(birthdate) from employees

select * from employees where birthdate between '1937-09-19' and '1966-01-26'


use pubs
go


select * from authors

select distinct state from authors

select * from authors where state in ('TN','CA')

update authors
set city=null
where city='Oakland'

select * from authors where city is null


update authors
set city='Oakland'
where city is null
