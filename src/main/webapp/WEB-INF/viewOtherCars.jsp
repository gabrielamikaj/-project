<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 03/02/2024
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Cars</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-3">Welcome</h1>
        <h2>Choose a Car </h2>
        <div class="d-flex justify-content-between">
            <a href="/viewOtherCars" class="btn btn-outline-secondary">All Cars</a>
            <a href="/myCars" class="btn btn-outline-secondary">My Cars</a>
            <a href="/newCar" class="btn btn-outline-secondary">Add a Car</a>
            <a href="/logout" class="btn btn-outline-secondary">Logout</a>
        </div>

        <a href="${pageContext.request.contextPath}/downloadCSV" class="btn btn-primary">Download CSV</a>

        <table class="table table-striped mt-4">
        <thead>
        <tr>
            <th>Car Name</th>
            <th>Type </th>
            <th>Year</th>
            <th>Brand</th>
            <th>Seats</th>
            <th>Fuel</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cars" items="${cars}">
            <tr>
                <td><a href="/cars/${cars.id}"><c:out value="${cars.carName}"/></a></td>
                <td>${cars.type}</td>
                <td>${cars.year}</td>
                <td>${cars.brand}</td>
                <td>${cars.seats}</td>
                <td>${cars.fuel}</td>
                <td>${cars.price}</td>
                <td><a href="/cars/${cars.id}/rent" class="btn btn-primary btn-sm">Book</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>