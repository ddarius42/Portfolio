<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="stylesheet" href="/css/newPost.css">
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>New Post</title>
            </head>

            <body>
                <div class="nav">

                    <a href="/dashboard">
                        <h1 class="title"> CanIBorrow!</h1>
                    </a>

                    <ul>
                        <li class="nav-link"><a class="nav-link" href="/dashboard">Home</a></li>
                        <li class="nav-link"><a class="nav-link" href="/profile/${loggedInUser.id}">Profile</a></li>
                        <li class="nav-link"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>
                <h2>New Post</h2>
                <form:form class="form" action="/createPost" method="post" modelAttribute="newPost">
                    <div class="form-group">
                        <form:label class="form-label" path="title">Title: </form:label>
                        <form:errors path="title" />
                        <form:input class="form-input" path="title" />
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="price">Price: </form:label>
                        <form:errors path="price" />
                        <form:input class="form-input" id="price" type="number" path="price" />
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="image">Image: link only upload coming soon!!!</form:label>
                        <form:errors path="image" />
                        <form:textarea  class="image-textarea" path="image" />
                    </div>
                    <div class="form-group">
                        <form:label path="user"></form:label>
                        <form:errors path="user" />
                        <form:hidden path="user" value="${loggedInUser.id}" />
                    </div>
                    <button>Create</button>
                </form:form>

            </body>

            </html>