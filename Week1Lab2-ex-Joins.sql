/*
Exercises for section 4

delete from PaperInstance where PaperID = 'IN610' -- I populated this table using a cross join so all of the data will match otherwise.
insert into Enrolment values ('IN511', '2019S2', 102);



4.1	List the starting date and ending date of each occasion 
	IN511 Programming 2 has run.
	
	delete from PaperInstance where PaperID = 'IN610' -- I populated this table using a cross join so all of the data will match otherwise.
	select Paper.*, PaperInstance.*, Semester.* from Paper
	join paperInstance on Paper.PaperID = PaperInstance.PaperId
	join Semester on paperInstance.SemesterId = Semester.SemesterID
	where Paper.PaperName like '%Programming2%'
	

	

4.2	List all the full names of the people who have ever enrolled in
	IN511 Programming 2 .
	If a person has enrolled more than once, do not repeat their name.

	delete from PaperInstance where PaperID = 'IN610'

	select distinct Person.personId, FullName from Person
	join Enrolment on Enrolment.PersonId = Person.PersonId
	where Enrolment.paperId = 'IN511'



4.3	List all the full names of all the people who have never enrolled in a paper
	(according to the data on the database).

	Select distinct Fullname from Person 
	left outer join Enrolment on Enrolment.PersonId = Person.PersonId
	

4.4	List all the papers that have never been run (according to the data).There are currently none so insert one in order to test the query.
Insert into Paper values ('IN728', 'Programming5') 

	select PaperID, PaperName from Paper
	where PaperID not in (select PaperID from PaperInstance)


4.5	List all the semesters, showing semester start date and length in days, in which IN511 has run.

	Select StartDate, datediff(day,Startdate,EndDate) as [Number of Days] from Semester
	join PaperInstance  on PaperInstance.SemesterID = Semester.SemesterID
	where PaperInstance.PaperID = 'IN511'


4.6	Develop a statement that returns all people that enrolled in IN511 
	in a semester that started on or between 12-Apr-2018 and 13-Aug-2019.
	Display the full name of each person and the year in which they enrolled. 
	Ensure the people are listed alphabetically according to their family name then given name.

	Select FullName, datepart(year,Semester.StartDate) as [Enrolment Year] from Person
	Join Enrolment on Enrolment.PersonID = Person.PersonID
	join Semester on Semester.SemesterID = Enrolment.SemesterID
	where Enrolment.PaperID = 'IN511'
	and StartDate between '12-Apr-2018' and '13-Aug-2019'
	order by FamilyName, GivenName

*/
/*
Exercises for section 5

5.1	List all the papers that have a paper instance. 
	Display the PaperID and number of instances of the paper.
	
	select PaperID, count (*)InstanceCount from PaperInstance 
	group by PaperId


5.2	How many people, in total over all semesters, have enrolled in each of the papers
	that have been delivered? Display the paper ID, paper name and enrolment count.

	Select Paper.PaperID, Paper.Papername, count (*) as [Total Enrolments] from Enrolment
	join PaperInstance on PaperInstance.PaperID = Enrolment.PaperID and PaperInstance.SemesterID = Enrolment.SemesterID
	join Paper on Paper.PaperID = PaperInstance.PaperID
	group by Paper.PaperID, PaperName


5.3	How many people, in total over all semesters, have enrolled in each of the papers
	listed on the Paper table? Display the paper ID, paper name and enrolment count.

	Select Paper.PaperID, Paper.PaperName, count(Enrolment.PaperID) as [Total Enrolments] from Enrolment
	right join PaperInstance on PaperInstance.PaperID = Enrolment.PaperID and PaperInstance.SemesterID = Enrolment.SemesterID
	right join Paper on Paper.PaperID = PaperInstance.PaperID
	group by Paper.PaperID, Paper.PaperName

5.4	List the paper instance with the highest enrolment. 
	Display the paper instance's start date, end date, paper name and enrolment count.

	Got big help on this excercise

	Select top 1 p.PaperName, s.StartDate, s.EndDate, count (*) as [Enrolment Count] from Enrolment e             
	join PaperInstance i on i.PaperID = e.PaperID and i.SemesterID = e.SemesterID
	join Paper p on p.PaperID  = i.PaperID
	join Semester s on s.SemesterID = i.SemesterID
	group by p.PaperName, s.StartDate,s.EndDate
	order by count (*) desc

5.5	List all the people who have 3, 4 or 5 enrolments.

	Select Person.PersonID, FullName, count(*) as [Enrolment Count] from person
	join Enrolment on Enrolment.PersonID = Person.personID
	group by Person.PersonID, FullName having count(*) between 3 and 5
*/