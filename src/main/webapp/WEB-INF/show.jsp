<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 03/02/2024
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" type="text/css" href="/style.css">
        <link rel="stylesheet" type="text/css" href="/showStyle.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <title>Car Rental</title>
    </head>
    <body>
    <div class="container">
        <div class="image-section">
            <img src="/caryellow.jpg" alt="Car Image">
        </div>
        <div class="text-section">
            <h4><a href="/viewOtherCars">Dashboard</a></h4>
            <h1>Car Details</h1>
            <p>Here we are showing details for: <c:out value="${cars.carName}"></c:out></p>
            <p><strong>BRAND:</strong>  <c:out value="${cars.brand}"></c:out></p>
            <p><strong>TYPE:</strong> <c:out value="${cars.type}"></c:out></p>
            <p><strong>SEATS:</strong> <c:out value="${cars.seats}"></c:out></p>
            <p><strong>FUEL:</strong> <c:out value="${cars.fuel}"></c:out></p>
            <p><strong>PRICE PER DAY:</strong> <c:out value="${cars.price}"></c:out></p>
        </div>
    </div>
    </body>
    </html>