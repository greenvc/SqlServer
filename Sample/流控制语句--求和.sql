declare @i int
declare @sum int
set @i=1
set @sum=0

while @i<=100
begin
  
  set @sum=@sum+@i
  set @i=@i+1
  if @i=69 break
end

select @i,@sum