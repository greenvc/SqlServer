set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER FUNCTION [dbo].[ChangeBigSmall]
(@ChangeMoney money)  
RETURNS VarChar(100) AS   

BEGIN 
    Declare    @String1    char(20)
    Declare    @String2    char(30)
    Declare    @String4    Varchar(100)
    Declare @String3     Varchar(100)    --从原A值中取出的值
    Declare @i         int        --循环变量
    Declare @J         Int        --A的值乘以100的字符串长度
    Declare @Ch1         Varchar(100)    --数字的汉语读法
    Declare @Ch2         Varchar(100)    --数字位的汉字读法
    Declare @Zero         Int        --用来计算连续有几个零
    Declare    @Returnvalue    VarChar(100)

    Select  @Returnvalue = ''
    Select     @String1 = '零壹贰叁肆伍陆柒捌玖'
    Select    @String2 = '万仟佰拾亿仟佰拾万仟佰拾元角分'

    Select @String4 = Cast(@ChangeMoney*100 as int)    

    select @J=len(cast((@ChangeMoney*100) as int))

    Select @String2=Right(@String2,@J)

    Select    @i = 1 

    while    @i<= @j Begin

        Select @String3 = Substring(@String4,@i,1)

        if @String3<>'0' Begin

            Select     @Ch1 = Substring(@String1, Cast(@String3 as Int) + 1, 1)
            Select    @Ch2 = Substring(@String2, @i, 1)
            Select    @Zero = 0                    --表示本位不为零
        end
        else Begin
            If (@Zero = 0) Or (@i = @J - 9) Or (@i = @J - 5) Or (@i = @J - 1)
                        Select @Ch1 = '零' 
                    Else
                        Select @Ch1 = ''

                    Select @Zero = @Zero + 1             --表示本位为0
                        
            --如果转换的数值需要扩大，那么需改动以下表达式 I 的值。
            Select @Ch2 = ''

                If @i = @J - 10  Begin
                        Select @Ch2 = '亿'
                        Select @Zero = 0
            end
                    
            If @i = @J - 6 Begin
                        Select @Ch2 = '万'
                        Select @Zero = 0
            end
                    
            if @i = @J - 2 Begin
                        Select @Ch2 = '元'
                        Select @Zero = 0
            end
                    
            If @i = @J 
                        Select @Ch2 = '整'
                        
        end    

        Select @Returnvalue = @Returnvalue + @Ch1 + @Ch2

        select @i = @i+1
    end

    --最后将多余的零去掉
    If CharIndex('仟仟',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '仟仟', '仟')

    If CharIndex('佰佰',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '佰佰', '佰')

        If CharIndex('零元',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '零元', '元')
    
        If CharIndex('零万',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '零万', '万')
   
        If CharIndex('零亿',@Returnvalue) <> 0
            Select @Returnvalue = Replace(@Returnvalue, '零亿', '亿')
    
        If CharIndex('零整',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '零整', '整')
    
    If CharIndex('零佰',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '零佰', '零')

    If CharIndex('零仟',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '零仟', '零')

    If CharIndex('元元',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '元元', '元')

    return @Returnvalue

END