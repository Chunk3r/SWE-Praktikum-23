PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Mitarbeiter;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Dienstbefreiung_Mitarbeiter;
DROP TABLE IF EXISTS Kunde;
DROP TABLE IF EXISTS Krankschreibung_Kunde;
DROP TABLE IF EXISTS Besuche;


CREATE TABLE Adresse (
	Adresse_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Strasse TEXT,
	Hausnummer TEXT,
	PLZ INTEGER,
	Ort TEXT,
	Wohnraum INTEGER
);

CREATE TABLE Mitarbeiter (
  	MB_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  	Vorname TEXT NOT NULL,
  	Nachname TEXT NOT NULL,
  	Adresse INTEGER,
  	Rolle TEXT NOT NULL,
  	FOREIGN KEY(Adresse) REFERENCES Adresse(Adresse_ID)
);


CREATE TABLE Dienstbefreiung_Mitarbeiter (
        DBMA_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Mitarbeiter_ID INTEGER,
        Start_Datum TEXT NOT NULL,
        ENDE_Datum TEXT NOT NULL,
        FOREIGN KEY(Mitarbeiter_ID) REFERENCES Mitarbeiter(MB_ID)
);

CREATE TABLE Kunde (
        Kunden_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Vorname TEXT NOT NULL,
        Nachname TEXT NOT NULL,
        TelefonNummer TEXT NOT NULL,
        Adresse INTEGER,
        Rolle TEXT NOT NULL,
        Besuche_Pro_Tag INTEGER NOT NULL,
	FOREIGN KEY(Adresse) REFERENCES Adresse(Adresse_ID)
);

CREATE TABLE Krankschreibung_Kunde (
        KK_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Kunden_ID INTEGER,
        Start_Datum TEXT NOT NULL,
        ENDE_Datum TEXT NOT NULL,
        FOREIGN KEY(Kunden_ID) REFERENCES Kunde(Kunden_ID)
);


CREATE TABLE Besuche (
	Besuche_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Kunden_ID Integer,
	Mitarbeiter_ID Integer,
	Datum TEXT NOT NULL,
	Uhrzeit TEXT NOT NULL,
	FOREIGN KEY(Kunden_ID) REFERENCES Kunde(Kunden_ID),
	FOREIGN KEY(Mitarbeiter_ID) REFERENCES Mitarbeiter(MB_ID)
);

-- Dummy data for Adresse table
INSERT INTO Adresse (Strasse, Hausnummer, PLZ, Ort, Wohnraum) VALUES
('Example Street', '123', 12345, 'Example City', 2),
('Test Road', '456', 54321, 'Testville', 1),
('Sample Avenue', '789', 98765, 'Sampletown', 3),
('Demo Lane', '321', 54321, 'Demoville', 2),
('Trial Boulevard', '654', 12345, 'Trial City', 1),
('Another Street', '456', 23456, 'Another City', 2),
('Random Road', '789', 65432, 'Randomville', 1),
('New Avenue', '321', 98765, 'Newtown', 3),
('Test Lane', '654', 23456, 'Test City', 2),
('Example Boulevard', '987', 54321, 'Exampleville', 1),
('Dummy Street', '123', 87654, 'Dummy City', 2),
('Test Road', '456', 34567, 'Testville', 1),
('Sample Avenue', '789', 65432, 'Sampletown', 3),
('Demo Lane', '321', 87654, 'Demoville', 2),
('Trial Boulevard', '654', 34567, 'Trial City', 1),
('Another Street', '456', 23456, 'Another City', 2),
('Random Road', '789', 65432, 'Randomville', 1),
('New Avenue', '321', 98765, 'Newtown', 3),
('Test Lane', '654', 23456, 'Test City', 2),
('Example Boulevard', '987', 54321, 'Exampleville', 1),
('Dummy Street', '123', 87654, 'Dummy City', 2),
('Test Road', '456', 34567, 'Testville', 1),
('Sample Avenue', '789', 65432, 'Sampletown', 3),
('Demo Lane', '321', 87654, 'Demoville', 2),
('Trial Boulevard', '654', 34567, 'Trial City', 1),
('Another Street', '456', 23456, 'Another City', 2),
('Random Road', '789', 65432, 'Randomville', 1),
('New Avenue', '321', 98765, 'Newtown', 3),
('Test Lane', '654', 23456, 'Test City', 2),
('Example Boulevard', '987', 54321, 'Exampleville', 1),
('Dummy Street', '123', 87654, 'Dummy City', 2),
('Test Road', '456', 34567, 'Testville', 1),
('Sample Avenue', '789', 65432, 'Sampletown', 3),
('Demo Lane', '321', 87654, 'Demoville', 2),
('Trial Boulevard', '654', 34567, 'Trial City', 1),
('Another Street', '456', 23456, 'Another City', 2),
('Random Road', '789', 65432, 'Randomville', 1),
('New Avenue', '321', 98765, 'Newtown', 3),
('Test Lane', '654', 23456, 'Test City', 2),
('Example Boulevard', '987', 54321, 'Exampleville', 1),
('Dummy Street', '123', 87654, 'Dummy City', 2),
('Test Road', '456', 34567, 'Testville', 1),
('Sample Avenue', '789', 65432, 'Sampletown', 3),
('Demo Lane', '321', 87654, 'Demoville', 2),
('Trial Boulevard', '654', 34567, 'Trial City', 1),
('Dummy Street', '123', 87654, 'Dummy City', 2),
('Test Road', '456', 34567, 'Testville', 1),
('Sample Avenue', '789', 65432, 'Sampletown', 3),
('Demo Lane', '321', 87654, 'Demoville', 2),
('Trial Boulevard', '654', 34567, 'Trial City', 1);

