<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
    <meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <link href="css/dashboard.css" rel="stylesheet">

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
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><a href="mgrview.html">Dashboard</a></li>
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
        <div class="col-md-2"></div>
        <div class="col-md-8">

            <div class="row" id="header">
                <div class="jumbotron">
                    <h2>
                        Welcome to Hive Scheduler!
                    </h2>
                    <p>
                        This is your space to manage your business and staff! You can add new employees, view the schedule as well as update the schedule.
                    </p>
                </div>
            </div>

            <!-- current employees table -->
            <div class="row" id="currentemp">
                <div class="col-md-12">
                    <h3 class="text-center">
                        Current Employees
                    </h3><br>
                    <p class="notes">View all your current employees using this tool.</p>

                    <a href="Eformhandler.jsp" class="btn btn-success btn-block btn-lg" role="button">Go</a>

                </div>
            </div>

            <!-- current schedule table -->
            <div class="row" id="currentsched">
                <div class="col-md-12">
                    <h3 class="text-center">
                        Current Schedule
                    </h3><br>
                    <p class="notes">View the current schedule using this tool.</p>

                    <a href="formhandler.jsp" class="btn btn-success btn-block btn-lg" role="button">Go</a>
                </div>
            </div>

        </div>
        <div class="col-md-2"></div>
    </div>
</div>


<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


</body>
</html>


