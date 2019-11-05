/*
Using Transact-SQL : Exercises
------------------------------------------------------------
Exercises for section 6 Subqueries

e6.1	List the paper with the lowest average enrolment per instance. Ignore all papers with no enrolments.
	Display the paper ID, paper name and average enrolment count.


	select Top 1 p.PaperID, PaperName, Avg(EnrolmentCount) from ( select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as EnrolmentCount
	From enrolment e
	group by PaperID, SemesterID ) ec
	
	join Paper p
	on ec.PaperID = p.PaperID
	group by PaperName, p.PaperID order by Avg(EnrolmentCount) asc


/*
e6.2	List the paper with the highest average enrolment per instance. 
	Display the paper ID, paper name and average enrolment count.
*/
	select Top 1 p.PaperID, PaperName, Avg(EnrolmentCount)  from ( select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as EnrolmentCount
	From enrolment e
	group by PaperID, SemesterID ) ec
	
	join Paper p
	on ec.PaperID = p.PaperID
	group by PaperName, p.PaperID order by Avg(EnrolmentCount) desc
/*
e6.3	For each paper that has a paper instance: list the paper ID, paper name, 
	starting date of the earliest instance, starting date of the most recent instance, 
	the minimum number of enrolments in the instances,
	maximum number of enrolments in the instances and 
	average number of enrolments across all	the instances.

	select Paper.PaperID, Paper.PaperName, 
	Min(Semester.StartDate) as [Earliest Instance],
	Max(Semester.EndDate) as [Recent Instance],
	Min(EnrolmentCount.EnrolmentCount) as Minimum, Max(EnrolmentCount.EnrolmentCount) as Maximum, Avg(EnrolmentCount.EnrolmentCount) as Average
	from Paper join PaperInstance on Paper.PaperID = PaperInstance.PaperID
	join Semester on Semester.SemesterID = PaperInstance.SemesterID
	left join
	(
	select PaperID, SemesterID, cast(count(*) as decimal(9,4)) as [EnrolmentCount]
	from Enrolment
	group by PaperID, SemesterID
	)
	EnrolmentCount on PaperInstance.PaperID = EnrolmentCount.PaperID
	group by Paper.PaperID, Paper.PaperName
*/
	

/*
e6.4	Which paper attracts people with long names? Find the background statistics 
	to support a hypothesis test: for each paper with enrolments calculate the mean full name length, 
	sample standard deviation full name length & sample size (that is: number of enrolments).
*/
	select Enrolment.PaperID, AVG(cast(NameLength as decimal (9,4))) as [Avg Name Length], STDEV(NameLength) as [Standard Deviation], count(Enrolment.PersonID) as [Enrolments] from Enrolment  join 
	(

		select PersonID, len(FullName) as NameLength from Person

	) NameLength on Enrolment.PersonID = NameLength.PersonID
	group by Enrolment.PaperID
/*
e6.5	Rank the semesters from the most loaded (that is: the highest number of enrolments) to
	the least loaded. Calculate the ordinal position (1 for first, 2 for second...) of the semester
	in this ranking.

	select PaperInstance.SemesterID, count(Enrolment.PersonID) as [Total Enrolments] from PaperInstance  left join Enrolment  on PaperInstance.PaperID = Enrolment.PaperID and 
PaperInstance.SemesterID = Enrolment.SemesterID
	group by PaperInstance.SemesterID 
	order by  [Total Enrolments] DESC

Exercises for section 7

--Use UNION to solve these tasks. 
--Note that these tasks could possibly be solved by another non-UNION statement.
--Can you also write a non-UNION statement that produces the same result?   

e7.1	In one result, list all the people who enrolled in a paper delivered during 2019 and
	all the people who have enrolled in IN605. 
	The result should have three columns: PersonID, Full Name and the reason the person
	is on the list - either 'enrolled in 2019' or 'enrolled in IN605'

	Select distinct Person.PersonID, Person.FullName, 'Enrolled in 2019' as [Reason]
	from Person  join Enrolment  on Person.PersonID = Enrolment.PersonID 
	where Enrolment.SemesterID like '2019%'
	union
	Select distinct Person.PersonID, Person.FullName, 'Enrolled in IN605'
	from Person  join Enrolment  on Person.PersonID = Enrolment.PersonID 
	where Enrolment.PaperID = 'IN605'
	order by [Reason]

e7.2	Produce one resultset with two columns. List the all Paper Names and all the Person Full Names in one column.
	In the other column calculate the number of characters in the name.
	Sort the result with the longest name first.


	Select PaperName as [Name], len(PaperName) as [Number of Characters]
	from Paper
	union
	select FullName as [Name], len(FullName)  as [Number of Characters]
	from Person
	order by [Number of Characters] DESC
*/