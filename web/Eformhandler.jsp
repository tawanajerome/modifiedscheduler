<%@ page import="com.util.employee" %>
<%@ page import="man.manager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.dbconnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/17/2018
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Current Employees</title>
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
        <div class="col-md-12">

        <%
    employee newemp = new employee();
    manager man = new manager();
    try
    {
        newemp.setssn(Integer.parseInt(request.getParameter("SSN")));
        newemp.setfirstname(request.getParameter("firstname"));
        newemp.setlastname(request.getParameter("lastname"));
        newemp.setemail(request.getParameter("email"));
        newemp.setjid(Integer.parseInt(request.getParameter("jid")));
        newemp.setlid(Integer.parseInt(request.getParameter("lid")));
        newemp.setphone(request.getParameter("phone"));
        newemp.setwage(Integer.parseInt(request.getParameter("wage")));

        man.addEmployee(newemp);

    }

    catch(NumberFormatException e)
    {e.getStackTrace();}


%>
            <div class="row" id="currentemp1" >
                <div class="col-md-12">
                    <h3 class="text-center">
                        Current Employees
                    </h3><br>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Wage
                            </th>
                        </tr>
                        </thead>
                        <tbody>


        <%
     ///////////OUTPUTS a table of all the employees and their wages
     try
     {
         Connection conn = dbconnection.getMySQLConnection();
         Statement stmt;
         if (conn != null)
           {  stmt = conn.createStatement();
         ResultSet rs;
         String sql;
         sql = "Select e.firstname,e.lastname,e.SSN,e.wage from employees as e";
         rs = stmt.executeQuery(sql);
         while(rs.next())
         { out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getInt(3) + "</td><td>"
                + rs.getInt(4) +"</td></tr>");
         }
         stmt.close(); }

     }
     catch (SQLException e) {
         e.printStackTrace();}
 %>
                    </table>
                    <a href="employee-form.jsp" class="btn btn-success btn-block" role="button">Add New Employee</a>
                    <a class="btn btn-danger btn-block" role="button" onclick="history.back()" >Back</a>
                </div>
            </div>

        </div>
    </div>
</div>


</body>
</html>
