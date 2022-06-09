<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="ISO-8859-1">
				<link rel="stylesheet" type="text/css" href="/css/login.css" />
				<title>Register</title>
			</head>

			<body>
				<form:form action="/registration" method="post" modelAttribute="newUser">
					<div class="form-input">
						<form:label class="form-label" path="name"> Name</form:label>
						<form:errors class="text-danger" path="name" />
						<form:input class="form-control" path="name" />
					</div>
					<div class="form-input">
						<form:label class="form-label" path="email">Email</form:label>
						<form:errors class="text-danger" path="email" />
						<form:input class="form-control" path="email" />
					</div>
					<div class="form-group">
						<form:label class="form-label" path="dob">Date Of Birth:</form:label>
						<form:errors class="text-danger" path="dob" />
						<form:input type="date" class="form-control" path="dob" />
					</div>
					<div class="form-group">
						<form:label class="form-label" path="password">Password</form:label>
						<form:errors class="text-danger" path="password" />
						<form:password class="form-control" path="password" />
					</div>
					<div class="form-group">
						<form:label class="form-label" path="confirmPassword">Confirm Password</form:label>
						<form:errors class="text-danger" path="confirmPassword" />
						<form:password class="form-control" path="confirmPassword" />
					</div>
					<button class="btn btn-primary">Submit</button>
				</form:form>
			</body>

			</html>