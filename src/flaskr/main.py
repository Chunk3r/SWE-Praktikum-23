from flask import Blueprint, render_template, redirect, url_for
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
    isLoggedIn = True # TODO

    # If user is not logged in, redirect to login page
    if isLoggedIn == False:
        return redirect(url_for("main.index"))
    
    db = get_db()
    
    appointments = db.execute("SELECT * FROM Besuche").fetchall()

    print("appointmets:", appointments)
    print(current_user) 
    #return render_template("dienstplan.html", appointments=appointments, NachName=current_user.NachName)
    return render_template("dienstplan.html", appointments=appointments, Mitarbeiter=current_user)



@main.route('/verwaltung')
@login_required
def verwaltung():
    cursor = get_db().cursor()
    


    return render_template("verwaltung.html", Mitarbeiter=current_user)
