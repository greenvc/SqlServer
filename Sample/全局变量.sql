select @@connections  --返回自上次服务器启动以来试图连接的次数

select @@cpu_busy  --返回CPU工作时间

SET DATEFIRST 1
select @@DATEFIRST  --设置或返回每个星期的第一天

select @@dbts  --返回当前数据库中timestamp的值

select * from dbo.a
select aaaaa from titles
select @@error --返回最后执行的 Transact-SQL 语句的错误代码。

select @@identity  --返回最后一个标示列的值

select @@idle  --返回CPU的闲置时间

select @@io_busy  --返回输入和输出操作的时间

select @@langid  --返回当地语言id

select @@language  --返回当地语言

select @@lock_timeout  --返回当前锁超时设置

select @@MAX_CONNECTIONS  --返回服务器允许的最大连接数

select @@MAX_PRECISION  --返回当前所设置的decimal数据类型最大精度

select @@NESTLEVEL  --返回当前存储过程执行的嵌套层次

select @@OPTIONS          --返回当前设置选项的信息。

select @@PACK_RECEIVED  --返回从网络上读取的输入数据包数目。

select @@PACK_sent  --返回从网络上读取的输出数据包数目。

select @@PACKet_errors --返回连接上发生的网络数据包错误数

select @@PROCID      --返回当前过程的存储过程标识符 (ID) 。

select @@REMSERVER   --返回远程数据库服务器在登录记录中出现时名称。

select @@servername  --返回服务器名

select @@SERVICENAME --返回实例名

select @@SPID    ---返回当前用户进程的服务器进程标识符 

select @@TEXTSIZE  --返回text 或 image 数据的最大长度

select @@TIMETICKS  --返回一刻度的微秒数。

select @@total_errors  --返回磁盘读写错误数

select @@total_read   --返回磁盘读取数

select @@total_write  --返回磁盘写入数

select @@trancount  --返回活动事务数

select @@version  --返回当前安装的日期、版本和处理器类型
