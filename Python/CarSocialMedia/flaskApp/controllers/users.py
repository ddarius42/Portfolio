from flaskApp import app
from flask import Flask, flash, render_template, redirect, request, session
from flaskApp.models.post import Post
from flaskApp.models.user import User
from flask_bcrypt import Bcrypt

bcrypt=Bcrypt(app)

#Login route
@app.route("/")
def loginPage():
    return render_template('login.html')

#Logout route
@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")

#Displays registration 
@app.route("/registrationPage")
def registrationPage():
    return render_template('registration.html')

#Registers User
@app.route('/register', methods=['POST'])
def register():
    #Validates User using User model validation method
    if not User.validateUserRegistration(request.form):
        return redirect('/registrationPage')
    #hashes password 
    pwHash= bcrypt.generate_password_hash(request.form['formPassword'])
    print(pwHash)
    data={
        "firstName": request.form['formFirstName'],
        "lastName": request.form['formLastName'],
        "email": request.form['formEmail'],
        "password": pwHash
    }
    id=User.addUser(data)
    #if User registration didnt go through display error message
    if not id:
        flash("something went wrong!")
        return redirect('/registration')
    session['userId']=id
    return redirect('/')

#Login Route
@app.route('/login',methods=['POST'])
def login():
    #Validates User for Login
    if not User.validateUserLogin(request.form):
        return redirect('/')
    data={"email": request.form['formEmail']}
    #Gets user from db using email
    user= User.getLoginByEmail(data)
    #If no user is found flash
    if not user:
        flash("Invalid Login")
        return redirect('/')
    #Hasher form password and mathces to the database
    if not bcrypt.check_password_hash(user.password, request.form['formPassword']):
        flash("Invalid Login")
        return redirect('/')
    session['userId']= user.id
    return redirect('/dashboard')
    



