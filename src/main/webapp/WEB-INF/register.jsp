<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 03/02/2024
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card signup">
                <div class="card-body">
                    <h2 class="text-center">Welcome to GM Car-Rental</h2>
                    <h5 class="text-center">Sign Up</h5>
                    <h7 class=text-center">Please put your credentials </h7>
                    <%--@elvariable id="newUser" type=""--%>
                    <form:form action="/register" modelAttribute="newUser" class="form">
                        <div class="form-group">
                            <form:errors path="userName"/>
                            <form:label for="userName" path="userName">UserName:</form:label>
                            <form:input type="text" path="UserName" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <form:errors path="email"/>
                            <form:label for="email" path="email">Email:</form:label>
                            <form:input type="text" path="email" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <form:errors path="password"/>
                            <form:label for="password" path="password">Password:</form:label>
                            <form:input type="text" path="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <form:errors path="confirm"/>
                            <form:label for="" path="confirm">Confirm:</form:label>
                            <form:input type="text" path="confirm" class="form-control"/>
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn buttom-submit btn-block">Submit</button>
                            <a href="/">Back</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>