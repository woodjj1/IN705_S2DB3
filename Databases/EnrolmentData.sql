insert into Paper values ('IN510', 'Programming1'), ('IN512', 'Web1'), ('IN511', 'Programming2'), ('IN610', 'Programming3'), ('IN605', 'DB2'), ('IN628', 'Programming4'), ('IN705', 'DB3'), ('IN612', 'Web2');
insert into Semester values ('2019S1', '02-feb-2019', '06-june-2019' ), ('2018S2', '04-july-2018', '20-nov-2018'), ('2019S2', '06-june-2019', '20-nov-2019'), ('2017S1', '02-feb-2017', '06-june-2017'), ('2017S2', '14-july-2017', '20-nov-2017');
insert into PaperInstance select PaperID, SemesterID from Paper cross join Semester;
insert into Person values (101, 'Grayson', 'Orr', 'Grayson Orr' ), (102, 'Clair', 'Bradley', 'Clair Bradley' ), (103, 'Sharon', 'Green', 'Sharon Green'), (104, 'Cameron', 'White', 'Cameron White'), (105, 'Brendon' , 'Brown', 'Brendon Brown'), (106, 'Joe', 'Jones', 'Joe Jones'),(107, 'Dave', 'Copperfield', 'Dave Copperfield')
insert into Person values (110, 'Gray', 'Smith', 'Gray Smith' ),(111, 'Green', 'Anderson', 'Green Anderson');
insert into Enrolment values ('IN510', '2019S1', 110 ), ('IN510', '2019S2', 103), ('IN510', '2019S1', 104), ('IN605','2019S2', 101), ('IN605', '2019S2', 104), ('IN512', '2019S2', 102)