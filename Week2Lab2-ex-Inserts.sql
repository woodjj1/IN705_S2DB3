/*
Using Transact-SQL : Exercises
------------------------------------------------------------

/*
Exercises for section 8 : INSERT

*In all exercises, write the answer statement and then execute it.


e8.1	Write a statement to create 2 new papers: IN338 and IN238 Extraspecial Topic 

		insert into Paper (PaperID, PaperName)
		values ('IN338', 'ExtraSpecial1')

		insert into Paper (PaperID, PaperName)
		values ('IN238', 'ExtraSpecial2')


e8.2	Create a new user (yourself)
		Write statements that will add three enrolments for you
		in papers you have completed (Add extra papers if required).

		insert into Person (PersonID, GivenName, FamilyName, FullName)
		values ('112', 'Stefan', 'Zetko', 'Stefan Zetko')

		insert into Enrolment (PaperID, SemesterID, PersonID)
		values ('IN510', '2017S1', '112')

		insert into Enrolment (PaperID, SemesterID, PersonID)
		values ('IN511', '2017S2', '112')

		insert into Enrolment (PaperID, SemesterID, PersonID)
		values ('IN605', '2018S2', '112')


e8.3	Imagine that every paper on the database will run in 2021.
		Write the statements that will create all the necessary paper instances. You will need to add the Semester
		This can be done using a subselect or a left outer join.

		insert into Semester(SemesterID, StartDate, EndDate)
		values ('2021S1', '2021-02-02', '2021-06-06')

		insert into Semester(SemesterID, StartDate, EndDate)
		values ('2021S2', '2021-07-14', '2021-11-20')

		insert PaperInstance(PaperID, SemesterID)
		select Paper.PaperID,Semester.SemesterID from Paper
		left join
		Semester on Semester.SemesterID = '2021S1'

		insert PaperInstance(PaperID, SemesterID)
		select PaperID, '2021S1' as SemesterID from Paper

		
e8.4	Imagine a strange path-of-study requirement: in semester 2020S1
		Find all people who are currently enrolled in IN605 and not enrolled in IN612 and enrol them in IN238.
		Write a statement to create the correct paper instance for IN238.
		Write a statement that will find all people enrolled in IN605 (semester 2019S2)
		but	not enrolled in IN612 (semester 2019S2) and 
		will create IN238 (semester 2020S1) enrolments for them. Build it up one step at a time.
		
		1. create paper, semester and paper instance data
		2. Find IN605/2019S2 enrolments that are not in IN612
		3. insert new enrolments


		Insert Enrolment(PaperID, SemesterID, PersonID)
		select 'IN238', '2020S1', PersonID from Enrolment 
		where PaperID = 'IN605' AND PaperID != 'IN612'


		insert PaperInstance(PaperID, SemesterID)
		Select PaperID, '2020S1' from Paper
		where PaperID = 'IN238'

		Insert Enrolment(PaperID, SemesterID,PersonID)
		select 'IN238', '2020S1', PersonID from Enrolment
		where PaperID = 'IN605' AND SemesterID = '2019S2' AND PersonID IN
		(select PersonID from Enrolment
		where PaperID != 'IN612' AND SemesterID != '2019S2')