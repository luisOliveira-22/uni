CREATE SCHEMA Medicines;

GO 

--cria tabela para as especialidades dos medicos
CREATE TABLE Medicines.Specialty(
	Id_Specialty INT PRIMARY KEY,       --Id da especialidade usada para criar uma relacao com o medico
	Espec_Name VARCHAR(150) NOT NULL UNIQUE,  --nome de cada especialidade
);


--cria a table para os medicos
CREATE TABLE Medicines.Doctors(
	IdSns INT PRIMARY KEY,  -- o id unico de cada medico
	doc_name VARCHAR(100) NOT NULL,  --nome do medico
	Id_specialty INT NOT NULL, --chave estrangeira para cada medico assume-se que cada medico tenha uma especialidade
	FOREIGN KEY (Id_specialty) REFERENCES Medicines.Specialty(Id_Specialty) ON DELETE CASCADE,
);

-- tabela de pacientes
CREATE TABLE Medicines.Pacient(
	Utent_Number INT PRIMARY KEY,
	Pacient_Name VARCHAR (100) NOT NULL,
	Pacient_Address VARCHAR(100) NOT NULL,
	Birth_Date DATE NOT NULL,
);

--tabela de farmaceuticas
CREATE TABLE Medicines.Pharmaceutical(
	Ph_NRN INT PRIMARY KEY,
	Ph_Name VARCHAR(100) UNIQUE NOT NULL,
	Ph_Address VARCHAR(100) UNIQUE NOT NULL,
	Ph_Phone VARCHAR(13) UNIQUE NOT NULL,            --assume that each number must be like +351 ... leading to 13 char's
);

--tabela dos farmacos desenvolvidos pelas farmaceuticas
CREATE TABLE Medicines.Pharmaco(
	Id INT PRIMARY KEY,
	Register_Name VARCHAR(100) UNIQUE,                --Pode ser nulo mas nunca duplicado 
	Comercial_Name VARCHAR(100) NOT NULL,  --posso ter o varios bruffen na farmacia mas so um e original
	Formula VARCHAR(100) NOT NULL,
	Developer INT NOT NULL,
	FOREIGN KEY (Developer) REFERENCES Medicines.Pharmaceutical(Ph_NRN) ON DELETE CASCADE,
);

--tabela de prescricao passadas pelos medicos
CREATE TABLE Medicines.Prescription(
	Id INT PRIMARY KEY,              --Id unico de cada prescricao
	Validity DATE NOT NULL,           --Validade para uma se usar a prescricao
	Doc_Id INT NOT NULL,               --Id do medico que passou a receita
	Utent_Number INT NOT NULL,
	Farmaco INT NOT NULL,
	FOREIGN KEY (Doc_Id) REFERENCES  Medicines.Doctors(IdSns) ON DELETE CASCADE,
	FOREIGN KEY (Utent_Number) REFERENCES  Medicines.Pacient(Utent_Number) ON DELETE CASCADE,
	FOREIGN KEY (Farmaco) REFERENCES   Medicines.Pharmaco(Id) ON DELETE CASCADE,
);

--tabela de farmacias
CREATE TABLE Medicines.DrugStore(
	NIF INT PRIMARY KEY,
	DS_Name VARCHAR(100) UNIQUE NOT NULL,
	DS_Address VARCHAR(100) UNIQUE NOT NULL,
	DS_Phone VARCHAR(13) UNIQUE NOT NULL,
	Processed_Prescription INT UNIQUE,
	FOREIGN KEY (Processed_Prescription) REFERENCES Medicines.Prescription(Id) ON DELETE CASCADE,
);