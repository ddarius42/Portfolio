<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="stylesheet" href="/css/post.css">
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>
                    <c:out value="${postModel.title}" />
                </title>
            </head>

            <body>

                <div class="nav">

                    <a href="/dashboard">
                        <h1 class="title"> CanIBorrow!</h1>
                    </a>

                    <ul>
                        <li class="nav-link"><a class="nav-link" href="/dashboard">Home</a></li>
                        <li class="nav-link"><a class="nav-link" href="/newPost">New Post</a></li>
                        <li class="nav-link"><a class="nav-link" href="/profile/${loggedInUser.id}">Profile</a></li>
                        <li class="nav-link"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>
                <h2>
                    <c:out value="${postModel.title}" />
                </h2>
                <table>
                    <tr>
                        <td>
                            <img src="${postModel.image}" alt="image of ${post.title}">
                        </td>
                        <td>
                            <p class="price">
                                <c:out value="${postModel.price}" />
                                <c:out value="/ ${postModel.per}" />
                            </p>
                            <p class="description">
                                Description:
                                <c:out value="${postModel.description}" />
                            </p>
                        </td>
                    </tr>
                    </div>
                </table>
            </body>

            </html>