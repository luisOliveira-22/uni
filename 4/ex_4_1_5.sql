CREATE SCHEMA ConfManagement;

GO 

CREATE TABLE ConfManagement.Institution (
	Inst_Id INT PRIMARY KEY,
	Inst_Name VARCHAR(100) NOT NULL,
	Inst_Address VARCHAR(100) NOT NULL,
);

CREATE TABLE ConfManagement.Author(
	_Name VARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Insitution INT NOT NULL,
	FOREIGN KEY (Insitution) REFERENCES ConfManagement.Institution(Inst_Id),
);

CREATE TABLE ConfManagement.Article(
	Reg_Number INT PRIMARY KEY,
	Author INT NOT NULL,
	Title VARCHAR(100) NOT NULL,
	FOREIGN KEY (Author) REFERENCES 
);
CREATE TABLE ConfManagement.Conference(
	Id NOT NULL PRIMARY KEY,
	Article INT NOT NULL,
	FOREIGN KEY (Article) REFERENCES ConfManagement.Article(Reg_Number),
);

CREATE TABLE ConfManagement.Participant (
	Id INT PRIMARY KEY,
	P_Name VARCHAR(100) NOT NULL,
	P_Address VARCHAR(100) NOT NULL,
	Email_Addr VARCHAR UNIQUE NOT NULL,
	Insc_date DATE NOT NULL,
	Institution INT NOT NULL,
	Participant_Type ENUM('Student', 'NonStudent') NOT NULL,  -- Disjoint Indicator
	FOREIGN KEY Institution REFERENCES ConfManagement.Institution(Inst_Id),
);

CREATE TABLE ConfManagement.Student (
    Id INT PRIMARY KEY,
	Receipt INT UNIQUE NOT NULL,
    FOREIGN KEY (Id) REFERENCES ConfManagement.Participant(Id) ON DELETE CASCADE
);

CREATE TABLE ConfManagement.NonStudent (
    Id INT PRIMARY KEY,
    Bank_Ref INT UNIQUE NOT NULL,
    FOREIGN KEY (Id) REFERENCES ConfManagement.Participant(Id) ON DELETE CASCADE
);

CREATE TABLE ConfManagement.Receipt(
	Id INT PRIMARY KEY,
	Tracker GEOGRAPHY NOT NULL,
	Issuer INT NOT NULL,
	FOREIGN KEY (Issuer) REFERENCES ConfManagement.Institution(Inst_Id)

