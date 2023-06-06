PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Mitarbeiter;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Dienstbefreiung_Mitarbeiter;
DROP TABLE IF EXISTS Kunde;
DROP TABLE IF EXISTS Krankschreibung_Kunde;
DROP TABLE IF EXISTS Besuche;


CREATE TABLE Adresse (
	Adresse_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Straße TEXT ,
	Hausnummer TEXT,
	PLZ INTEGER,
	Ort TEXT,
	Wohnraum INTEGER
);

CREATE TABLE Mitarbeiter (
  	MB_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  	VorName TEXT NOT NULL,
  	NachName TEXT NOT NULL,
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
        VorName TEXT NOT NULL,
        NachName TEXT NOT NULL,
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
INSERT INTO Adresse (Straße, Hausnummer, PLZ, Ort, Wohnraum) VALUES
('Example Street', '123', 12345, 'Example City', 2),
('Test Road', '456', 54321, 'Testville', 1),
('Sample Avenue', '789', 98765, 'Sampletown', 3),
('Demo Lane', '321', 54321, 'Demoville', 2),
('Trial Boulevard', '654', 12345, 'Trial City', 1);

-- Dummy data for Mitarbeiter table
INSERT INTO Mitarbeiter (VorName, NachName, Adresse, Rolle) VALUES
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
INSERT INTO Kunde (VorName, NachName, TelefonNummer, Adresse, Rolle, Besuche_Pro_Tag) VALUES
('Alice', 'Johnson', '555-1234', 1, 'Regular', 2),
('Bob', 'Smith', '555-5678', 2, 'Regular', 3),
('Eve', 'Davis', '555-9012', 3, 'Regular', 1),
('Charlie', 'Brown', '555-3456', 4, 'Regular', 2),
('Olivia', 'Wilson', '555-7890', 5, 'Regular', 1);

-- Dummy data for Krankschreibung_Kunde table
INSERT INTO Krankschreibung_Kunde (Kunden_ID, Start_Datum, ENDE_Datum) VALUES
(1, '2023-05-02', '2023-05-03'),
(3, '2023-05-11', '2023-05-11'),
(2, '2023-05-20', '2023-05-21'),
(4, '2023-05-25', '2023-05-25'),
(5, '2023-05-28', '2023-05-29');

-- Dummy data for Besuche table
INSERT INTO Besuche (Kunden_ID, Mitarbeiter_ID, Datum, Uhrzeit) VALUES
(1, 1, '2023-05-01', '09:00'),
(2, 2, '2023-05-02', '14:30'),
(3, 3, '2023-05-03', '11:15'),
(4, 4, '2023-05-04', '16:45'),
(5, 5, '2023-05-05', '13:00');