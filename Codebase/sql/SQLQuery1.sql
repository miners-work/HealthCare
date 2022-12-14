select * from [dbo].[modified1]
where id >120


DECLARE @rdate DATE
DECLARE @startLoopID INT = 240
DECLARE @endLoopID INT = 360 -- Rows you want to add

WHILE @startLoopID <= @endLoopID
BEGIN
    SET @rdate = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 364 ), '2021-01-01');
    SET @startLoopID = @startLoopID + 1;

    update  [dbo].[modified1] set Reported_Date = @rdate
	where id = @startLoopID
	and prognosis ='AIDS';
END