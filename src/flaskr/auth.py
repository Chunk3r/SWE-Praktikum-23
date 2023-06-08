from flask import Blueprint, render_template, redirect, url_for, request, flash
from . import db
import sqlite3
from flask_login import login_user, logout_user, current_user, login_required
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
    cursor.execute(f"Select MB_ID, VorName, NachName, Rolle  FROM Mitarbeiter WHERE NachName='{NachName}';")
    result = cursor.fetchone()
    
    if not result:
        flash('Account existiert nicht')
        return redirect(url_for('auth.login'))

    user_ID, user_VorName, user_NachName, user_Rolle = list(result)
    user = Mitarbeiter(user_ID, user_VorName, user_NachName, user_Rolle)
    #db_user = load_user(user.NachName) 
    
    if user.NachName != NachName :
        return redirect(url_for('auth.login'))
    elif user.Rolle == "Pflege" or user.Rolle == "Employee":
        login_user(user)
        return redirect(url_for('main.dienstplan'))
    else:
        login_user(user)
        return redirect(url_for('main.verwaltung') )# NachName = current_user.NachName)


@auth.route('/logout')
@login_required
def logout():
    lol = logout_user()# gibt True aus wenn erfolgreich
    if lol:
        flash('Erfolgreich ausgeloggt.') 
    return redirect(url_for('auth.login'))
