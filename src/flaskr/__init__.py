import os
from . import db
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
import sqlite3

login_manager = LoginManager()
login_manager.login_view = 'auth.login'
def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    
    app.config.from_mapping(
        SECRET_KEY='2922_ara_420%ara',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    # ensure the instance folder for the database exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    
    #init login_manager
    login_manager.init_app(app)
    
    #init db 
    from . import db
    db.init_app(app)

    # blueprint for auth routes in our app
    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    # blueprint for non-auth parts of app
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)


    @login_manager.user_loader
    def load_user(user_id):
        # since the user_id is just the primary key of our user table, use it in the query for the user
        #return User.query.get(int(user_id))
        conn = sqlite3.connect('../instance/flaskr.sqlite')
        curs = conn.cursor()
        curs.execute(f"SELECT MB_ID, VorName, NachName FROM Mitarbeiter WHERE MB_ID='{user_id}';")
        result = curs.fetchone()
        if result is None:
            return None
        else:
            return User(int(result[0]), result[1], result[2])


    return app
