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
                <title>Document</title>
            </head>

            <body>
                <form:form class="form" action="/editPost/${loggedInUser.id}/${editPost.id}" method="put"
                    modelAttribute="editPost">
                    <div class="form-group">
                        <form:label class="form-label" path="title">Title: </form:label>
                        <form:errors path="title" />
                        <form:input value="${editPost.title}" class="form-input" path="title" />
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="price">Price: </form:label>
                        <form:errors path="price" />
                        <form:input value="${editPost.price}" class="form-input" id="price" type="number"
                            path="price" />
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="per">Per: </form:label>
                        <form:errors path="per" />
                        <form:select class="form-input" path="per">
                            <form:option value="hour" label="hour" />
                            <form:option value="day" label="day" />
                        </form:select>
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="image">Image: link only upload coming soon!!!</form:label>
                        <form:errors path="image" />
                        <form:textarea value="${editPost.image}" class="image-textarea" path="image" />
                    </div>
                    <div class="form-group">
                        <form:label class="form-label" path="description">Description: </form:label>
                        <form:errors path="description" />
                        <form:textarea class="image-textarea" value="${editPost.description}" path="description" />
                    </div>
                    <div class="form-group">
                        <form:label path="user"></form:label>
                        <form:errors path="user" />
                        <form:hidden path="user" value="${loggedInUser.id}" />
                    </div>
                    <button>Update</button>
                    <a href="/profile/${loggedInUser.id}">Cancel</a>
                </form:form>
            </body>

            </html>