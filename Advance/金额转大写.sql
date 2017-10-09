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
    Declare @String3     Varchar(100)    --��ԭAֵ��ȡ����ֵ
    Declare @i         int        --ѭ������
    Declare @J         Int        --A��ֵ����100���ַ�������
    Declare @Ch1         Varchar(100)    --���ֵĺ������
    Declare @Ch2         Varchar(100)    --����λ�ĺ��ֶ���
    Declare @Zero         Int        --�������������м�����
    Declare    @Returnvalue    VarChar(100)

    Select  @Returnvalue = ''
    Select     @String1 = '��Ҽ��������½��ƾ�'
    Select    @String2 = '��Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰԪ�Ƿ�'

    Select @String4 = Cast(@ChangeMoney*100 as int)    

    select @J=len(cast((@ChangeMoney*100) as int))

    Select @String2=Right(@String2,@J)

    Select    @i = 1 

    while    @i<= @j Begin

        Select @String3 = Substring(@String4,@i,1)

        if @String3<>'0' Begin

            Select     @Ch1 = Substring(@String1, Cast(@String3 as Int) + 1, 1)
            Select    @Ch2 = Substring(@String2, @i, 1)
            Select    @Zero = 0                    --��ʾ��λ��Ϊ��
        end
        else Begin
            If (@Zero = 0) Or (@i = @J - 9) Or (@i = @J - 5) Or (@i = @J - 1)
                        Select @Ch1 = '��' 
                    Else
                        Select @Ch1 = ''

                    Select @Zero = @Zero + 1             --��ʾ��λΪ0
                        
            --���ת������ֵ��Ҫ������ô��Ķ����±��ʽ I ��ֵ��
            Select @Ch2 = ''

                If @i = @J - 10  Begin
                        Select @Ch2 = '��'
                        Select @Zero = 0
            end
                    
            If @i = @J - 6 Begin
                        Select @Ch2 = '��'
                        Select @Zero = 0
            end
                    
            if @i = @J - 2 Begin
                        Select @Ch2 = 'Ԫ'
                        Select @Zero = 0
            end
                    
            If @i = @J 
                        Select @Ch2 = '��'
                        
        end    

        Select @Returnvalue = @Returnvalue + @Ch1 + @Ch2

        select @i = @i+1
    end

    --��󽫶������ȥ��
    If CharIndex('ǪǪ',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, 'ǪǪ', 'Ǫ')

    If CharIndex('�۰�',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '�۰�', '��')

        If CharIndex('��Ԫ',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '��Ԫ', 'Ԫ')
    
        If CharIndex('����',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '����', '��')
   
        If CharIndex('����',@Returnvalue) <> 0
            Select @Returnvalue = Replace(@Returnvalue, '����', '��')
    
        If CharIndex('����',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '����', '��')
    
    If CharIndex('���',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '���', '��')

    If CharIndex('��Ǫ',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, '��Ǫ', '��')

    If CharIndex('ԪԪ',@Returnvalue) <> 0 
            Select @Returnvalue = Replace(@Returnvalue, 'ԪԪ', 'Ԫ')

    return @Returnvalue

END