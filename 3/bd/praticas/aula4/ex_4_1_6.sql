CREATE SCHEMA ATL;

GO 

CREATE TABLE ATL.Class(
	Id INT PRIMARY KEY,
	NMAx_Students INT NOT NULL,
	Degree INT NOT NULL CHECK (degree IN(0,1,2,3,4)) DEFAULT 0,
	Teacher_Number INT NOT NULL,
	Designation VARCHAR(100) NOT NULL,
	FOREIGN KEY (Teacher_Number) REFERENCES ATL.Teachers(WorkedNumbers) ON DELETE CASCADE,
);

CREATE TABLE ATL.Activity(
	Id INT PRIMARY KEY,
	Designation VARCHAR(100) NOT NULL,
	Cost INT NOT NULL,
);

-- Class for the join of the class and the Activity 
CREATE TABLE ATL.ClassActvity(
	ClassId INT NOT NULL,
	ActivityId INT NOT NULL,
	PRIMARY KEY (ClassId, ActivityId),
	FOREIGN KEY (ClassId) REFERENCES ATL.Class(Id) ON DELETE CASCADE,
	FOREIGN KEY (ActivityId) REFERENCES ATL.Activity(Id) ON DELETE CASCADE,
);	

CREATE TABLE ATL.People(
	Num_CC INT PRIMARY KEY,
	Contact VARCHAR(13) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Morada VARCHAR(100) NOT NULL,
	Data_Nascimento VARCHAR(10) NOT NULL,
	Email VARCHAR(100) NOT NULL,
);

CREATE TABLE ATL.Teachers(
	WorkerNumber INT PRIMARY KEY,
	Num_CC INT NOT NULL,
	FOREIGN KEY (Num_CC) REFERENCES ATL.People(Num_CC) ON DELETE CASCADE,
);

CREATE TABLE ATL.Autorized_People (
	Id INT PRIMARY KEY,
	Num_CC INT NOT NULL,
	Relation VARCHAR(100),
	FOREIGN KEY (Num_CC) REFERENCES ATL.People(Num_CC),
);


