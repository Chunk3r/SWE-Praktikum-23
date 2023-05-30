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
