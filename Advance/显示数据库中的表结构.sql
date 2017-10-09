SELECT 
	(case when syscolumns.colorder=1 then sysobjects.name else '' end) AS '����',
	syscolumns.colorder AS '�ֶ����',
	syscolumns.name AS '�ֶ���',
	(case when COLUMNPROPERTY( syscolumns.id,syscolumns.name,'IsIdentity')=1 then '��' else '' end) AS '��ʶ',
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
	(xtype = 'PK'))>0 then '��' else '' end) AS '����',
	systypes.name AS '����',
	syscolumns.length AS 'ռ���ֽ���',
	COLUMNPROPERTY(syscolumns.id,syscolumns.name,'PRECISION') AS '����',
	isnull(COLUMNPROPERTY(syscolumns.id,syscolumns.name,'Scale'),0) AS 'С��λ��',
	(case when syscolumns.isnullable=1 then '��'else '' end) AS '�����',
	isnull(syscomments.text,'') AS 'Ĭ��ֵ',
	isnull(sysproperties.[value],'') AS '�ֶ�˵��'
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