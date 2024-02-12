<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 04/02/2024
  Time: 23:39
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
<h2>Rent a Car</h2>
<h7><a href="/viewOtherCars">Cancel</a></h7>
<form:form action="/cars/${car.id}/rent" method="post" modelAttribute="orderRent" class="visa-card">
    <div class="form-group">
        <form:errors path="rentalStartDate" class="error"/>
        <form:label for="rentalStartDate" path="rentalStartDate">rentalStartDate:</form:label>
        <form:input type="date" path="rentalStartDate" class="form-control"/>
    </div>
    <div class="form-group">
        <form:errors path="rentalEndDate" class="error"/>
        <form:label for="rentalEndDate" path="rentalEndDate">rentalEndDate::</form:label>
        <form:input type="date" path="rentalEndDate" class="form-control"/>
    </div>
        <div class="logoContainer">
        </div>
        <div class="form-group">
            <form:errors path="cardNumber" class="error"/>
            <form:label path="cardNumber">CARD NUMBER</form:label>
            <form:input path="cardNumber" class="inputstyle" placeholder="XXXX XXXX XXXX XXXX"/>
        </div>

        <div class="form-group">
            <form:errors path="month" class="error"/>
            <form:label path="month">VALID THRU (Month)</form:label>
            <form:input path="month" class="inputstyle" placeholder="MM" type="number"/>
        </div>

        <div class="form-group number-container">
            <form:errors path="year" class="error"/>
            <form:label path="year">VALID THRU (Year)</form:label>
            <form:input path="year" class="inputstyle" placeholder="YYYY" type="number"/>
        </div>

        <div class="form-group cvv-wrapper">
            <form:errors path="cvv" class="error"/>
            <form:label path="cvv">CVV</form:label>
            <form:input path="cvv" class="inputstyle" type="password"/>
        </div>

        <button type="submit" class="btn btn-primary">Rent Car</button>
    </form:form>
</body>
</html>