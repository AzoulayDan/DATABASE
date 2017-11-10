#-*- encoding:utf-8 -*-
from flask import Flask
from flask_cors import CORS
from db import Db

app = Flask(__name__)
app.debug = True
CORS(app)

@app.route('/')
def init_database():
	db = Db()
	db.executeFile('database.sql')
	db.close()
	return "Database initialised"

if __name__ == '__main__':
	app.run()

