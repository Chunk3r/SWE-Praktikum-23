from flask import Blueprint, render_template
from . import db

#app = Flask(__name__)
main = Blueprint('main', __name__)

#@main.route('/')
#def index():
#    return render_template("index.html")

@main.route('/profile')
def profile():
    return 'Profile'
