from flask import Blueprint, render_template, redirect, url_for, request, flash
from . import db
import sqlite3
from flask_login import login_user, logout_user, current_user
from .models import Mitarbeiter


auth = Blueprint('auth', __name__)

@auth.route('/')
@auth.route('/login')
def login():
    return render_template('index.html')


@auth.route('/login', methods=['POST'])
def login_post():
    
    NachName = request.form.get('NachName')

    cursor = db.get_db().cursor() 
    cursor.execute(f"Select MB_ID, VorName, NachName FROM Mitarbeiter WHERE NachName='{NachName}';")
    result = cursor.fetchone()
    
    if not result:
        flash('Account existiert nicht')
        return redirect(url_for('auth.login'))

    user_ID, user_VorName, user_NachName = list(result)
    user = Mitarbeiter(user_ID, user_VorName, user_NachName)
    #db_user = load_user(user.NachName) 
    
    if user.NachName != NachName :
        return redirect(url_for('auth.login'))
    else:
        login_user(user)
        return render_template('dienstplan.html', NachName = current_user.NachName)

@auth.route('/signup')
def signup():
    return 'Signup'

@auth.route('/logout')
def logout():
    lol = logout_user()# gibt True aus wenn erfolgreich
    
    return render_template('index.html')
