from flask import Blueprint, render_template, redirect, url_for, request
from . import db
import sqlite3

auth = Blueprint('auth', __name__)

@auth.route('/', methods=['GET','POST'])
@auth.route('/login', methods=['GET','POST'])
def login():
    
    name = request.form.get('name')

    dataBase = db.get_db()
    cursor = dataBase.cursor()

    name_sql = cursor.execute(f"Select VorName FROM Mitarbeiter WHERE VorName={name}").fetchone()

    if name_sql != name :
        flash('Please try again"')
        return redirect(url_for('auth.login'))

    return render_template('dienstplan.html')

@auth.route('/signup')
def signup():
    return 'Signup'

@auth.route('/logout')
def logout():
    return 'Logout'
