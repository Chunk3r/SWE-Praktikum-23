from flask import Blueprint, render_template, redirect, url_for
from flaskr.db import get_db
from flask_login import login_required, current_user
#app = Flask(__name__)
main = Blueprint('main', __name__)

#@main.route('/')
#def index():
#    return render_template("index.html")

@main.route('/dienstplan')
#@login_required
def dienstplan():
    db = get_db()
    
    appointments = db.execute("SELECT * FROM Besuche").fetchall()

    print("appointmets:")
    for app in appointments: print(app.keys())
    print(current_user)
    
    #return render_template("dienstplan.html", appointments=appointments, NachName=current_user.NachName)
    return render_template("dienstplan.html", appointments=appointments, Mitarbeiter=current_user)



@main.route('/verwaltung')
@login_required
def verwaltung():
    cursor = get_db().cursor()
    dienstbefreiung = cursor.execute("""SELECT Mitarbeiter.VorName, Mitarbeiter.NachName, Dienstbefreiung_Mitarbeiter.Start_Datum, Dienstbefreiung_Mitarbeiter.Ende_Datum 
            FROM Dienstbefreiung_Mitarbeiter JOIN Mitarbeiter ON Mitarbeiter.MB_ID = Dienstbefreiung_Mitarbeiter.Mitarbeiter_ID;""").fetchall()
    dienstbefreiung = list(dienstbefreiung)


    return render_template("verwaltung.html", Mitarbeiter=current_user, dienstbefreiung=dienstbefreiung)

@main.route('/krankMB')
@login_required
def krankMB():
    return render_template("krankMB.html")
