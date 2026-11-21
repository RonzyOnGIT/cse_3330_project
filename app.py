from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route("/")
def hello_world():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)


def get_db():
    return mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="",
        database="project"
    ) 