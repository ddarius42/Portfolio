<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html>


			<head>
				<meta charset="ISO-8859-1">
				<link rel="stylesheet" type="text/css" href="/css/login.css" />
				<title>Can I Borrow!</title>
			</head>

			<body>
				<h1>Can I Borrow!</h1>
				<h2> Welcome! This is a platform where users can interact with people around them and share
					tools, cars, equipment and much more. </h2>
				<h3>Login</h3>
				<form:form class="form" action="/login" method="post" modelAttribute="newLogin">

					<div class="form-group">
						<form:label class="form-label" path="email">Email: </form:label>
						<form:errors path="email" />
						<form:input class="form-input" path="email" />
					</div>
					<div class="form-group">
						<form:label class="form-label" path="password">Password: </form:label>
						<form:errors path="password" />
						<form:password class="form-input" path="password" />
					</div>
					<button class="form-login">Login</button>


				</form:form>
				<a class="register" href="/register">Don't have an account? Register Here!!!</a>

			</body>

			</html>