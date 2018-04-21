<%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/13/2018
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import= "man.manager" %>
<%@ page import ="com.util.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%! ArrayList<schedule> list = new ArrayList();%>
<html>
<head>
    <title>Current Schedule</title>
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
            <div class="row" id="currentemp1">
                <div class="col-md-12">
                    <h3 class="text-center">
                        Current Schedule
                    </h3><br>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>
                                Employee Name
                            </th>
                            <th>
                                Day Scheduled
                            </th>
                            <th>
                                Time In
                            </th>
                            <th>
                                Time Out
                            </th>
                        </tr>
                        </thead>
                        <tbody>
<%
    try {
        Connection conn = dbconnection.getMySQLConnection();
        PreparedStatement stmt = null;
        ResultSet rs;
        String sql, temp;
        manager m1 = new manager();
        Date date;
        Time time;
        String stime;

        if(conn != null)
        {
            sql = "select e.ssn from employees as e where e.firstname=? and e.lastname=?";
            stmt = conn.prepareStatement(sql);
            temp =  request.getParameter("firstname");

            stmt.setString(1, temp);     //GETS first name of the employese and queris the database
            temp = request.getParameter("lastname");
            stmt.setString(2, temp);     // to get the empoyees EID
            rs = stmt.executeQuery();

            schedule s = new schedule();
          if(rs.next())
                 s.setEid(rs.getInt(1));                  //once the eid is found, a schuedule object is created to pass to the
                                                 // update schedule function in the manager class
            stime = request.getParameter("stime");

       try {
          if(stime != null)
          { date = new SimpleDateFormat("HH:mm").parse(stime);      /// the request object returns strings --> must convert to
            time = new Time(date.getTime());                        /// time since stime is of type time

            s.setStime(time);
            stime = request.getParameter("etime");

            date = new SimpleDateFormat("HH:mm").parse(stime);
            time = new Time(date.getTime());

            s.setDay(request.getParameter("day"));
            s.setEtime(time);}
        }
        catch(ParseException e){                      // throws an exception for the time conversion
            e.printStackTrace();
        }
        list = m1.UpdateSchedule(s);      //CALLS the updateschedule function to add the employee to the current schedule

        String x;
        sql = "select e.firstname, e.lastname, s.stime, s.etime, s.day from schedule as s, employees as e where e.SSN = s.eid";

        rs = stmt.executeQuery(sql);
        while(rs.next())
        {
            out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getString(5) + "</td><td>"+
                    rs.getTime(3) +"</td><td>" + rs.getTime(4)+"</td></tr>");
        }
        stmt.close();
    }}
    catch(SQLException s)
    {s.printStackTrace();}

%>
                        </tbody>
                    </table>
                    <a href="schedule-form.jsp" class="btn btn-success btn-block" role="button">Update Schedule</a>
                    <a  href = "index.jsp" class="btn btn-danger btn-block" role="button" >Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

