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
                <table>
                    <tr>
                        <td>
                            <h1>
                                <c:out value="${postModel.title}" />
                            </h1>
                        </td>

                        <td>
                            <img src="${postModel.image}" alt="image of ${post.title}">
                        </td>
                        <td>
                            <c:out value="${postModel.price}" />
                        </td>
                    </tr>
                    </div>
                </table>
            </body>

            </html>