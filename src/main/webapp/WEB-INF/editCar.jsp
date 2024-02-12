<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 03/02/2024
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/style.css">

</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card signup">
                    <div class="card-body">
                        <h2 class="text-center">Edit the Car</h2>
                        <h5 class=text-center">Make changes if you want </h5>
                        <h7><a href="/myCars">Cancel</a></h7>
                        <form:form method="put" action="/cars/${carEdit.id}/edit" modelAttribute="carEdit" enctype="multipart/form-data">


                        <div class="form-group">
            <form:errors path="carName" class="error"/>
            <form:label for="carName" path="carName" class="purple">Name:</form:label>
            <form:input type="text" path="carName" class="form-control"/>
        </div>

        <div class="form-group">
            <form:errors path="type" class="error"/>
            <form:label  for="type" path="type" class="purple">Type:</form:label>
            <form:input type="text" path="type" class="form-control"/>
        </div>

        <div class="form-group">
            <form:errors path="year" class="error"/>
            <form:label for="year" path="year" class="purple" >Year:</form:label>
            <form:input type="date" path="year" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="brand" class="error"/>
            <form:label for="brand" path="brand" class="purple" >Brand:</form:label>
            <form:input type="text" path="brand" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="seats" class="error"/>
            <form:label for="seats" path="seats" class="purple" >Seats:</form:label>
            <form:input type="number" path="seats" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="fuel" class="error"/>
            <form:label for="fuel" path="fuel" class="purple" >Fuel:</form:label>
            <form:input type="text" path="fuel" class="form-control"/>
        </div>
        <div class="form-group">
            <form:errors path="price" class="error"/>
            <form:label for="price" path="price" class="purple" >Price:</form:label>
            <form:input type="number" path="price" class="form-control"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn buttom-submit btn-block">Submit</button>
        </div>
        </form:form>
</body>
</html>