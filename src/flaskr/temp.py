from os import path
import sqlite3

db_path = path.join("../instance/", 'flaskr.sqlite')
print(db_path)
con = sqlite3.connect(db_path)

cursor = con.cursor()


result = cursor.execute("SELECT VorName FROM Mitarbeiter;")

con.commit()
print(result.fetchone())
