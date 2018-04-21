<%@ page import="com.util.employee" %>
<%@ page import="man.manager" %><%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/17/2018
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Employee</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <link href="css/empadd.css" rel="stylesheet">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Hive Scheduler</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#GOTOMAINHOME">Home</a></li>
                <li><a href="index.jsp">Dashboard</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!-- <li><a href="signup.html">Signup</a></li> -->
                <li><a href="#">Log Out</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid bg">

    <div class="row">

        <div class="col-md-3"></div>
        <div class="col-md-6">

            <div class="row" id="form">

                <p><h1 id="heading">Add New Employee</h1></p>

                <form action = "Eformhandler.jsp" method = "GET">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" name = "firstname" id="firstName" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" name="lastname" id="lastName" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <label for="jobID">JobID</label>
                        <input type="text" class="form-control" name="jid" id="jobID" placeholder="JobID">
                    </div>
                    <div class="form-group">
                        <label for="wage">Wage</label>
                        <input type="text" class="form-control" name="wage" id="wage" placeholder="Wage">
                    </div>
                    <div class="form-group">
                        <label for="ssn">SSN</label>
                        <input type="tel" class="form-control" name="SSN" id="ssn" placeholder="SSN">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone Number">
                    </div>
                    <div class="form-group">
                        <label for="locID">Location ID</label>
                        <input type="text" class="form-control" name = "lid" id="locID" placeholder="Location ID">
                    </div>

                    <button type="submit" class="btn btn-success btn-block">Submit</button>

                    <a href="Eformhandler.jsp" class="btn btn-danger btn-block" role="button">Back</a>

                </form>

            </div>

        </div>
        <div class="col-md-3"></div>

    </div>

</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


</body>
</html>

