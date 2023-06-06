from flask import Blueprint, render_template, redirect, url_for, request
from . import db
import sqlite3
from flask_login import login_user
from .models import Mitarbeiter, load_user


auth = Blueprint('auth', __name__)

@auth.route('/')
@auth.route('/login')
def login():
    return render_template('index.html')


@auth.route('/login', methods=['POST'])
def login_post():
    
    NachName = request.form.get('NachName')
    print("------")
    print(NachName)
    print("------")

    cursor = db.get_db().cursor() 
    cursor.execute(f"Select MB_ID, VorName, NachName FROM Mitarbeiter WHERE NachName='{NachName}';")
    result = cursor.fetchone()

    
    print(list(result))
    user_ID, user_VorName, user_NachName = list(result)
    print(user_ID) 
    print(user_VorName)
    print(user_NachName)
    user = Mitarbeiter(user_ID, user_VorName, user_NachName)
    
    db_user = load_user(user.NachName) 
     
    if db_user.NachName != NachName :
    #if user[2] != NachName:
        flash('Please try again')
        return redirect(url_for('auth.login'))
    else:
        login_user(user)
        #login_user(db_user)
        return render_template('dienstplan.html')

@auth.route('/signup')
def signup():
    return 'Signup'

@auth.route('/logout')
def logout():
    return 'Logout'
