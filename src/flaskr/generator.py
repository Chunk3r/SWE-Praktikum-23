import datetime
import sqlite3
from flaskr.db import get_db

def generate_dienstplaene():
    db = get_db()

    today = datetime.date.today()
    today_str = today.strftime("%Y-%m-%d") # example: 2023-05-12

    #daten der mitarbeiter aus der db importieren
    alle_mitarbeiter = db.cursor().execute("SELECT * FROM Mitarbeiter").fetchall()

    #daten der kunden aus der db importieren
    kunden = db.cursor().execute("SELECT * FROM Kunde").fetchall()

    #krankmeldungen aus der db importieren
    krankmeldungen_mitarbeiter = db.cursor().execute("SELECT * FROM Dienstbefreiung_Mitarbeiter").fetchall()
    krankmeldungen_kunden = db.cursor().execute("SELECT * FROM Krankschreibung_Kunde").fetchall()

    ##Tagesplan erstellen##
    for mitarbeiter in alle_mitarbeiter:
        print("Generating Dienstplan for " + mitarbeiter["VorName"] + " " + mitarbeiter["NachName"])

        mitarbeiter_id = mitarbeiter["MB_ID"]

        #besuche aus der db importieren
        besuche = db.execute("SELECT * FROM Besuche WHERE Datum = ? AND Mitarbeiter_ID = ?", [today_str, mitarbeiter_id]).fetchall()
        #besuche.sort((besuch) -> besuch["Uhrzeit"])

        # arbeitszeit von 8 bis 16 uhr
        for hour in range(8, 16):
            # 30min fahrzeit
            besuch_startzeit= datetime.datetime.strptime(str(hour) + ":30", "%H:%M")
            besuch_startzeit_str = besuch_startzeit.time().strftime("%H:%M")

            # check ob ein besuch eintrag schon existiert
            besuch = findBesuchForTime(besuche, besuch_startzeit)

            # wenn besuch schon existiert, mit nächster stunde weiter machen
            if besuch != None:
                continue

            # kunden für besuch finden
            passender_kunde = findKunde(kunden, today_str, besuch_startzeit)

            if passender_kunde == None:
                # kein passender kunde gefunden, freizeit.
                continue

            # neuen besuch eintrag erstellen
            besuch = (passender_kunde["Kunden_ID"], mitarbeiter_id, today_str, besuch_startzeit_str)
            print("adding besuch: ", besuch)

            # besuch in db inserten
            db.execute("INSERT INTO Besuche (Kunden_ID, Mitarbeiter_ID, Datum, Uhrzeit) VALUES(?, ?, ?, ?)", besuch)
            db.commit()

# findet ein besuch an der angegebenen urzeit
def findBesuchForTime(besuche, uhrzeitToFind):
    for besuch in besuche:

        uhrzeit_str = besuch["Uhrzeit"]
        uhrzeit = datetime.datetime.strptime(uhrzeit_str, "%H:%M").time()
        
        if uhrzeit == uhrzeitToFind:
            return besuch
        
    return None

# findet einen passenden kunden, der einen besuch braucht
def findKunde(kunden, today_str, uhrzeit):
    db = get_db()
    for kunde in kunden:
        kunden_id = kunde["Kunden_ID"]

        # checken wieviele besuche der kunde heute schon hat
        kunden_besuche_count = db.execute("SELECT COUNT(*) FROM Besuche WHERE Datum = ? AND Kunden_ID = ?", [today_str, kunden_id]).fetchone()[0]
        if kunden_besuche_count >= kunde["Besuche_Pro_Tag"]:
            # wenn kunde schon alle besuche pro tag hat, zum nächsten kunden iterieren
            continue

        # TODO checken ob kunde auch nicht krankgeschrieben ist

        # TODO checken ob kunde die richtige pflegekategorie(ambulant/stationär) hat

        # passender kunde gefunden
        return kunde
    # kein passender kunde gefunden
    return None
        