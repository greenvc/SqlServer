SELECT 
	(case when syscolumns.colorder=1 then sysobjects.name else '' end) AS '表名',
	syscolumns.colorder AS '字段序号',
	syscolumns.name AS '字段名',
	(case when COLUMNPROPERTY( syscolumns.id,syscolumns.name,'IsIdentity')=1 then '√' else '' end) AS '标识',
	(case when (SELECT count(*)
	
	FROM sysobjects
	
	WHERE (name in
	   (SELECT name
	  FROM sysindexes
	  WHERE (id = syscolumns.id) AND (indid in
	            (SELECT indid
	           FROM sysindexkeys
	           WHERE (id = syscolumns.id) AND (colid in
	                     (SELECT colid
	                    FROM syscolumns
	                    WHERE (id = syscolumns.id) AND (name = syscolumns.name))))))) AND
	(xtype = 'PK'))>0 then '√' else '' end) AS '主键',
	systypes.name AS '类型',
	syscolumns.length AS '占用字节数',
	COLUMNPROPERTY(syscolumns.id,syscolumns.name,'PRECISION') AS '长度',
	isnull(COLUMNPROPERTY(syscolumns.id,syscolumns.name,'Scale'),0) AS '小数位数',
	(case when syscolumns.isnullable=1 then '√'else '' end) AS '允许空',
	isnull(syscomments.text,'') AS '默认值',
	isnull(sysproperties.[value],'') AS '字段说明'
	--into ##TableInfo

FROM  syscolumns left join systypes
	on  syscolumns.xtype=systypes.xusertype
	inner join sysobjects  
	on syscolumns.id=sysobjects.id  and  sysobjects.xtype='U' and  sysobjects.name<>'dtproperties'
	left join syscomments 
	on syscolumns.cdefault=syscomments.id
	left join sysproperties 
	on syscolumns.id=sysproperties.id AND syscolumns.colid = sysproperties.smallid  
order by object_name(syscolumns.id),syscolumns.colorder