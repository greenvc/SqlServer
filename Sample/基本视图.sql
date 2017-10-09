--����һ����ͼ
USE Northwind
GO
CREATE VIEW EmployeeName AS
SELECT EmployeeID, LastName, FirstName
FROM Northwind.dbo.Employees
GO

--��ͼ�����������
SELECT LastName AS EmployeeLastName,
       OrderID, OrderDate
FROM Northwind.dbo.Orders AS Ord
     JOIN Northwind.dbo.EmployeeName as EmpN
       ON (Ord.EmployeeID = EmpN.EmployeeID)
WHERE OrderDate > '31 May, 1996'

--�������������
SELECT LastName AS EmployeeLastName,
       OrderID, OrderDate
FROM Northwind.dbo.Orders AS Ord
     JOIN Northwind.dbo.Employees as Emp
       ON (Ord.EmployeeID = Emp.EmployeeID)
WHERE OrderDate > '31 May, 1996'