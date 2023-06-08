import datetime
import sqlite3
from flask import current_app, g
from flaskr.db import get_db

def generate_dienstplaene():
    db = get_db()

    today = datetime.date.today()
    today_str = today.strftime("%Y-%m-%d") # example: 2023-05-12

    #daten der mitarbeiter aus der db importieren
    alle_Mitarbeiter = db.cursor().execute("SELECT * FROM Mitarbeiter").fetchall()

    #daten der kunden aus der db importieren
    kunden = db.cursor().execute("SELECT * FROM Kunde").fetchall()

    #krankmeldungen aus der db importieren
    krankmeldungen_mitarbeiter = db.cursor().execute("SELECT * FROM Dienstbefreiung_Mitarbeiter").fetchall()
    krankmeldungen_kunden = db.cursor().execute("SELECT * FROM Krankschreibung_Kunde").fetchall()

    #besuche aus der db importieren
    besuche = db.execute("SELECT * FROM Besuche WHERE Datum = ? AND Mitarbeiter_ID = ?", [today_str]).fetchall()

    ##Tagesplan erstellen##
    for mitarbeiter in alle_Mitarbeiter:
        print("Generating Dienstplan for " + mitarbeiter["VorName"] + " " + mitarbeiter["NachName"])

        #besuche aus der db importieren
        besuche = db.execute("SELECT * FROM Besuche WHERE Datum = ? AND Mitarbeiter_ID = ?", [today_str, mitarbeiter["MB_ID"]]).fetchall()


        

    #ersten pflege-mitarbeiter auswählen, falls Tagesplan bereits voll, nächsten pflege-mitarbeiter auswählen

    #ersten kunden auswählen, wenn bereits versorgt oder nicht die richtige pflegekategorie(ambulant/stationär) nächsten kunden auswählen

    #neuen besuch-eintrag erstellen, 