-- Dummy data for Mitarbeiter table
INSERT INTO Mitarbeiter (Vorname, Nachname, Adresse, Rolle) VALUES
('John', 'Doe', 1, 'Manager'),
('Jane', 'Smith', 2, 'Employee'),
('Michael', 'Johnson', 3, 'Employee'),
('Emily', 'Williams', 4, 'Employee'),
('David', 'Brown', 5, 'Employee');

-- Dummy data for Dienstbefreiung_Mitarbeiter table
INSERT INTO Dienstbefreiung_Mitarbeiter (Mitarbeiter_ID, Start_Datum, ENDE_Datum) VALUES
(1, '2023-05-01', '2023-05-05'),
(3, '2023-05-10', '2023-05-12'),
(4, '2023-05-15', '2023-05-16'),
(2, '2023-05-20', '2023-05-22'),
(5, '2023-05-25', '2023-05-26');

-- Dummy data for Kunde table
INSERT INTO Kunde (Vorname, Nachname, TelefonNummer, Adresse, Rolle, Besuche_Pro_Tag) VALUES
('Alice', 'Johnson', '555-1234', 1, 'Ambulant', 2),
('Bob', 'Smith', '555-5678', 2, 'Stationaer', 3),
('Eve', 'Davis', '555-9012', 3, 'Ambulant', 1),
('Charlie', 'Brown', '555-3456', 4, 'Ambulant', 2),
('Olivia', 'Wilson', '555-7890', 5, 'Ambulant', 1),
('John', 'Doe', '555-1111', 6, 'Ambulant', 2),
('Jane', 'Smith', '555-2222', 7, 'Stationaer', 3),
('Michael', 'Johnson', '555-3333', 8, 'Ambulant', 1),
('Emily', 'Davis', '555-4444', 9, 'Ambulant', 2),
('David', 'Wilson', '555-5555', 10, 'Ambulant', 1),
('Sarah', 'Brown', '555-6666', 11, 'Ambulant', 2),
('Matthew', 'Lee', '555-7777', 12, 'Stationaer', 3),
('Oliver', 'Anderson', '555-8888', 13, 'Ambulant', 1),
('Sophia', 'Taylor', '555-9999', 14, 'Ambulant', 2),
('James', 'Clark', '555-0000', 15, 'Ambulant', 1),
('Emma', 'Harris', '555-1234', 16, 'Ambulant', 2),
('Noah', 'Jackson', '555-5678', 17, 'Stationaer', 3),
('Isabella', 'White', '555-9012', 18, 'Ambulant', 1),
('William', 'Martin', '555-3456', 19, 'Ambulant', 2),
('Ava', 'Thompson', '555-7890', 20, 'Ambulant', 1),
('Sophia', 'Smith', '555-1111', 21, 'Ambulant', 2),
('Jackson', 'Johnson', '555-2222', 22, 'Stationaer', 3),
('Oliver', 'Davis', '555-3333', 23, 'Ambulant', 1),
('Emma', 'Brown', '555-4444', 24, 'Ambulant', 2),
('Aiden', 'Wilson', '555-5555', 25, 'Ambulant', 1),
('Mia', 'Lee', '555-6666', 26, 'Ambulant', 2),
('Liam', 'Anderson', '555-7777', 27, 'Stationaer', 3),
('Charlotte', 'Taylor', '555-8888', 28, 'Ambulant', 1),
('Lucas', 'Clark', '555-9999', 29, 'Ambulant', 2),
('Harper', 'Harris', '555-0000', 30, 'Ambulant', 1),
('Mia', 'Jackson', '555-1234', 31, 'Ambulant', 2),
('Liam', 'White', '555-5678', 32, 'Stationaer', 3),
('Amelia', 'Martin', '555-9012', 33, 'Ambulant', 1),
('Benjamin', 'Thompson', '555-3456', 34, 'Ambulant', 2),
('Ella', 'Smith', '555-7890', 35, 'Ambulant', 1),
('Elizabeth', 'Johnson', '555-1111', 36, 'Ambulant', 2),
('Henry', 'Davis', '555-2222', 37, 'Stationaer', 3),
('Sebastian', 'Brown', '555-3333', 38, 'Ambulant', 1),
('Victoria', 'Wilson', '555-4444', 39, 'Ambulant', 2),
('Joseph', 'Lee', '555-5555', 40, 'Ambulant', 1),
('Scarlett', 'Anderson', '555-6666', 41, 'Ambulant', 2),
('Christopher', 'Taylor', '555-7777', 42, 'Stationaer', 3),
('Evelyn', 'Clark', '555-8888', 43, 'Ambulant', 1),
('Samuel', 'Harris', '555-9999', 44, 'Ambulant', 2),
('Grace', 'Jackson', '555-0000', 45, 'Ambulant', 1),
('Zoe', 'White', '555-1234', 46, 'Ambulant', 2),
('Andrew', 'Martin', '555-5678', 47, 'Stationaer', 3),
('David', 'Thompson', '555-9012', 48, 'Ambulant', 1),
('Abigail', 'Smith', '555-3456', 49, 'Ambulant', 2),
('Daniel', 'Johnson', '555-7890', 50, 'Ambulant', 1);

-- Dummy data for Krankschreibung_Kunde table
INSERT INTO Krankschreibung_Kunde (Kunden_ID, Start_Datum, ENDE_Datum) VALUES
(1, '2023-05-02', '2023-05-03'),
(3, '2023-05-11', '2023-05-11'),
(2, '2023-05-20', '2023-05-21'),
(4, '2023-05-25', '2023-05-25'),
(5, '2023-05-28', '2023-05-29');