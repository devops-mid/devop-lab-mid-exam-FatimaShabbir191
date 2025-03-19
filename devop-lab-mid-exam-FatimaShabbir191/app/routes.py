import re
from flask import render_template, request, redirect, url_for
from app import app, db
from app.models import User

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    email = request.form['email']
    phone = request.form.get('phone', '')
    address = request.form['address']

    # Server-side validation
    if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
        return "Invalid email format", 400  # Return error if email is invalid

    if not phone.isdigit() or len(phone) != 10:
        return "Phone number must be exactly 10 digits", 400

    user = User(name=name, email=email, phone=phone, address=address)
    db.session.add(user)
    db.session.commit()
    
    return redirect(url_for('index'))
