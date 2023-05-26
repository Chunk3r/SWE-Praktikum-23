from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"
    
@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template("hello.html", name=name)

'''
@app.route('/')
def login():
    #get all Workers and pack them in a List
    error = None
    if request.method == 'POST':
        if valid_login(request.form['username']):
            return log_the_user_in(request.form['username'])
        else:
            error = 'Invalid username'
    # the code below is executed if the request method
    # was GET or the credentials were invalid
        return render_template('login.html', error=error)


