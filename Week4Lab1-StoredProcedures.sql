/*
Using Transact-SQL : Exercises
------------------------------------------------------------

Exercises for section 12 : STORED PROCEDURE

*In all exercises, write the answer statement and then execute it.



e12.1		Create a SP that returns the people with a family name that 
			starts with a vowel [A,E,I,O,U]. List the PersonID and the FullName.

			create procedure FamilyNameVowel
			as
			select FamilyName from Person as p
			where FamilyName LIKE 'A%'
			or FamilyName LIKE 'E%'
			or FamilyName LIKE 'I%'
			or FamilyName LIKE 'O%'
			or FamilyName LIKE 'U%'

			exec FamilyNameVowel


e12.2		Create a SP that accepts a semesterID parameter and returns the papers that
			have enrolments in that semester. List the PaperID and PaperName.

			create procedure Enrolments(@semesterID nvarchar(10))
			as
			select Paper.PaperID, Paper.PaperName from Paper
			join PaperInstance on PaperInstance.PaperID = Paper.PaperID
			where semesterID = @semesterID

			exec Enrolments '2017S1'

			select * from PaperInstance

e12.3		Create a SP that creates a new semester record. the user must supply all
			appropriate input parameters.

			create procedure NewSemester(@semesterID nvarchar(10), @startdate nvarchar(20), @enddate nvarchar(20))
			as 
			insert Semester (SemesterID, StartDate, EndDate) values (@semesterID, @startdate, @enddate)

			exec NewSemester '2020S1', '2020-02-02', '2020-06-06'

			select * from semester