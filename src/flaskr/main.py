from flask import Blueprint, render_template, redirect, url_for
from flaskr.db import get_db
from flaskr.dienstplan.generator import generateDienstplan
from flask_login import login_required
#app = Flask(__name__)
main = Blueprint('main', __name__)

#@main.route('/')
#def index():
#    return render_template("index.html")

@main.route('/dienstplan')
#@login_required
def dienstplan():
    
    # TODO mertus: user nachname von flask login cookie bekommen.
    nachname = "Doe"

    db = get_db()
    
    appointments = db.execute("SELECT * FROM Besuche").fetchall()

    print("appointmets:")
    for app in appointments: print(app.keys())

    return render_template("dienstplan.html", appointments=appointments)


@main.route('/profile')
def profile():
    return 'Profile'
