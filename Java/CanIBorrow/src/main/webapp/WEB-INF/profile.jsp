<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="stylesheet" href="/css/profile.css">
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Profile</title>
            </head>

            <body>
                <div class="nav">

                    <a href="/dashboard">
                        <h1 class="title"> CanIBorrow!</h1>
                    </a>

                    <h1>
                        <c:out value="${loggedInUser.name}'s" /> Profile
                    </h1>

                    <ul>
                        <li class="nav-link"><a class="nav-link" href="/dashboard">Home</a></li>
                        <li class="nav-link"><a class="nav-link" href="/newPost">New Post</a></li>
                        <li class="nav-link"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>

                <h2>Posts</h2>

                <table>
                    <c:forEach items="${postsByUser}" var="post">
                        <tr onclick="location.href='/post/${post.id}';" style="cursor:pointer;">
                            <td class="post-title">
                                <c:out value="${post.title}" />
                            </td>
                            <td>
                                <img src="${post.image}" alt="image of ${post.title}">
                            </td>
                            <td class="price">
                                <c:out value="${post.price}" />

                                <a class="edit-delete" href="/editPostPage/${post.id}">Edit</a>

                                <form:form action="/deletePost/${loggedInUser.id}/${post.id}" method="delete"
                                    modelAttribute="deletePost">
                                    <button class="edit-delete">Delete</button>
                                </form:form>

                            </td>


                        </tr>

                    </c:forEach>
                    </div>
                </table>
            </body>

            </html>