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
def verwaltung():
    return 'Profile'
