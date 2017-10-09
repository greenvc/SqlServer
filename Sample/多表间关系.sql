--使用关键字
--distinct 
--order by   
--top n  
--with ties的使用说明
use northwind

select *  from [order details]

select  orderid,productid,unitprice,quantity from [order details]

select top 10 orderid,productid,unitprice,quantity from [order details]

select top 10 percent orderid,productid,unitprice,quantity from [order details]

select *  from [order details] order by quantity desc

select *  from [order details] order by productid asc ,quantity desc

select top 10  with ties orderid,productid,unitprice,quantity from [order details] order by quantity

select orderid,productid,unitprice,quantity from [order details] where quantity=1

select quantity from [order details] where quantity=1

select distinct quantity from [order details] order by quantity

select distinct quantity from [order details] where quantity=1

select distinct orderid,quantity from [order details] 


--group by
--having
--的使用
USE northwind

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'orderhist')
    DROP TABLE orderhist
GO

CREATE TABLE orderhist
  (productid INT NOT NULL,
   orderid INT NOT NULL,
   quantity INT NOT NULL)

GO

INSERT orderhist VALUES(1,1,5)
INSERT orderhist VALUES(1,2,10)
INSERT orderhist VALUES(2,1,10)
INSERT orderhist VALUES(2,2,25)
INSERT orderhist VALUES(3,1,15)
INSERT orderhist VALUES(3,2,30)
INSERT orderhist VALUES(1,1,15)
INSERT orderhist VALUES(1,2,30)
INSERT orderhist VALUES(2,1,15)
INSERT orderhist VALUES(2,2,30)

select * from orderhist

select productid 产品编号,sum(quantity) 合计 from orderhist group by productid

select productid 产品编号,sum(quantity) 合计 from orderhist where productid<3 group by productid

select orderid,sum(quantity) from orderhist group by orderid

select productid,orderid,sum(quantity)  from orderhist group by productid,orderid

SELECT productid, SUM(quantity) AS 合计
FROM orderhist
GROUP BY productid

SELECT TOP 100 PERCENT productid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid
ORDER BY productid DESC, SUM(quantity) DESC

select productid 产品编号,sum(quantity) 合计 
from orderhist 
group by productid
having sum(quantity)>50

SELECT productid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid
HAVING (SUM(quantity) > 50) AND (SUM(quantity) < 75)
ORDER BY productid DESC


SELECT productid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid

SELECT productid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid
with rollup

SELECT productid,orderid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid,orderid
with cube

SELECT productid,orderid, SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid,orderid
with cube

SELECT productid,grouping(productid),orderid,grouping(orderid), SUM(quantity) AS Expr1
FROM orderhist
GROUP BY productid,orderid
with cube



--非标准的ANSI-92语句
--compute


select productid,orderid,quantity
from orderhist
compute sum(quantity)

select productid,orderid,quantity
from orderhist
order by productid,orderid
compute sum(quantity)

--compute by
select productid,orderid,quantity
from orderhist
order by productid,orderid
compute sum(quantity) by productid
compute sum(quantity)






--多表关系


--   一对一的表间关系
create table r
(
  bh int,
  xm  varchar(20)
)

create table fzjl
(
  bh int,
  fzjl varchar(30)
)

create table pxnx
(
  bh int,
  pxnx int
)

select * from r
select * from fzjl
select * from pxnx

insert into r values(130,'刘备')
insert into r values(131,'张飞')

insert into fzjl values(130,'杀人')
insert into fzjl values(131,'放火')

insert into pxnx values(131,4)
insert into pxnx values(130,10)

select * from r
select * from fzjl
select * from pxnx
select r.xm,pxnx.pxnx from r,pxnx where r.bh=pxnx.bh

select r.xm as 姓名,p.pxnx from r as r,pxnx as p where r.bh=p.bh

select * from r
select * from fzjl
select * from pxnx
select r.xm,f.fzjl from r,fzjl f where r.bh=f.bh



-- 一对多的表间关系
insert into fzjl values(130,'抢劫')
insert into fzjl values(131,'贩毒')


select * from r
select * from fzjl

select r.bh,r.xm,f.fzjl from r,fzjl as f where f.bh=r.bh order by r.bh

