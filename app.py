from flask import Flask, render_template, jsonify
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

def fetch_all(query):
    db = get_db()
    cursor = db.cursor(dictionary=True)

    try:
        cursor.execute(query)
        return jsonify(cursor.fetchall())
    finally:
        cursor.close()
        db.close()

@app.get("/api/shoes")
def get_shoes():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    try:
        cursor.execute("SELECT * FROM SHOE")
        shoes = cursor.fetchall()
        return jsonify(shoes)
    finally:
        cursor.close()
        db.close()


@app.get("/api/customers")
def get_customers():
    return fetch_all("SELECT * FROM CUSTOMER")


@app.get("/api/employees")
def get_employees():
    return fetch_all("SELECT * FROM EMPLOYEE")


@app.get("/api/departments")
def get_departments():
    return fetch_all("SELECT * FROM DEPARTMENT")

@app.get("/api/wishlist")
def get_wishlist():
    return fetch_all("SELECT * FROM WISHLIST_ITEM")


@app.get("/api/sales")
def get_sales():
    return fetch_all("SELECT * FROM SALE_REC")