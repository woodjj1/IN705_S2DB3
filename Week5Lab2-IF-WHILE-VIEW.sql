/*
Using Transact-SQL : Exercises
------------------------------------------------------------

Exercises for Section 15


15.1    Develop a view [BigPaperInstance] that finds the 10 paper instances
		with the most enrolments. Show the paperID, paper name,
		semesterID, start date and end date of the paper instance.

		create view BigPaperInstance
		as
		select top 10 count(Enrolment.PaperID) as Count,PaperInstance.PaperID,Paper.PaperName, Semester.SemesterID,Semester.StartDate, Semester.EndDate from PaperInstance
		join Paper on Paper.PaperID = PaperInstance.PaperID
		join Enrolment on Enrolment.PaperID = PaperInstance.PaperID
		join Semester on Semester.SemesterID = PaperInstance.SemesterID
		group by PaperInstance.PaperID,Paper.PaperName,Semester.SemesterID,Semester.StartDate,Semester.EndDate
		order by count(Enrolment.PaperID) DESC

		select * from BigPaperInstance
		
		drop view BigPaperInstance
		select * from paperinstance
		select * from Enrolment
		select * from Person
		insert into Enrolment(PaperID,SemesterID,PersonID)
		values ('IN238', '2017S1', '101')

15.2    Develop a view [SmallPaper] that finds the 10 paper instances
		with the least (lowest number of) enrolments. Show the paperID, paper name,
		semesterID, start date and end date of the paper instance.


		create view SmallPaper
		as
		select top 10 count(Enrolment.PaperID) as Count,PaperInstance.PaperID,Paper.PaperName,Semester.SemesterID,Semester.StartDate, Semester.EndDate from PaperInstance
		join Paper on Paper.PaperID = PaperInstance.PaperID
		join Enrolment on Enrolment.PaperID = PaperInstance.PaperID
		join Semester on Semester.SemesterID = PaperInstance.SemesterID
		group by PaperInstance.PaperID,Paper.PaperName,Semester.SemesterID,Semester.StartDate,Semester.EndDate
		order by count(Enrolment.PaperID) ASC

		drop view SmallPaper
		select * from SmallPaper
		select * from Paper

15.3	Write a view that lists all the current first year students
	create view FirstYear
	as
	select distinct Person.FullName from Person join Enrolment on Person.PersonID = Enrolment.PersonID
	 where PaperID='IN510' or PaperID='IN512'

	 select * from FirstYear
	select * from Enrolment


***************************************************************************************

		You can reference a Database table even if you are not 
		currently connected to it as long as you use its fully qualified domain name.
		The following two questions are using the countries table in the World Database.
		You can use this to find the FQDN for World using a new query pointed at that Database:

			

				 @@SERVERNAME [server name],
				 DB_NAME() [database name],
				 SCHEMA_NAME(schema_id) [schema name], 
				 name [table name],
				 object_id,
				 "fully qualified name (FQN)" =
				 concat(QUOTENAME(DB_NAME()), '.', QUOTENAME(SCHEMA_NAME(schema_id)),'.', QUOTENAME(name))
			from sys.tables
			where type = 'U' -- USER_TABLE


15.4    Develop a view [ConsonantCountry] that lists the countries that have a name
		starting with a consonant (b c d f g h j k l m n p q r s t v w x y z).
		Show the code and name of each country.

		select * from [World].[dbo].[country]

		create view Country
		select Name, Code from [World].[dbo].[country] where Name NOT LIKE 'a%' AND Name NOT LIKE '%e%' AND Name NOT LIKE '%i%' AND Name NOT LIKE '%o%' AND Name NOT LIKE '%u%'



15.5   Develop a view [RecentlyIndependentCountry] that lists countries that 
		gained their independence within the last 100 years. 
		Make sure the view adjusts the resultset to take account of the date when it is run.

		create view RecentlyIndependentCountry
		as
		select Name from [World].[dbo].[country] where IndepYear > (select year(getDate()))-100

*/

/*