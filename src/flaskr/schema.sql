DROP TABLE IF EXISTS Mitarbeiter;

CREATE TABLE Mitarbeiter (
  MB_id INTEGER PRIMARY KEY AUTOINCREMENT,
  VorName TEXT  NOT NULL,
  NachName TEXT NOT NULL,
  Adresse INTEGER FOREIGN KEY,
  Rolle TEXT NOT NULL
);
