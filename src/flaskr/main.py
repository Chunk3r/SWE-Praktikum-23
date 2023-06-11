import datetime
from flask import Blueprint,flash, render_template, redirect, url_for, request
from flaskr.db import get_db
from flask_login import login_required, current_user
#app = Flask(__name__)
main = Blueprint('main', __name__)

#@main.route('/')
#def index():
#    return render_template("index.html")

@main.route('/dienstplan')
@login_required
def dienstplan():
    db = get_db()
    date_str = request.args.get("date", type=str)

    # wenn kein datum angegeben wurde, heutiges datum verwenden
    if date_str == None:
        date = datetime.date.today()
    else:
        date = datetime.datetime.strptime(date_str, "%Y-%m-%d").date()
    
    # besuche aus datenbank laden
    appointments = db.execute("""SELECT *
                            FROM Besuche
                            INNER JOIN Kunde ON Besuche.Kunden_ID = Kunde.Kunden_ID
                            INNER JOIN Adresse ON Kunde.Adresse = Adresse.Adresse_ID
                            WHERE Mitarbeiter_ID = ? AND Datum = ?""", [current_user.ID, date]).fetchall()

    print("found ", len(appointments), " appointments")
    
    return render_template("dienstplan.html", appointments=appointments, Mitarbeiter=current_user, date=date)


@main.route('/verwaltung', methods=["GET","POST"])
@main.route('/verwaltung/<mbPT>', methods=["GET","POST"])
@login_required
def verwaltung(mbPT=None):
    cursor = get_db().cursor()
    mb_krankmeldung = """SELECT Mitarbeiter.VorName, Mitarbeiter.NachName, Dienstbefreiung_Mitarbeiter.Start_Datum, Dienstbefreiung_Mitarbeiter.Ende_Datum 
            FROM Dienstbefreiung_Mitarbeiter JOIN Mitarbeiter ON Mitarbeiter.MB_ID = Dienstbefreiung_Mitarbeiter.Mitarbeiter_ID;"""
    pt_krankmeldung = """ SELECT Kunde.VorName, Kunde.NachName, Krankschreibung_Kunde.Start_Datum, Krankschreibung_Kunde.Ende_Datum
            FROM Krankschreibung_Kunde JOIN Kunde ON Kunde.Kunden_ID = Krankschreibung_Kunde.Kunden_ID;"""


    if mbPT == 'MB':
        result = list(cursor.execute(mb_krankmeldung).fetchall())
        krank = "Mitarbeiter"
    else:
        result = list(cursor.execute(pt_krankmeldung).fetchall())
        krank = "Patienten"

    return render_template("verwaltung.html", Mitarbeiter=current_user, result=result, krank=krank)

@main.route('/krankMB')
@login_required
def krankMB():
    return render_template("krankMB.html", Mitarbeiter=current_user)

@main.route('/krankPT')
@login_required
def krankPT():
    return render_template("krankPT.html")



@main.route('/krankMB', methods=["POST"])
@login_required
def krankMB_post():
    VorName = request.form.get('VorName').strip()
    NachName = request.form.get('NachName').strip()
    VonDatum = request.form.get('VonDatum').strip()
    EndeDatum = request.form.get('EndeDatum').strip()
    
    ID_cmd = "SELECT MB_ID FROM Mitarbeiter WHERE VorName='" + VorName + "' AND NachName='" + NachName +  "'; "
   

    conn = get_db()
    cursor = conn.cursor()

    ID = cursor.execute(ID_cmd).fetchone()
    if not ID:

        flash("Nutzer nicht gefunden")
        return redirect(url_for('main.krankMB'))


    sql_cmd = "INSERT INTO Dienstbefreiung_Mitarbeiter(Mitarbeiter_ID, Start_Datum, Ende_Datum) VALUES (" + str(ID[0]) + " , '" + VonDatum + "' , '" + EndeDatum + "');"
    cursor.execute(sql_cmd)
    conn.commit()

    return redirect(url_for('main.verwaltung'))

@main.route('/krankPT', methods=["POST"])
@login_required
def krankPT_post():
    VorName = request.form.get('VorName').strip()
    NachName = request.form.get('NachName').strip()
    VonDatum = request.form.get('VonDatum').strip()
    EndeDatum = request.form.get('EndeDatum').strip()
    
    ID_cmd = "SELECT Kunden_ID FROM Kunde WHERE VorName='" + VorName + "' AND NachName='" + NachName +  "'; "

    conn = get_db()
    cursor = conn.cursor()
    ID = cursor.execute(ID_cmd).fetchone()
    if not ID:
        flash("Patient nicht gefunden")
        return redirect(url_for('main.krankPT'))


    sql_cmd = "INSERT INTO Krankschreibung_Kunde(Kunden_ID, Start_Datum, Ende_Datum) VALUES (" + str(ID[0]) + " , '" + VonDatum + "' , '" + EndeDatum + "');"
    
    cursor.execute(sql_cmd)
    conn.commit()


    return redirect(url_for('main.verwaltung'))

@main.route('/liste')
@main.route('/liste/<mbPT>', methods=['GET','POST'])
@login_required
def liste(mbPT=None):
    sql_MB = """ SELECT MB_ID, VorName, NachName FROM Mitarbeiter;"""
    sql_PT = """ SELECT Kunden_ID, VorName, NachName FROM Kunde;"""
    cursor = get_db().cursor()
    if mbPT == 'MB':
        result = list(cursor.execute(sql_MB).fetchall())
        MP = "Mitarbeiter"
    else:
        result = list(cursor.execute(sql_PT).fetchall())
        MP = "Patienten"

    return render_template('liste.html', Mitarbeiter=current_user, result=result, MP=MP)




