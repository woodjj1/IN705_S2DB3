/****** Script for SelectTopNRows command from SSMS  

SELECT TOP (1000) [PaperID]
      ,[SemesterID]
      ,[PersonID]
  FROM [IN705_201902_kwood].[dbo].[Enrolment]
  
  Week 2 labs are due on Friday 16 August

 13.1 Develop a stored procedure [EnrolmentCount] that accepts a paperID
		and a semesterID and calculates the number of enrolments in the 
		relevant paper instance. It returns the enrolment count as an
		output parameter.

		drop proc EnrolmentCount
		create proc EnrolmentCount(@paperID nvarchar(20), @semesterID nvarchar(20), @EnrolmentCount nvarchar(20) output)
		as 
		select count(personID) as Count from Enrolment
		where @paperID = PaperID and @semesterID = semesterID

		set @EnrolmentCount = 
		(
		select count(PersonID) from Enrolment
		where PaperID = @paperID AND
		SemesterID = @semesterID
		)
		go

		
	    declare @EnrolmentCount nvarchar(50)
		exec EnrolmentCount 'IN238', '2017S1', @EnrolmentCount output

		Drop procedure EnrolmentCount;
		go


		
13.2	Re-develop stored procedure [EnrolmentCount] so that semesterID
		is optional and defaults to the current semester. If there is no
		current semester, it chooses the most recent semester. 

		
		
    	create proc EnrolmentCountTest(@PaperID nvarchar(10),@SemesterID VARCHAR(6) = null )
		as
		begin 
		
		set nocount on
		if @SemesterID is null  
		BEGIN
		set @SemesterID = (select top 1 SemesterID from Enrolment where PaperID= @PaperID and SemesterID = (select SemesterID from Semester where getdate() between Startdate and EndDate AND PaperID= @PaperID) )
		end
		if @SemesterID is null  
		BEGIN
		set @SemesterID = (select top 1 SemesterID from Enrolment where PaperID= @PaperID and SemesterID = (select SemesterID from Semester where getdate() between EndDate and StartDate AND PaperID= @PaperID) )
		end
		end
		select PaperID,count(SemesterID) as "# of Enrolments" from Enrolment where SemesterID = @SemesterID and PaperID = @PaperID group by PaperID
		go 

		select * from Enrolment
		
		insert into Enrolment(PaperID, SemesterID, PersonID)
		values ('IN511', '2019S2', '122')

13.3  Write the script you will need to test 13.2 hint: you may have to cast your output.
	
		*/
		exec EnrolmentCountTest 'IN510','2019S1'
		exec EnrolmentCountTest 'IN511'

		select * from Enrolment
