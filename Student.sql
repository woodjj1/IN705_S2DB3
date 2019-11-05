Drop table [Student]
CREATE TABLE [Student]
	(
		[StudentID] int PRIMARY KEY,
		[LastName] nvarchar(100) NOT NULL,
		[FirstName] nvarchar(100) NOT NULL,
		[UserName] nvarchar(100) NOT NULL,
		[Password] nvarchar(20) NOT NULL
	)


	SELECT * FROM Student