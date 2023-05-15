import os
from flask import Flask
import mysql.connector

from data import prefecture

class DBManager:
    def __init__(self, user='user', password='password', database='example', host="db", data={}):
        self.connection = mysql.connector.connect(
            user=user, 
            password=password,
            host=host,
            database=database,
            auth_plugin='mysql_native_password'
        )
        self.data = data
        self.cursor = self.connection.cursor()
        
    def populate_pref(self):
        self.cursor.execute('DROP TABLE IF EXISTS prefecture')
        self.cursor.execute('CREATE TABLE prefecture (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), capital VARCHAR(255))')
        self.cursor.executemany('INSERT INTO prefecture (name, capital) VALUES (%s, %s);', [(a, b) for a, b in self.data.items() ])
        self.connection.commit()
        
    def query_pref(self):
        self.cursor.execute('SELECT name, capital FROM prefecture')
        rec = {}
        for a,b in self.cursor:
            rec[a]=b
        return rec

def connect():
    global conn

    if not conn:
        conn = DBManager(user=os.environ.get('MYSQL_USER'),
                            password=os.environ.get('MYSQL_PASSWORD'),
                            host=os.environ.get('MYSQL_HOST'),
                            database=os.environ.get('MYSQL_DATABASE'),
                            data=prefecture
                            )
    return conn


server = Flask(__name__)
global conn
conn = None

con = connect()

con.populate_pref()

@server.route('/')
def hello():
    reply =  "<h1>Hello World!</h1>"
    reply += "<p>We retrieve the prefectures & capitals from the db :"
    reply += "<ul>"
    con = connect()
    rec = con.query_pref()

    for c,d in rec.items():
        reply += '<li> '+ c +' -> '+ d +'</li>'
    
    reply += "</ul>"
    return reply

if __name__ == '__main__':
    server.run(host='0.0.0.0', port=80)