select r.bh,r.xm,f.fzjl from r,fzjl as f where r.bh=f.bh order by r.bh




--使用joindb数据库，创建多表间的连接关系
USE master
GO

IF EXISTS (SELECT name FROM master.sysdatabases WHERE name = N'joindb')
	DROP DATABASE [joindb]
GO

CREATE DATABASE [joindb]  ON (
NAME = N'joindb_data', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\joindb.mdf' , 
SIZE = 5, MAXSIZE = 10, 
FILEGROWTH = 1) 
LOG ON (
NAME = N'joindb_log', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\joindb.ldf' ,
SIZE = 1, MAXSIZE = 5, 
FILEGROWTH = 1)
GO


use [joindb]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[FK_Sales_Buyers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT FK_Sales_Buyers
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[FK_Sales_Produce]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT FK_Sales_Produce
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Sales]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Sales]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Buyers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Buyers]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Produce]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Produce]
GO

CREATE TABLE [dbo].[Buyers] (
	[buyer_id] [int] NOT NULL ,
	[buyer_name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Produce] (
	[prod_id] [int] NOT NULL ,
	[prod_name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Sales] (
	[buyer_id] [int] NOT NULL ,
	[prod_id] [int] NOT NULL ,
	[qty] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Buyers] WITH NOCHECK ADD 
	CONSTRAINT [PK_Buyers] PRIMARY KEY  CLUSTERED 
	(
		[buyer_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Produce] WITH NOCHECK ADD 
	CONSTRAINT [PK_Produce] PRIMARY KEY  CLUSTERED 
	(
		[prod_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Sales] ADD 
	CONSTRAINT [FK_Sales_Buyers] FOREIGN KEY 
	(
		[buyer_id]
	) REFERENCES [dbo].[Buyers] (
		[buyer_id]
	),
	CONSTRAINT [FK_Sales_Produce] FOREIGN KEY 
	(
		[prod_id]
	) REFERENCES [dbo].[Produce] (
		[prod_id]
	)
GO
--*********************************************************************

--Populate the database tables

Insert Into Buyers Values (1,'Adam Barr')
Insert Into Buyers Values (2,'Sean Chai')
Insert Into Buyers Values (3,'Eva Corets')
Insert Into Buyers Values (4,'Erin O''Melia')
go

--select * from Buyers

Insert Into Produce Values (1,'Apples')
Insert Into Produce Values (2,'Pears')
Insert Into Produce Values (3,'Oranges')
Insert Into Produce Values (4,'Bananas')
Insert Into Produce Values (5,'Peaches')
go

--select * from produce

Insert Into Sales Values (1,2,15)
Insert Into Sales Values (1,3,5)
Insert Into Sales Values (4,1,37)
Insert Into Sales Values (3,5,11)
Insert Into Sales Values (4,2,1003)
go

select * from Buyers
select * from produce
select * from Sales

select b.buyer_name,p.prod_name,s.qty 
from buyers b,produce p,sales s
where s.buyer_id=b.buyer_id and s.prod_id=p.prod_id 

select * from Buyers
select * from Sales

select b.buyer_name,s.qty 
from buyers b,sales s 
where b.buyer_id=s.buyer_id

select * from Buyers
select * from Sales

select b.buyer_name,s.qty 
from buyers b inner join sales s 
on b.buyer_id=s.buyer_id


SELECT Buyers.buyer_name, Produce.prod_name, Sales.qty
FROM Buyers INNER JOIN
      Sales ON Buyers.buyer_id = Sales.buyer_id INNER JOIN
      Produce ON Sales.prod_id = Produce.prod_id


select * from Buyers
select * from produce
select * from Sales

select b.buyer_id as buyer,s.buyer_id as sales from buyers b,sales s where b.buyer_id*=s.buyer_id
select b.buyer_id as buyer,s.buyer_id as sales from buyers b left join sales s on b.buyer_id=s.buyer_id

select * from Buyers
select * from Sales
select b.buyer_id as buyer,s.buyer_id as sales from buyers b,sales s where b.buyer_id=*s.buyer_id
select b.buyer_id as buyer,s.buyer_id as sales from buyers b right join sales s on b.buyer_id=s.buyer_id