<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Favorites</title>
                </head>

                <body>
                    <c:out value="${favorites}"></c:out>
                    <c:set var="posts" value="${favorites}" />
                    <c:if test="${fn:length(posts) == 0}">
                        <h3>NO favorites</h3>
                    </c:if>
                    <table>
                        <c:forEach items="${favorites}" var="posts">

                            <tr>
                                <td class="post-title">
                                    <c:out value="${posts.title}" />
                                </td>
                                <td>
                                    <img src="${posts.image}" alt="image of ${post.title}">
                                </td>
                                <td class="price">
                                    <p class="price-value">
                                        <c:out value="${posts.price}" />
                                        <c:out value="/ ${posts.per}" />
                                    </p>

                                <td>
                                    <p class="description">
                                        Description:
                                        <c:out value="${posts.description}" />
                                    </p>
                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </body>

                </html>