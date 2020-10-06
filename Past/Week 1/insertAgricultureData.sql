INSERT INTO Technician VALUES('Winograd')
INSERT INTO Technician VALUES('Turing')
INSERT INTO Technician VALUES('Savitch')
INSERT INTO Technician VALUES('Wright')

SELECT * FROM Technician

--------------------------------------------------------------

INSERT INTO Location VALUES ('East', 0.28, 0.80)
INSERT INTO Location VALUES ('North',	0.17, 0.84)
INSERT INTO Location VALUES ('West',	0.38, 0.48)
INSERT INTO Location VALUES ('South',	0.45, 0.66)

SELECT * FROM Location

--------------------------------------------------------------

INSERT INTO Crop VALUES ('Carrot',	0.26, 0.82, .08)
INSERT INTO Crop VALUES ('Beet',	0.44, 0.80, .04)
INSERT INTO Crop VALUES ('Corn',	0.44, 0.76, .26)
INSERT INTO Crop VALUES ('Tomato',	0.42, 0.80, .16)
INSERT INTO Crop VALUES ('Radish',	0.28, 0.84, .02)

SELECT * FROM Crop

---------------------------------------------------------------------------------
	
INSERT INTO Sowing VALUES (0,0,0,'20050418',28)
INSERT INTO Sowing VALUES (0,1,1,'20050414',14)
INSERT INTO Sowing VALUES (1,0,2,'20050418',36)
INSERT INTO Sowing VALUES (2,1,3,'20050414',20)
INSERT INTO Sowing VALUES (2,2,2,'20050419',12)
INSERT INTO Sowing VALUES (3,3,3,'20050425',38)
INSERT INTO Sowing VALUES (4,2,0,'20050430',30)

SELECT * FROM Sowing

----------------------------------------------------------------------------------------

INSERT INTO Harvest VALUES(0,2,0,'20050818',28,2.32)
INSERT INTO Harvest VALUES(0,3,1,'20050816',12,1.02)
INSERT INTO Harvest VALUES(2,1,3,'20050822',52,12.96)
INSERT INTO Harvest VALUES(2,2,2,'20050828',18,4.58)
INSERT INTO Harvest VALUES(3,3,3,'20050822',15,3.84)
INSERT INTO Harvest VALUES(4,2,0,'20050716',23,0.52)

SELECT * FROM Harvest
