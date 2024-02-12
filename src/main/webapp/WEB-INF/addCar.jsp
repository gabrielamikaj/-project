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
    <meta http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental</title>
    <link rel="stylesheet" href="/cssReset.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/welcomecss.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card signup">
                <div class="card-body">
                    <h2 class="text-center">Add a Car</h2>
                    <h5 class=text-center">Please fill this out </h5>
                    <h7><a href="/viewOtherCars">Cancel</a></h7>
        <form:form action="/newCar" modelAttribute="car" class="form" method="post" enctype="multipart/form-data">

        <div class="form-group">
            <form:errors path="carName" class="error"/>
            <form:label for="carName" path="carName">Name:</form:label>
            <form:input type="text" path="carName" class="form-control"/>
        </div>

        <div class="form-group">
            <form:errors path="type" class="error"/>
            <form:label for="type" path="type">Type:</form:label>
            <form:input type="text" path="type" class="form-control"/>
        </div>

        <div class="form-group">
            <form:errors path="year" class="error"/>
            <form:label for="year" path="year">Year:</form:label>
            <form:input type="date" path="year" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="brand" class="error"/>
            <form:label for="brand" path="brand">Brand:</form:label>
            <form:input type="text" path="brand" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="seats" class="error"/>
            <form:label for="seats" path="seats">Seats:</form:label>
            <form:input type="number" path="seats" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="fuel" class="error"/>
            <form:label for="fuel" path="fuel">Fuel:</form:label>
            <form:input type="text" path="fuel" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="price" class="error"/>
            <form:label for="price" path="price">Price:</form:label>
            <form:input type="number" path="price" class="form-control"/>
        </div>

        <div class="form-group">
            <button type="submit" class="btn buttom-submit btn-block">Add</button>
        </div>

        </form:form>
</body>
</html>