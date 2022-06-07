from flaskApp import app
from flask import Flask, flash, render_template, redirect, request, session
from flaskApp.models.user import User
from flaskApp.models.post import Post
from flaskApp.models.likeComment import Comment
import  datetime as dt


#Dashboard route 
@app.route("/dashboard")
def dashboard():
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    userData={
        'id': session['userId']
    }
    posts=Post.getUsernameWithPost()
    
    comments=Comment.getCommentWithPost()
    return render_template('dashboard.html', user=User.getById(userData), posts=posts,comments=comments)

#Route for displaying new post form
@app.route("/newPostPage")
def newPostPage():
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    data={
        "id": session['userId']
    }
    userId=session['userId']
    return render_template("newPostPage.html", user=User.getById(data),userId=userId)

#Route to create new post using data
@app.route('/newPost', methods=['POST'])
def newPost():
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    userId=session['userId']
    data={
        "image": request.form['formImageLink'],
        "description": request.form['formDescription'],
        "users_id": userId
    }
    
    Post.createPost(data)
    return redirect('/dashboard')


#Route for displaying profile and posts
@app.route('/profile')
def liked():
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    data={
        "users_id": session['userId']
    }
    sessionData={
        'id': session['userId']
    }
    userPost=Post.getPostByUser(data)
    return render_template('profile.html',userPost=userPost, user=User.getById(sessionData))

@app.route('/profile/<userId>')
def userProfile(userId):
    data = {
        'users_id': userId
    }
    profileData={
        'id': userId
    }
    comments=Comment.getCommentWithPost()
    userPost= Post.getPostByUser(data)
    return render_template("profile.html", userPost=userPost,  user=User.getById(profileData),comments=comments)
#Route that displays edits posts page by id
@app.route('/editPostPage/<postId>')
def editPostPage(postId):
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    data={
        "postId": postId
    }
    postById=Post.getPostById(data)
    return render_template('editPost.html',postById=postById)

#Route that updates posts by id
@app.route('/editPost/<postId>', methods=['POST'])
def editPost(postId):
    data={
        "postId": postId,
        "postDescription": request.form['formDescription']
    }
    Post.updatePost(data)
    return redirect('/profile')

#Route deletes post by id
@app.route('/deletePost/<postId>')
def deletePost(postId):
    #Checks for User In session
    if 'userId' not in session:
        flash('Must be logged in to view this page')
        return redirect('/')
    data={
        "postId": postId
    }
    Post.deletePost(data)
    return redirect('/profile')