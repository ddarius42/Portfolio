<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<link rel="stylesheet" href="/css/dashboard.css">
				<meta charset="ISO-8859-1">
				<title>Dashboard</title>
			</head>

			<body>
				<div class="nav">

					<a href="/dashboard">
						<h1 class="title"> CanIBorrow!</h1>
					</a>

					<ul>
						<li class="nav-link"><a class="nav-link" href="/newPost">New Post</a></li>
						<li class="nav-link"><a class="nav-link" href="/profile/${loggedInUser.id}">Profile</a></li>
						<li class="nav-link"><a class="nav-link" href="/logout">Logout</a></li>
					</ul>
				</div>

				<table>
					<c:forEach items="${posts}" var="post">
						<tr onclick="location.href='/post/${post.id}';" style="cursor:pointer;">
							<td class="post-title">
								<c:out value="${post.title}" />
							</td>
							<td>
								<img src="${post.image}" alt="image of ${post.title}">
							</td>
							<td class="price">
								<c:out value="${post.price}" />
								<c:out value="/ ${post.per}" />
							</td>
						</tr>
					</c:forEach>
					</div>
				</table>

			</body>

			</html>