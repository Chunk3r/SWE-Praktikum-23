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
('John', 'Doe', 1, 'Verwaltung'),
('Jane', 'Smith', 2, 'Stationaer'),
('Michael', 'Johnson', 3, 'Mobil'),
('Emily', 'Williams', 4, 'Mobil'),
('David', 'Brown', 5, 'Mobil'),
('Jennifer', 'Miller', 6, 'Mobil'),
('Christopher', 'Anderson', 7, 'Mobil'),
('Jessica', 'Taylor', 8, 'Mobil'),
('Daniel', 'Thomas', 9, 'Mobil'),
('Sarah', 'Jackson', 10, 'Mobil'),
('Matthew', 'White', 11, 'Mobil'),
('Elizabeth', 'Harris', 12, 'Stationaer'),
('Andrew', 'Martin', 13, 'Mobil'),
('Nicole', 'Thompson', 14, 'Mobil'),
('Jason', 'Garcia', 15, 'Mobil'),
('Melissa', 'Martinez', 16, 'Stationaer'),
('Kevin', 'Robinson', 17, 'Mobil'),
('Amanda', 'Clark', 18, 'Mobil'),
('Robert', 'Lee', 19, 'Mobil'),
('Michelle', 'Lewis', 20, 'Mobil'),
('Brian', 'Walker', 21, 'Mobil'),
('Ashley', 'Hall', 22, 'Mobil'),
('Joshua', 'Allen', 23, 'Mobil'),
('Stephanie', 'Young', 24, 'Mobil'),
('William', 'Wright', 25, 'Stationaer'),
('Amy', 'Lopez', 26, 'Mobil'),
('Jonathan', 'Hill', 27, 'Mobil'),
('Laura', 'Green', 28, 'Mobil'),
('Ryan', 'Adams', 29, 'Mobil'),
('Kimberly', 'Baker', 30, 'Mobil'),
('Gary', 'Gonzalez', 31, 'Mobil'),
('Christina', 'Nelson', 32, 'Mobil'),
('Eric', 'Carter', 33, 'Mobil'),
('Lisa', 'Mitchell', 34, 'Mobil'),
('Steven', 'Perez', 35, 'Mobil'),
('Samantha', 'Cooper', 36, 'Stationaer'),
('Joseph', 'Kelly', 37, 'Mobil'),
('Karen', 'Sanchez', 38, 'Mobil'),
('Brandon', 'Bennett', 39, 'Mobil'),
('Rachel', 'Rivera', 40, 'Mobil'),
('Jeffrey', 'Coleman', 41, 'Mobil'),
('Megan', 'Ward', 42, 'Mobil'),
('Timothy', 'Turner', 43, 'Mobil'),
('Heather', 'Watson', 44, 'Stationaer'),
('Nicholas', 'Brooks', 45, 'Mobil'),
('Angela', 'Harrison', 46, 'Mobil'),
('Patrick', 'Gomez', 47, 'Mobil'),
('Tiffany', 'Russell', 48, 'Stationaer'),
('Edward', 'Butler', 49, 'Mobil'),
('Rebecca', 'Barnes', 50, 'Mobil');

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
('Eve', 'Davis', '555-9012', 3, 'Ambulant', 3),
('Charlie', 'Brown', '555-3456', 4, 'Ambulant', 2),
('Olivia', 'Wilson', '555-7890', 5, 'Ambulant', 3),
('John', 'Doe', '555-1111', 6, 'Ambulant', 2),
('Jane', 'Smith', '555-2222', 7, 'Stationaer', 3),
('Michael', 'Johnson', '555-3333', 8, 'Ambulant', 3),
('Emily', 'Davis', '555-4444', 9, 'Ambulant', 2),
('David', 'Wilson', '555-5555', 10, 'Ambulant', 3),
('Sarah', 'Brown', '555-6666', 11, 'Ambulant', 2),
('Matthew', 'Lee', '555-7777', 12, 'Stationaer', 3),
('Oliver', 'Anderson', '555-8888', 13, 'Ambulant', 1),
('Sophia', 'Taylor', '555-9999', 14, 'Ambulant', 2),
('James', 'Clark', '555-0000', 15, 'Ambulant', 1),
('Emma', 'Harris', '555-1234', 16, 'Ambulant', 2),
('Noah', 'Jackson', '555-5678', 17, 'Stationaer', 3),
('Isabella', 'White', '555-9012', 18, 'Ambulant', 3),
('William', 'Martin', '555-3456', 19, 'Ambulant', 2),
('Ava', 'Thompson', '555-7890', 20, 'Ambulant', 3),
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
('Amelia', 'Martin', '555-9012', 33, 'Ambulant', 3),
('Benjamin', 'Thompson', '555-3456', 34, 'Ambulant', 2),
('Ella', 'Smith', '555-7890', 35, 'Ambulant', 1),
('Elizabeth', 'Johnson', '555-1111', 36, 'Ambulant', 2),
('Henry', 'Davis', '555-2222', 37, 'Stationaer', 3),
('Sebastian', 'Brown', '555-3333', 38, 'Ambulant', 1),
('Victoria', 'Wilson', '555-4444', 39, 'Ambulant', 2),
('Joseph', 'Lee', '555-5555', 40, 'Ambulant', 3),
('Scarlett', 'Anderson', '555-6666', 41, 'Ambulant', 2),
('Christopher', 'Taylor', '555-7777', 42, 'Stationaer', 3),
('Evelyn', 'Clark', '555-8888', 43, 'Ambulant', 1),
('Samuel', 'Harris', '555-9999', 44, 'Ambulant', 2),
('Grace', 'Jackson', '555-0000', 45, 'Ambulant', 1),
('Zoe', 'White', '555-1234', 46, 'Ambulant', 2),
('Andrew', 'Martin', '555-5678', 47, 'Stationaer', 3),
('David', 'Thompson', '555-9012', 48, 'Ambulant', 1),
('Abigail', 'Smith', '555-3456', 49, 'Ambulant', 2),
('Daniel', 'Johnson', '555-7890', 50, 'Ambulant', 1),
('Sophia', 'Perez', '555-1234', 2, 'Ambulant', 2),
('Isabella', 'Robinson', '555-5678', 3, 'Stationaer', 2),
('Mia', 'Hill', '555-9876', 1, 'Ambulant', 2),
('Ethan', 'Parker', '555-4321', 1, 'Stationaer', 1),
('James', 'Flores', '555-8765', 2, 'Ambulant', 2),
('Ava', 'Morris', '555-2345', 3, 'Ambulant', 1),
('Liam', 'Ward', '555-7890', 3, 'Ambulant', 2),
('Charlotte', 'Gonzalez', '555-5432', 2, 'Stationaer', 1),
('Alexander', 'Mitchell', '555-9012', 1, 'Ambulant', 3),
('Amelia', 'Carter', '555-3456', 3, 'Ambulant', 2),
('Oliver', 'Torres', '555-7890', 1, 'Stationaer', 3),
('Emma', 'Hernandez', '555-2109', 2, 'Ambulant', 3),
('Sophia', 'Wright', '555-6543', 3, 'Ambulant', 1),
('Noah', 'Hill', '555-0987', 2, 'Stationaer', 2),
('Olivia', 'Stewart', '555-4321', 3, 'Ambulant', 2),
('Aiden', 'Cox', '555-8765', 2, 'Ambulant', 1),
('Lucas', 'Rivera', '555-2345', 1, 'Stationaer', 3),
('Aria', 'Reed', '555-7890', 3, 'Ambulant', 3),
('Evelyn', 'Gonzalez', '555-5432', 2, 'Ambulant', 1),
('Mason', 'Mitchell', '555-9012', 2, 'Stationaer', 3),
('Harper', 'Collins', '555-3456', 1, 'Ambulant', 2),
('William', 'Perez', '555-7890', 2, 'Stationaer', 1),
('Emily', 'Hernandez', '555-2109', 3, 'Ambulant', 3),
('Ethan', 'Wright', '555-6543', 1, 'Ambulant', 1),
('Sophia', 'Bell', '555-0987', 3, 'Ambulant', 3),
('Olivia', 'Foster', '555-4321', 2, 'Stationaer', 1),
('Liam', 'Gray', '555-8765', 3, 'Ambulant', 2),
('Ava', 'Rogers', '555-2345', 2, 'Ambulant', 1),
('Mia', 'Stewart', '555-7890', 1, 'Stationaer', 3),
('Charlotte', 'Cox', '555-5432', 3, 'Ambulant', 1),
('Alexander', 'Mitchell', '555-9012', 2, 'Ambulant', 3),
('Amelia', 'Perry', '555-3456', 1, 'Stationaer', 2),
('Oliver', 'Ward', '555-7890', 1, 'Ambulant', 1),
('Emma', 'Bell', '555-2109', 3, 'Ambulant', 1),
('Sophia', 'Hernandez', '555-6543', 2, 'Stationaer', 1),
('Noah', 'Foster', '555-0987', 1, 'Ambulant', 2),
('Olivia', 'Gray', '555-4321', 3, 'Ambulant', 1),
('Aiden', 'Rogers', '555-8765', 2, 'Stationaer', 3),
('Lucas', 'Cox', '555-2345', 3, 'Ambulant', 1),
('Aria', 'Mitchell', '555-7890', 2, 'Ambulant', 2),
('Evelyn', 'Perry', '555-5432', 3, 'Stationaer', 2),
('Mason', 'Ward', '555-9012', 1, 'Ambulant', 2),
('Harper', 'Bell', '555-3456', 2, 'Stationaer', 3),
('William', 'Hernandez', '555-7890', 3, 'Ambulant', 2),
('Emily', 'Foster', '555-2109', 1, 'Ambulant', 3),
('Ethan', 'Gray', '555-6543', 3, 'Ambulant', 1),
('Sophia', 'Rogers', '555-0987', 2, 'Stationaer', 2),
('Olivia', 'Cox', '555-4321', 1, 'Ambulant', 1),
('Liam', 'Mitchell', '555-8765', 2, 'Ambulant', 3),
('Mia', 'Ward', '555-7890', 2, 'Ambulant', 2);

-- Dummy data for Krankschreibung_Kunde table
INSERT INTO Krankschreibung_Kunde (Kunden_ID, Start_Datum, ENDE_Datum) VALUES
(1, '2023-05-02', '2023-05-03'),
(3, '2023-05-11', '2023-05-11'),
(2, '2023-05-20', '2023-05-21'),
(4, '2023-05-25', '2023-05-25'),
(5, '2023-05-28', '2023-05-29');