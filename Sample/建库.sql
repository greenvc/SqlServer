use master
go
/*创建Student数据库*/
create database Student
on primary
(
	name = Student_data,  /*主数据文件*/
	filename = 'd:\Database\Student_data.mdf',
	size=20,
	maxsize=unlimited,
	filegrowth=1
)
log on
(
	name = Student_log,  /*日志文件*/
	filename = 'd:\Database\Student_log.ldf',
	size=1,
	maxsize=100,
	filegrowth=10%
)
go