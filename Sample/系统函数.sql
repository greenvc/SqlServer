--��ѧ����
select asin(0.1)  --������

select acos(0.1)  --������

select sin(1) --������

select atan(0.1)--������

select cos(1)--������

select tan(1)--������

select degrees(1) --������ת��Ϊ�Ƕ�

select radians(90)--���Ƕ�ת��Ϊ����

select pi()--���ֵ

select rand()--����0-1֮��������

select sign(3),sign(0),sign(-34) --������ַ��ţ��������1���������-1

select abs(-5),abs(0),abs(5)--�����ֵ

select exp(5)--��ָ��

select 9%3  --����

select ceiling(3.6),ceiling(3.2),ceiling(-4.2)--��С�ڸ������ֵ���С����

select floor(3.6)--�����ڸ������ֵ��������

select round(3.44,1),round(3.46,4)--�Ը���������������

select sqrt(4) --��ƽ����

select log10(10) --����10Ϊ�׵Ķ���

select log(10)--����Ȼ����

select power(2,8)--��2��8�η�

select square(3)--��ƽ��

--****************************************�ַ�������*******************************************--

select upper('asdasdASDSDAD')--��Сдת��Ϊ��д

select lower('asdasddaASDASD')--����дת��ΪСд

select 'asd'+space(100)+'qwe' --�����ո�

select replicate('asd',5)--�ظ��ַ������ɴ� 

select stuff('aaaaaaa',2,3,'ccccc')--�滻�ַ���������һ����Ҫ�滻���ַ�����
                                   --���������滻�Ŀ�ʼλ��
                                   --���������滻�ĳ���
                                   --�����ģ��滻������

select reverse('asd')--�������

select ltrim('      asd       ')--ȥ����ո�

select rtrim('        asd     ')--ȥ���ҿո�

select charindex('sd','asdasdasdasdasdasdsd')--�ڵڶ����ַ����в��ҵ�һ���ַ�������ʼλ��

USE pubs
GO
SELECT PATINDEX('%wonderful%', notes),*  --�����ַ��������е�λ��
FROM titles



select substring('asdas dasdasdasd',3,6)--�ӵ�һ���������ַ������еĵ�3��λ��ȡ6���ַ���


--'    asd   as d  '
select upper(substring('    asd   ij k  ',5,3))+substring('    asd   ij k  ',11,2)+
substring('    asd   ij k  ',14,1)


select left('asdasdasdas',4)  --���ַ�����˵�һλȡ�ַ���

select right('asdasdasdas',4)  --���ַ����Ҷ�ȡ����4λ

select ascii('a'),ascii('&'),ascii('+'),ascii('��')--���ַ������ת��ΪASCII��

select char(97)--��ASCII��ת��Ϊ�ַ�

select str(98)-- ������ת��Ϊ�ַ�����

--********************************************���ں�ʱ�亯��************************************--

select getdate()--��ȡ��������ǰʱ��

select dateadd(month,500,getdate())--�ӵ�ǰʱ�����500�µ�����

select datediff(day,'1949-10-01','1949-10-02')--��������ʱ��Ĳ��λ�ɵ�һ����������

select datepart(day,getdate()),datepart(month,getdate()),datepart(year,getdate())--��ȡʱ��һ����

select datename(day,getdate()),datename(month,getdate()),datename(year,getdate())--ת����д

--**************************************ϵͳ����**********************************************--

select * from sysdatabases

select db_id('jerry') --�������ݿ�����ȡ���

select db_name(1)     --������Ż�ȡ���ݿ���

select host_id(),host_name()  --��ȡ����������������id������

select object_id('pubs.dbo.titles')--��ȡ���ݿ����id

select object_name(2121058592)--�������ݿ����id��ѯ���ݿ������

select user_id(),user_name() --��ѯ��ǰ��¼�û���id������

select col_name(2121058592,3) --��ѯ����

select col_length('titles','title_id')--��ѯ�ֶζ���ĳ���

select index_col('titles',1,2) -- ��ѯ������

select datalength(1+1)  --���غϷ����ʽ���ֽڳ�


--**********************************ת������**************************************************--

select cast(123.556 as decimal(10,7))  --cast(�Ϸ����ʽ as Ŀ����������)

select convert(varchar(20),getdate())  --convert(Ŀ����������,�Ϸ����ʽ)

select * from titles where convert(varchar(10),price) like '%6%'--��ѯ�۸����С�6��������

select * from titles where cast(price as varchar(10)) like '%6%'

--*********************************�ۺϺ���****************************************************--

select sum(price)from titles where type='business' --SUM��͡���һ�����ݵĺ�

select min(price) from titles --����Сֵ

select max(title) from titles --�����ֵ

select avg(price) from titles --��ƽ��ֵ

select count(*) from titles  --�����¼����

select count(price) from titles  --COUNT����ע��������������ֵ��������ֵ

/*
  �ۺϺ������ܵ����Ͳ�ͬ����һ��ʹ��
  select min(price),* from titles
  ���������Դ���,�Ժ�˭д����������,������ 
*/