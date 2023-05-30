from flask import Blueprint, render_template, redirect, url_for
from flaskr.db import get_db

#app = Flask(__name__)
main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template("index.html")

@main.route('/dienstplan')
def dienstplan():
    isLoggedIn = True # TODO

    # If user is not logged in, redirect to login page
    if isLoggedIn == False:
        return redirect(url_for("main.index"))
    
    db = get_db()
    
    appointments = db.execute("SELECT * FROM Besuche").fetchall()

    print("appointmets:", appointments)

    return render_template("dienstplan.html", appointments=appointments)


@main.route('/profile')
def profile():
    return 'Profile'
