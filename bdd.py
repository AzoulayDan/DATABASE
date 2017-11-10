#-*- encoding:utf-8 -*-
from flask import Flask
from flask_cors import CORS
from db import Db

@app.route('/')
def init_database():
	db = Db()
	db.executeFile('database.sql')
	db.close()
	return "Database initialised"

if __name__ == '__main__':
	app.run()

